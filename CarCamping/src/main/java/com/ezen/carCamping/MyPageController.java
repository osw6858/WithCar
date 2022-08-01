package com.ezen.carCamping;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.PointLogDTO;
import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.dto.QuestionDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.RentalLogDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.pagination.Pagination;
import com.ezen.carCamping.service.MemberMapper;
import com.ezen.carCamping.service.MyPageMapper;
import com.ezen.carCamping.service.ProductMapper;
import com.ezen.carCamping.service.RegionMapper;
import com.ezen.carCamping.service.S3FileService;



@Controller
public class MyPageController {

	@Autowired
	private MyPageMapper myPageMapper;


	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private S3FileService S3FileService;

	@Autowired
	private RegionMapper RegionMapper;
	@Autowired
	private ProductMapper productMapper;

	@Resource(name="uploadPath")
	private String uploadPath;


	private static Pagination pagination = Pagination.getInstance();

	@RequestMapping("/myPageCart.myPage")
	public String myPageCart(HttpServletRequest req, ProductCartDTO dto){
		HttpSession session = req.getSession();
		int res = myPageMapper.insertCart(dto);
		if (res > 0) {
			System.out.println("장바구니 넣기 성공");
		}
		else {
			System.err.println("장바구니 넣기 실패");
		}
		int mem_num = (int)session.getAttribute("mem_num");
		List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
		session.setAttribute("cartList", list);
		return "myPage/myPageCart";
	}

	@RequestMapping("/myPageCart2.myPage") // 탑에서 장바구니 갈때
	public String myPageCart2(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("mem_num") == null) {
			String msg = "로그인 하셔야 합니다";
			String url = "login.login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else {
			int mem_num = (int) session.getAttribute("mem_num");
			List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
			session.setAttribute("cartList", list);
		}
		return "myPage/myPageCart";
	}

	@RequestMapping("mall_cartEdit.myPage") // 카트수정
	public String mall_cartEdit(HttpServletRequest req, int cart_prodCount, int prod_num, String cart_from,
			String cart_to) {
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		if (cart_prodCount <= 0) {
			session.setAttribute("msg", "등록된 상품을 삭제 했습니다.");
			session.setAttribute("url", "mall_cartDel.myPage?prod_num=" + prod_num);
			return "message";
		} else {
			for (ProductCartDTO cartDTO : cart) {
				if (prod_num == cartDTO.getProductDTO().getProd_num() && cart_from.equals(cartDTO.getCart_from())
						&& cart_to.equals(cartDTO.getCart_to())) {
					cartDTO.setCart_prodCount(cart_prodCount);
					int res = myPageMapper.updateCart(cartDTO);
					if (res > 0) {
						System.out.println("업데이트성공");
					} else {
						System.out.println("업데이트 실패");
					}
					break;
				}
			}
		}
		return "myPage/myPageCart";
	}

	@RequestMapping("mall_cartDel.myPage") // 카트삭제
	public String mall_cartDel(HttpServletRequest req, @RequestParam int prod_num, int cart_num, String cart_from,
			String cart_to) {
		HttpSession session = req.getSession();
		List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		for (ProductCartDTO cartDTO : cart) {
			if (prod_num == cartDTO.getProductDTO().getProd_num() && cart_from.equals(cartDTO.getCart_from())
					&& cart_to.equals(cartDTO.getCart_to())) {
				cart.remove(cartDTO);
				int res = myPageMapper.deleteCart(cart_num);
				if (res > 0) {
					System.out.println("삭제 성공");
				} else {
					System.out.println("삭제 실패");
				}
				break;
			}
		}
		return "myPage/myPageCart";
	}

	@RequestMapping("checkOut.myPage")//장바구니 결제버튼 눌렀을때
	public String checkOut(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int mem_num = (int) session.getAttribute("mem_num");
		List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
		String msg = null, url = null;
		if (list.size() == 0) {
			msg = "장바구니가 비었습니다! 상품을 추가해 주세요";
			msg = "장바구니가 비었습니다! 용품을 장바구니에 추가해 주세요!";
			url = "goProduct.product";
		} else {
			msg = "결제 페이지로 이동합니다!";
			url = "Pay.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}


	@RequestMapping("Pay.myPage")//결제폼
	public String myPageCheckOut1(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int mem_num = (int) session.getAttribute("mem_num");
		List<ProductCartDTO> list = myPageMapper.cartProduct(mem_num);
		session.setAttribute("cartList", list);
		return "myPage/myPagePay";
	}


	@RequestMapping("myPageCheckOut.myPage")//결제폼에서 결제버튼 눌렀을떄
	public String myPageCheckOut2(HttpServletRequest req, int cart_num
			,RentalLogDTO dto, @RequestParam Map<String, String> params,@RequestParam Map<String, String> params2, int rental_usePoint) {
		HttpSession session = req.getSession();
		//List<ProductCartDTO> cart = (List) session.getAttribute("cartList");
		int res2 = myPageMapper.insertCartLog(params);
		if (res2 > 0) {
			System.out.println("로그 입력 성공");
		} else {
			System.out.println("삭로그 입력제 실패");
		}
		int res3 = myPageMapper.updateCartLogPoint(params2);
		if (res3 > 0) {
			System.out.println("포인트 변경 성공");
		} else {
			System.out.println("포인트 변경 실패");
		}

		//로그 테이블에 인서트 할 곳
		//int mem_num = (int) session.getAttribute("mem_num");
		int res = myPageMapper.payCart(cart_num);

		if (res > 0) {
			System.out.println("결제후 장바구니 삭제 성공");
		} else {
			System.err.println("결제후 장바구니 삭제 실패");
		}
		return "myPage/myPageCheckOut";
	}

	//----------------------------------------------------------------------------------------------------


	@RequestMapping(value = "myPageProfile.myPage", method = RequestMethod.GET)
	public String memberUpdate(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");  
		int mem_num = dto.getMem_num();
		MemberDTO res = memberMapper.getMember(mem_num);
		req.setAttribute("getMember", res);


		return "myPage/myPageProfile";
	}


	@RequestMapping(value="myPageProfile.myPage", method=RequestMethod.POST)
	public String memberUpdateOk(HttpServletRequest req, @ModelAttribute MemberDTO dto, BindingResult result) {
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("mem_image");
		RegionDTO rdto = new RegionDTO();
		String filename = mf.getOriginalFilename();
		String PreFile = req.getParameter("mem_image2");


		if (filename != null && !(filename.trim().equals(""))) {
			S3FileService.deleteImage(PreFile);
			File file = new File(uploadPath, filename);

			try {
				dto.setMem_image(S3FileService.upload(mf));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			

		}else {

			dto.setMem_image(PreFile);
		}

		rdto.setRegion_num(Integer.parseInt(req.getParameter("region_num")));
		dto.setRegionDTO(rdto);

		int res = memberMapper.updateMember(dto);
		String msg = null, url = null;
		if (res>0) {
			msg = "내정보 수정 성공!";
			url = "index.do";
		}else {
			msg = "내정보 수정 실패! 다시 시도해 주세요.";
			url = "myPageProfile.myPage?mem_num=" + dto.getMem_num();
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	 @RequestMapping("/checkNick.myPage")
     public String myPagecheckNick(HttpServletRequest req, @RequestParam String mem_nickName) {   
          MemberDTO dto = memberMapper.getMemberNick(mem_nickName);
           int result = -1;
          if (dto == null){   
              result= 1;
           }else {
              result = 0;
           }
          req.setAttribute("result", result);
           return "login/checkNick";
        }



	@RequestMapping("/myPageQuestion.myPage")//마이페이지 문의목록
	public String myPageQuestion(HttpServletRequest req, @RequestParam(required=false,defaultValue="1") int page) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		int mem_num = dto.getMem_num();
		List<QuestionDTO> qdto =  new ArrayList<QuestionDTO>();

		qdto = myPageMapper.myPageGetQuestionSelectMember(mem_num);
		req.setAttribute("listBoard", qdto);
		req.setAttribute("pageCount", pagination.pageCount(qdto));
		req.setAttribute("listBoard", pagination.getPagePost(page,qdto));
		return "myPage/myPageQuestion";
	}


	@RequestMapping(value="myPageContactUs.myPage", method=RequestMethod.GET)//마이페이지 컨텍어스
	public String myPageContactUs() {
		return "myPage/myPageContactUs";
	}

	@RequestMapping(value = "myPageContactUs.myPage", method = RequestMethod.POST)
	public String myPageContactUsOk(HttpServletRequest req, QuestionDTO qdto, @RequestParam int mem_num) {
		MemberDTO dto = new MemberDTO();
		dto.setMem_num(Integer.parseInt(req.getParameter("mem_num")));
		qdto.setMemberDTO(dto);
		req.setAttribute("mem_num", mem_num);
		int res = myPageMapper.insertQuestion(qdto);
		if (res > 0) {
			req.setAttribute("msg", "문의사항을 접수했습니다.");
		} else {
			req.setAttribute("msg", "문의사항을 접수하지 못했습니다. 다시 입력해 주세요.");
		}
		return "message";
	}

	@RequestMapping("/myPageContactUsView.myPage")
	public String myPageContactUsView(HttpServletRequest req, @RequestParam int question_num) {
		QuestionDTO qdto = myPageMapper.getQuestion(question_num);
		req.setAttribute("getQuestion", qdto);
		return "myPage/myPageContactUsView";
	}

	@RequestMapping("/myPageQuestionReply.myPage")
	public String myPageQuestionReply(HttpServletRequest req, @RequestParam int question_num) {
		QuestionDTO qdto = myPageMapper.getQuestion(question_num);
		req.setAttribute("getQuestion", qdto);
		return "myPage/myPageQuestionReply";
	}



	// 전용재 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ + 수정 (송재영 07/06)
	   @RequestMapping("/myPageLikeReview.myPage")
	   public String myPagaLikeReview(HttpServletRequest req,@RequestParam (required = false) String mode,
	         @RequestParam(value="page",defaultValue="1") int page) {
	      HttpSession session = req.getSession();
	      int mem_num = (int) session.getAttribute("mem_num");
	      if(mode==null||mode.equals("")) {
	    	  List<ReviewRegionDTO>list = myPageMapper.ReviewRegionList(mem_num);
		         session.setAttribute("ReviewRegionList", pagination.getPagePost(page, list));
		         req.setAttribute("page", page);
		         req.setAttribute("pageCount", pagination.pageCount(list));
		         req.setAttribute("mode", "ReviewRegionList");
		         
		      }else if(mode.equals("ReviewProductList")) {  
		         List<ReviewProductDTO>list = myPageMapper.ReviewProductList(mem_num);
		         session.setAttribute("ReviewProductList", pagination.getPagePost(page, list));
		         req.setAttribute("page", page);
		         req.setAttribute("pageCount", pagination.pageCount(list));
		         req.setAttribute("mode", mode);
		         
		      }else if(mode.equals("ReviewRegionList")) {
		         List<ReviewRegionDTO>list = myPageMapper.ReviewRegionList(mem_num);
		         session.setAttribute("ReviewRegionList", pagination.getPagePost(page, list));
		         req.setAttribute("page", page);
		         req.setAttribute("pageCount", pagination.pageCount(list));
		         req.setAttribute("mode", mode);
		      }
	      return "myPage/myPageLikeReview";
	   }   
	   
	   
	   @RequestMapping("/myPageProductReview.myPage")
	   public String myPageProductReview(HttpServletRequest req) {
	      int mem_num = Integer.parseInt(req.getParameter("mem_num"));
	      int rp_num = Integer.parseInt(req.getParameter("rp_num"));
	      HttpSession session = req.getSession();
	      MemberDTO dto = (MemberDTO) session.getAttribute("mbdto");
	      String id = dto.getMem_id();
	      session.setAttribute("id", id);
	      if (id==null || id.equals("")) req.setAttribute("check", 0);
	      else{
	         int check = myPageMapper.CountProductReviewLikeLog(id, rp_num);
	         System.out.println(check);
	         req.setAttribute("check", check);
	      }
	      ReviewProductDTO rplist =myPageMapper.ReviewProductNum(rp_num);
	      req.setAttribute("mem_num", mem_num);
	      req.setAttribute("rplist", rplist);
	      Class<? extends ReviewProductDTO> cls = rplist.getClass();
	      List<String> reviewImages = new java.util.ArrayList<>();
	      for(int i=1;i<=5;i++) {
	         String imageVar = "rp_image"+i;
	         System.out.println(imageVar);
	         try {
	            java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
	            f.setAccessible(true);
	            String imageSrc = (String)f.get(rplist);
	            if(imageSrc!=null) {
	               reviewImages.add(imageSrc);
	            }
	         }catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      
	      req.setAttribute("reviewImageList", reviewImages);
	      return "myPage/myPageProductReview";
	   }

	   @RequestMapping("/myPageRegionReview.myPage")
	   public String myPageRegionReview(HttpServletRequest req) {
	      int mem_num = Integer.parseInt(req.getParameter("mem_num"));
	      int review_num = Integer.parseInt(req.getParameter("review_num"));
	      System.out.println(review_num);
	      HttpSession session = req.getSession();
	      MemberDTO dto = (MemberDTO) session.getAttribute("mbdto");
	      String id = dto.getMem_id();
	      session.setAttribute("id", id);
	      
	      if (id==null || id.equals("")) req.setAttribute("check", 0);
	      else{
	         int check = myPageMapper.CountReviewLikeLog(id, review_num);
	         System.out.println(check);
	         req.setAttribute("check", check);
	      }
	      ReviewRegionDTO rrlist=myPageMapper.ReviewRegionNum(review_num);
	      req.setAttribute("mem_num", mem_num);
	      req.setAttribute("rrlist", rrlist);
	      Class<? extends ReviewRegionDTO> cls = rrlist.getClass();
	      List<String> reviewImages = new java.util.ArrayList<>();
	      for(int i=1;i<=5;i++) {
	         String imageVar = "review_regionImage"+i;
	         System.out.println(imageVar);
	         try {
	            java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
	            f.setAccessible(true);
	            String imageSrc = (String)f.get(rrlist);
	            if(imageSrc!=null) {
	               reviewImages.add(imageSrc);
	            }
	         }catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      
	      req.setAttribute("reviewImageList", reviewImages);
	      return "myPage/myPageRegionReview";
	   }

	@RequestMapping("/DeleteProductReview.myPage")
	public String DeleteProductReview(HttpServletRequest req,@RequestParam Map<String,String> map) {
		//		int mem_num = Integer.parseInt(req.getParameter("mem_num"));
		int rp_num = Integer.parseInt(req.getParameter("rp_num"));
		int res = myPageMapper.DeleteProductReview(map);

		String msg =null, url = null;
		if (res>0) {
			res = myPageMapper.UpdateProductLikeLog(rp_num);
			msg = "목록에서 삭제되었습니다";
			url = "myPageLikeReview.myPage";
		}else {
			msg = "목록에서 실패되었습니다. 서비스 센터에 문의하세요";
			url = "myPageLikeReview.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message"; 
	}
	@RequestMapping("/DeleteReviewReview.myPage")
	public String DeleteReviewReview(HttpServletRequest req,@RequestParam Map<String,String> map){
		int res = myPageMapper.DeleteRegionReveiw(map);
		int review_num = Integer.parseInt(req.getParameter("review_num"));
		String msg =null, url = null;
		if (res>0) {
			res = myPageMapper.UpdateRegionLikeLog(review_num);
			msg = "목록에서 삭제되었습니다";
			url = "myPageLikeReview.myPage";
		}else {
			msg = "목록에서 실패되었습니다. 서비스 센터에 문의하세요";
			url = "myPageLikeReview.myPage";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}


	@RequestMapping("/myPageTest.myPage")
	public String myPageTest() { 
		return "myPage/myPageTest"; 
	}

	@RequestMapping(value = "memberDelete.myPage", method = RequestMethod.GET)
	public String memberDelete() {
		return "myPage/memberDelete";
	}

	@RequestMapping(value = "memberDelete.myPage", method = RequestMethod.POST)
	public String memberDeleteOK(HttpServletRequest req, String raw_password) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("mbdto");
		int mem_num = dto.getMem_num();

		String mem_password = memberMapper.getMemberPassword(mem_num);
		if (mem_password.equals(raw_password)) {
			int res = memberMapper.deleteMember(mem_num, mem_password);

			if (res > 0) {
				session.invalidate();

				req.setAttribute("msg", "회원 탈퇴되었습니다.");
				req.setAttribute("url", "index.do");
			} else {
				req.setAttribute("msg", "회원 탈퇴에 실패하였습니다. 다시 시도해주세요.");
				req.setAttribute("url", "memberDelete.myPage");
			}
		} else {
			req.setAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			req.setAttribute("url", "memberDelete.myPage");
		}

		return "message";
	}


	   @RequestMapping("/myPageWriteReview.myPage")//마이페이지 내가 쓴 리뷰목록
	   public String myPageWriteReview(HttpServletRequest req, @RequestParam(required = false) String mode,
	         @RequestParam(required=false) String adminConfirm,@RequestParam(required=false,defaultValue="1") int page) {
	      HttpSession session = req.getSession();
	      MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
	      int mem_num = dto.getMem_num();
	      if (mode == null) { // adminConfirm=0 : 승인된 리뷰
	         List<ReviewRegionDTO> rdto =  new ArrayList<ReviewRegionDTO>();
	         rdto = myPageMapper.myPageGetWriteReviewRegion(mem_num);
	         req.setAttribute("pageCount", pagination.pageCount(rdto));
	         req.setAttribute("listRegion", pagination.getPagePost(page,rdto));
	         if(adminConfirm!=null) { // adminConfirm = 1 : 승인되지 않은 리뷰
	            List<ReviewRegionDTO> rdto_1 =  new ArrayList<ReviewRegionDTO>();
	            rdto_1 = myPageMapper.myPageGetWriteReviewRegion_1(mem_num);
	             req.setAttribute("pageCount", pagination.pageCount(rdto_1));
	             req.setAttribute("listRegion", pagination.getPagePost(page,rdto_1)); 
	         }
	      }else {
	         List<ReviewProductDTO> pdto =  new ArrayList<ReviewProductDTO>();
	         pdto = myPageMapper.myPageGetWriteReviewProduct(mem_num);
	         req.setAttribute("pageCount", pagination.pageCount(pdto));
	         req.setAttribute("listProduct", pagination.getPagePost(page,pdto));
	         if(adminConfirm!=null) { // adminConfirm = 1 : 승인되지 않은 리뷰
	            List<ReviewProductDTO> pdto_1 =  new ArrayList<ReviewProductDTO>();
	            pdto_1 = myPageMapper.myPageGetWriteReviewProduct_1(mem_num);
	             req.setAttribute("pageCount", pagination.pageCount(pdto_1));
	             req.setAttribute("listProduct", pagination.getPagePost(page,pdto_1));
	         }
	      }
	      req.setAttribute("page", page);
	      return "myPage/myPageWriteReview";
	   }
	   
	@RequestMapping("/myPageWriteReviewRegionView.myPage")
	public String myPageWriteReviewRegionView(HttpServletRequest req, HttpServletResponse rep, @RequestParam int review_num) {
		ReviewRegionDTO rdto = myPageMapper.getReviewRegion(review_num);
		req.setAttribute("getReviewRegion", rdto);
		///////////////////////////////////////////////////////////////////////////
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mbdto");
		if(mdto!=null) {
			session.setAttribute("mem_num", mdto.getMem_num());
			session.setAttribute("mem_id", mdto.getMem_id());
		}else if(mdto == null){
			req.setAttribute("msg", "로그인을 하시여 리뷰를 볼 수 있습니다 !\n로그인창으로 이동합니다.");
			req.setAttribute("url","login.login");
			return "message";
		}

		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;

		if (cookies != null && cookies.length > 0) { 
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("cookie"+review_num)) viewCookie = cookies[i]; 
			}
		}

		if (rdto != null) {

			if (viewCookie == null) {    

				Cookie newCookie = new Cookie("cookie"+review_num, "|" + review_num + "|");     
				rep.addCookie(newCookie);
				int result = RegionMapper.addReviewReadCount(review_num);
				rdto.setReview_readCount(rdto.getReview_readCount()+1);
			}

		}else { 
			return "/region/RegionErrorPage";
		}

		Class<? extends ReviewRegionDTO> cls = rdto.getClass();
		List<String> reviewImages = new java.util.ArrayList<>();
		for(int i=1;i<=5;i++) {
			String imageVar = "review_regionImage"+i;
			try {
				java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
				f.setAccessible(true);
				String imageSrc = (String)f.get(rdto);
				if(imageSrc!=null) {
					reviewImages.add(imageSrc);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

		//HttpSession session = req.getSession();
		String id = (String) req.getSession().getAttribute("mem_id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = RegionMapper.checkReviewLikeLog(id, review_num);
			req.setAttribute("check", check);
		}

		req.setAttribute("reviewImageList", reviewImages);

		return "myPage/myPageWriteReviewRegionView";
	}
	@RequestMapping("/myPageWriteReviewProductView.myPage")
	public String myPageWriteReviewProductView(HttpServletRequest req, HttpServletResponse rep, @RequestParam int rp_num) {
		ReviewProductDTO pdto = myPageMapper.getReviewProduct(rp_num);
		req.setAttribute("getReviewProduct", pdto);
		///////////////////////////////////////////////////////////////////////////
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mbdto");
		if(mdto!=null) {
			session.setAttribute("mem_num", mdto.getMem_num());
			session.setAttribute("mem_id", mdto.getMem_id());
		}else if(mdto == null){
			req.setAttribute("msg", "로그인을 하시여 리뷰를 볼 수 있습니다 !\n로그인창으로 이동합니다.");
			req.setAttribute("url","login.login");
			return "message";
		}

		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;

		if (cookies != null && cookies.length > 0) { 
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("cookie"+rp_num)) viewCookie = cookies[i];
			}
		}

		if (pdto != null) {
			if (viewCookie == null) {    
				Cookie newCookie = new Cookie("cookie"+rp_num, "|" + rp_num + "|");     
				rep.addCookie(newCookie);
				int result = productMapper.addProductReviewReadCount(rp_num);
				pdto.setRp_readCount(pdto.getRp_readCount()+1);

			}

		}else {
			return "/region/RegionErrorPage";
		}

		Class<? extends ReviewProductDTO> cls = pdto.getClass();
		List<String> rp_images = new java.util.ArrayList<>();
		for(int i=1;i<=5;i++) {
			String imageVar = "rp_image"+i;
			try {
				java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
				f.setAccessible(true);
				String imageSrc = (String)f.get(pdto);
				if(imageSrc!=null) {
					rp_images.add(imageSrc);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

		//HttpSession session = req.getSession();
		String id = (String) req.getSession().getAttribute("mem_id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = productMapper.checkProductReviewLikeLog(id, rp_num);
			req.setAttribute("check", check);
		}

		//req.setAttribute("selectedReview", pdto);
		req.setAttribute("rp_imageList", rp_images); 
		return "myPage/myPageWriteReviewProductView";
	}
	@RequestMapping("/myPageWriteReviewRegionDelete.myPage")
	public String deleteReviewRegion(HttpServletRequest req, @RequestParam int review_num) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		int mem_num = dto.getMem_num();
		////////////////////아마존 이미지 삭제//////////////////////////
		ReviewRegionDTO rdto = myPageMapper.getReviewRegion(review_num);
		Class<? extends ReviewRegionDTO> cls = rdto.getClass();
		for(int i=1;i<=5;i++) {
			String imageVar = "review_regionImage"+i;
			try {
				java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
				f.setAccessible(true);
				String imageSrc = (String)f.get(rdto);
				if(imageSrc!=null) {
					S3FileService.deleteImage(imageSrc);
				}
			}catch(Exception e){

			}
		}
		////////////////////////////////////////////////////////   
		int res = myPageMapper.deleteReviewRegion(review_num);

		String msg = null, url = null;
		if (res>0) {
			msg = "리뷰를 삭제했습니다.";
			url = "myPageWriteReview.myPage?mem_num="+mem_num;
		}else {
			msg = "리뷰를 삭제하지 못했습니다. 다시 시도해 주세요!";
			url = "myPageWriteReview.myPage?mem_num="+mem_num;
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";   

	}



	@RequestMapping("/myPageWriteReviewProductDelete.myPage")
	public String deleteReviewProduct(HttpServletRequest req, @RequestParam int rp_num) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		int mem_num = dto.getMem_num();
		int res = myPageMapper.deleteReviewProduct(rp_num);
		String msg = null, url = null;
		if (res>0) {
			msg = "리뷰를 삭제했습니다.";
			url = "myPageWriteReview.myPage?mem_num="+mem_num;
		}else {
			msg = "리뷰를 삭제하지 못했습니다. 다시 시도해 주세요!";
			url = "myPageWriteReview.myPage?mem_num="+mem_num;
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//수정(07/06 송재영)
	@RequestMapping("/myPageRental.myPage")
	   public String myPageRental(HttpServletRequest req,@RequestParam(value="page",defaultValue="1")int page,
			   @RequestParam Map<String,String> map) {
	      HttpSession session = req.getSession();
	      if (session.getAttribute("mem_num") == null) {
	         String msg = "로그인 하셔야 합니다";
	         String url = "login.login";
	         req.setAttribute("msg", msg);
	         req.setAttribute("url", url);
	         return "message";
	      } else {
	         int mem_num = (int) session.getAttribute("mem_num");
	         
	         //포인트 내역
	         List<PointLogDTO> listPointLog = myPageMapper.myPageListPointLog(mem_num);
	         req.setAttribute("listPointLog", listPointLog);
	         
	        //날짜 검색
	        if (map.get("rental_from_date") == null || map.get("rental_from_date").equals("")) {
	 			map.put("rental_from_date","2021-06-01");
//	 			Date date = new Date();
//	 			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
//	 			System.out.println(sdf.format(date));
	 		}
	 		if (map.get("rental_to_date") == null || map.get("rental_to_date").equals("")) {
	 			map.put("rental_to_date", "2100-06-01");
	 		}
	 		
	 		if (map.get("rental_date") == null || map.get("rental_date").equals("")) {
	 			map.put("rental_date", "rental_from");
	 		}
	 		req.setAttribute("rental_from_date", map.get("rental_from_date"));
			req.setAttribute("rental_to_date", map.get("rental_to_date"));
			req.setAttribute("rental_date", map.get("rental_date"));
			
	        //대여 내역
	 		map.put("mem_num",String.valueOf(mem_num));
	        List<RentalLogDTO> list = myPageMapper.getRentalLog(map);
	         
	         
	         session.setAttribute("cartList", pagination.getPagePost(page, list));
	         req.setAttribute("pageCount", pagination.pageCount(list));
	         req.setAttribute("page", page);
	      }
	      return "myPage/myPageRental";
	   }
	   
	   // 추가 07/06 - 송재영
	   @RequestMapping("/myPageViewRentalLog.myPage")
	   public String myPageViewRentalLog(HttpServletRequest req,@RequestParam int rental_num) {
	      RentalLogDTO dto = myPageMapper.getRentalLogOne(rental_num);
	      req.setAttribute("rdto", dto);
	      return "myPage/myPageViewRentalLog";
	   }
	   
	   // 추가 07/06 - 송재영
	   @RequestMapping("/myPageExtendRentalLog.myPage")
	   public String myPageExtendRentalLog(HttpServletRequest req,@RequestParam Map<String,String> map) {
	      int res = myPageMapper.myPageExtendRentalLog(map);
	      String msg = null, url = null;
	      if (res>0) {
	         msg = "연장신청되었습니다.";
	         url = "myPageRental.myPage";
	      }else {
	         msg = "연장신청이 실패되었습니다. 고객센터에 문의해주세요.";
	         url = "myPageRental.myPage";
	      }
	      req.setAttribute("msg", msg);
	      req.setAttribute("url", url);
	      return "message";
	   }

}
