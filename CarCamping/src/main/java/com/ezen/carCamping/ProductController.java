package com.ezen.carCamping;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.pagination.Pagination;
import com.ezen.carCamping.service.MyPageMapper;
import com.ezen.carCamping.service.ProductMapper;
import com.ezen.carCamping.service.S3FileService;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper productMapper;

	@Autowired
	private MyPageMapper myPageMapper;

	@Autowired
	private S3FileService service;

	private static Pagination pagination = Pagination.getInstance();


	//service.upload(File file)
	// 용품메인 컨트롤러
	/**
	 * @param req
	 * @param mode
	 * @param params
	 * @return
	 */

	@RequestMapping(value ="/goProduct.product",method = RequestMethod.GET)
	public String goProduct(HttpServletRequest req,
			@RequestParam (required = false) String mode,
			@RequestParam Map<String,String>params) {   
		List<ProductDTO> list=null;
		String pageNum = params.get("pageNum");
		mode=params.get("mode");
		String search=params.get("search");
		String searchString=params.get("searchString");
		int pageSize= 12; //페이지에서 보여주는 갯수 
		int currentpage; // 현재 페이지 

		if(pageNum==null) {
			pageNum="1";
			currentpage=Integer.parseInt(pageNum);
		}else {
			double pageNum_db =Double.parseDouble(pageNum);
			if(pageNum_db<=0)pageNum_db = 0 ;
			currentpage = (int)(pageNum_db);
		}

		int startRow = (currentpage -1) * pageSize +1;//1  
		int endRow = startRow + pageSize - 1;//10
		int rowCount=productMapper.listProductMainCount(); //페이지의 카운터를 나타내는 쿼리를 실행 

		if(mode==null||mode.equals("")) {
			if(searchString!=null) {
				list = productMapper.findProduct(search, searchString,startRow-1,endRow);
				rowCount = productMapper.countProductSeacrch(search, searchString); // 검색결과 카운터를 체크해주는 쿼리 실행
			}else {
				list=productMapper.listProduct(startRow-1, endRow);//용품의 리스트를 실행시키는 쿼리 
			}
		}else if(mode.equals("listProductNew")) {
			if(search!=null&&searchString!=null) {
				if(search.equals(""))  search = "prod_name";
				list=productMapper.listProductsearchNew(search,searchString,startRow-1,endRow);//용품을 검색 후 새로운 상품 순서로 정렬 해주는 쿼리
				rowCount = productMapper.countProductSeacrch(search, searchString); // 검색결과 카운터를 체크해주는 쿼리 실행
			}else  {
				list=productMapper.listProductNew(startRow-1,endRow); //용품의 리스트를 실행시키는 쿼리 

			}
		}else if(mode.equals("listProductPop")) {
			if(search!=null&&searchString!=null) {
				if(search.equals("")) search = "prod_name";
				list=productMapper.listProductsearchPop(search, searchString,startRow-1,endRow);//인기 용품을 검색하여 정렬해주는 쿼리
				rowCount = productMapper.countProductSeacrch(search, searchString); // 검색결과 카운터를 체크해주는 쿼리 실행
			}else {
				list=productMapper.listProductPop(startRow-1,endRow);
			}
		}else if(mode.equals("listProductPrice")){
			if(search!=null&&searchString!=null) {
				if(search.equals("")) search = "prod_name";
				list=productMapper.listProductsearchPrice(search, searchString,startRow-1,endRow); //용품을 검색 후 가격 순서로 정렬 해주는 쿼리
				rowCount = productMapper.countProductSeacrch(search, searchString);
			}else {
				list=productMapper.listProductPrice(startRow-1,endRow);
			}
		} 

		if(endRow>rowCount) endRow=rowCount;  
		int pageCount = rowCount/pageSize + (rowCount%pageSize==0 ? 0 : 1); 
		int pageBlock = 4; // 페이지의 갯수를 나타냄 
		int startPage = (currentpage - 1)/pageBlock  * pageBlock + 1; //시작 페이지를 계산해줌 
		int endPage = startPage + pageBlock - 1; //끝나는 페이지를 계산해줌 
		if (endPage > pageCount) endPage = pageCount;

		List<ProductDTO> popList = productMapper.popularProduct();
		req.setAttribute("mode", mode);
		req.setAttribute("rowCount",rowCount);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("search", search);
		req.setAttribute("searchString", searchString);
		req.setAttribute("popList", popList); 
		req.setAttribute("listProduct", list);
		req.setAttribute("prodrank3", productMapper.popularProdRank());
		return "product/productMain";
	}

	@RequestMapping("/productView.product")//이부분 수정함
    public String productView(HttpServletRequest req, @RequestParam Map<String, String> params,
           String mode, @RequestParam(required=false,defaultValue="1") int page) {
           HttpSession session = req.getSession();
           int prod_num = Integer.parseInt(params.get("prod_num"));
           session.setAttribute("prod_num", prod_num);
           ProductDTO dto = productMapper.getProduct(prod_num);
           session.setAttribute("getProduct", dto);
          List<ReviewProductDTO> list = null;
          String search = params.get("search");
          String searchString = params.get("searchString");
          if (searchString == null||searchString.equals("")) {
             list = productMapper.listProdReview(prod_num);
          }else {
            try {
            searchString = URLDecoder.decode(params.get("searchString"), "UTF-8");
             list = productMapper.findReview(prod_num,search, searchString);
                session.setAttribute("prodsearch", search);
                session.setAttribute("prodsearchString", searchString);
         } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
         }
          }
          List<AgencyDTO> Alist = productMapper.getAgency();
          req.setAttribute("countReviewProd", productMapper.countReviewProd(prod_num));
          req.setAttribute("getAgency", Alist);
          //req.setAttribute("getProduct", productMapper.getProduct(prod_num));
          req.setAttribute("pageCount", pagination.pageCount(list));
          req.setAttribute("listBoard", pagination.getPagePost(page,list));

       return "product/productView";
    }

	@RequestMapping("/productViewOrder.product")//이 부분 추가
	public String productView2(HttpServletRequest req,String mode,@RequestParam(required=false,defaultValue="1") int page
			, @RequestParam Map<String,String> params) {

		//String search =params.get("search");
		//String searchString =params.get("searchString");
		HttpSession session = req.getSession();
		String search = (String) session.getAttribute("prodsearch");
		String searchString = (String) session.getAttribute("prodsearchString");
		int prod_num = (int)session.getAttribute("prod_num");
		List<ReviewProductDTO> list = null;
		if(mode.equals("listReviewNew")) {
			if(search!=null&&searchString!=null) {
				list = productMapper.listReviewsearchSysdate(search, searchString, prod_num);
			}else if(search==null||searchString==null||search.equals("")||searchString.equals("")) {
				list = productMapper.R_orderBysysdate(prod_num);
			}
		}else if(mode.equals("listReviewPop")) {
			if(search!=null&&searchString!=null) {
				list = productMapper.listReviewsearchScore(search, searchString, prod_num);
			}else if(search==null&&searchString==null||search.equals("")&&searchString.equals("")) {
				list = productMapper.R_orderByScore(prod_num);
			}
		}else if(mode.equals("listReviewLike")) {
			if(search!=null&&searchString!=null) {
				list = productMapper.listReviewsearchLike(search, searchString, prod_num);
			}else if(search==null&&searchString==null||search.equals("")&&searchString.equals("")) {
				list = productMapper.R_orderByLike(prod_num); 
			}


		}

		req.setAttribute("pageCount", pagination.pageCount(list));
		req.setAttribute("listBoard", pagination.getPagePost(page,list));
		return "product/productView";
	}

	@RequestMapping("/productReviewView.product")
	public String myPageWriteReviewProductView(HttpServletRequest req, HttpServletResponse rep, @RequestParam int rp_num) {
		ReviewProductDTO pdto = productMapper.getReviewView(rp_num);
		req.setAttribute("getReviewProduct", pdto);
		HttpSession session = req.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mbdto");
		int mem_num = mdto.getMem_num();
		if (mem_num > 0) {
			session.setAttribute("mem_num", mdto.getMem_num());
			session.setAttribute("mem_id", mdto.getMem_id());
		} else if (mem_num <= 0) {
			req.setAttribute("msg", "로그인을 하시여 리뷰를 볼 수 있습니다 !\n로그인창으로 이동합니다.");
			req.setAttribute("url", "login.login");
			return "message";
		}

		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;

		
		if (cookies != null && cookies.length > 0) { 
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("cookie"+rp_num)) viewCookie = cookies[i];
				// Cookie 쓽 name 씠 cookie(revie_num)    
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
		return "product/productReviewView";
	}

	@RequestMapping(value="updateProductReviewLike.product",method=RequestMethod.POST)
	   @ResponseBody
	   public String updateProductReviewLike(HttpServletRequest req,@RequestParam String mem_id,@RequestParam String rp_num) {
	      HttpSession session = req.getSession();
	      
	      MemberDTO mdto = (MemberDTO) session.getAttribute("mbdto");
	      if(mdto!=null) {
	         session.setAttribute("mem_num", mdto.getMem_num());
	         session.setAttribute("mem_id", mdto.getMem_id());
	      }else if(mdto == null){
	         req.setAttribute("msg", "로그인을 하셔야 좋아요를 누를수 있습니다 !\n로그인창으로 이동합니다.");
	         req.setAttribute("url","login.login");
	         return "message";
	      }
	      int check = productMapper.checkProductReviewLikeLog(mem_id, Integer.parseInt(rp_num));
	      int count = 0;
	      if(check==0) { 
	         count = productMapper.insertProductReviewLikeLog(mem_id, Integer.parseInt(rp_num));
	         
	      }else {
	         count = productMapper.deleteProductReviewLikeLog(mem_id, Integer.parseInt(rp_num));
	         
	      }
	      return String.valueOf(count);
	      
	   
	   
		
	}
	
	
	
}


