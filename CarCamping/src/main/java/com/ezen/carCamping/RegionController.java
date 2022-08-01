package com.ezen.carCamping;

import java.util.Hashtable;
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

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.service.RegionMapper;


@Controller
public class RegionController {
	
	@Autowired
	private RegionMapper RegionMapper;

	private Hashtable<String, Object> ht = RegionMapper.getInstance(); 

	@RequestMapping(value = "goRegion.region", method = RequestMethod.GET)
	public String goRegion(HttpServletRequest req) {
		List<CarCampingRegionDTO> hot_list = RegionMapper.listHotRegion();
		List<CarCampingRegionDTO> recommand_list = RegionMapper.listRecommandRegion();
		ht.put("hot_list", hot_list);
		ht.put("recommand_list", recommand_list);
		req.setAttribute("hotRegionList", hot_list);
		req.setAttribute("recommandRegionList", recommand_list);
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("mbdto");
		if(session.getAttribute("mbdto")!=null) {
			session.setAttribute("mem_num", dto.getMem_num());
			session.setAttribute("mem_id", dto.getMem_id());
		 }
		return "region/regionMain";
	}

	@RequestMapping("/regionHotLocList.region")
	public String goRegionHOT(HttpServletRequest req, @RequestParam int region_num) {
		ChkSignIn(req);
		RegionDTO dto = RegionMapper.selectRegion(region_num);
		List<CarCampingRegionDTO> list = RegionMapper.listCarCampingRegionHotRegion(region_num);
		req.setAttribute("regionDTO", dto);
		req.setAttribute("hotList_Region", list);
		req.setAttribute("hotRegionList", ht.get("hot_list"));
		req.setAttribute("recommandRegionList", ht.get("recommand_list"));
		
		
		return "region/regionHotLocList";

	}
	
	@RequestMapping(value = "changeHotRegion.region", method=RequestMethod.GET,produces = "application/text; charset=UTF-8")
    @ResponseBody
    public String changeHotRegion(HttpServletRequest req,@RequestParam("regionNum") int regionNum,@RequestParam(required = false) String memId) {
       ChkSignIn(req);
       System.out.println(regionNum);
       //int region_num = Integer.parseInt(regionNum);
       RegionDTO dto = RegionMapper.selectRegion(regionNum);
       List<CarCampingRegionDTO> list = RegionMapper.listCarCampingRegionHotRegion(regionNum);
       
       String hotList_html ="<li class=\"list-group-item fs-2 text-center\"><button\r\n" + 
             "            class=\"btn btn-outline-warning btn-lg\" type=\"button\" onclick=\"location.href='board.region?region_num="+dto.getRegion_num()+"'\"\r\n" + 
             "            style=\"-bs-btn-padding-x: 70px; - -bs-btn-padding-y: 15px;\">\r\n" + 
             "            <i class=\"bi bi-trophy-fill\" width=\"40\" height=\"40\"\r\n" + 
             "               fill=\"currentColor\"></i>"+dto.getRegion_name()+" 차박지 전체 보기<i\r\n" + 
             "               class=\"bi bi-trophy-fill\" width=\"40\" height=\"40\"\r\n" + 
             "               fill=\"currentColor\"></i></button></li>";
       if(list.size()!=0) {
       for(int i=0;i<list.size();i++) {
          hotList_html+="<li class='"+"list-group-item position-relative'><img src='"
                +"https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440/"+list.get(i).getCcr_viewImage1()
                +"' class='img-responsive rounded-circle' style='"+"width: 107px; height: 107px;'>"
                +"<div class='position-absolute top-50 start-50 translate-middle'>"
                +"<i class='bi bi-trophy-fill' width='40' height='40' style='color:#ffc107;'></i>"
                +"<a href ='regionView.region?ccr_num="
                +list.get(i).getCcr_num()+"'style=\'color:#050a16; font-weight: bold;\'>"
                +list.get(i).getCcr_name()+"</a></div></li>";
       }
       }else {
         hotList_html += "<li class=\"list-group-item position-relative\"><img\r\n" + 
               "                  src=\"resources/images/sik.jpg\"\r\n" + 
               "                  class=\"img-responsive rounded-circle\"\r\n" + 
               "                  style=\"width: 107px; height: 107px;\">\r\n" + 
               "                  <div class=\"position-absolute top-50 start-50 translate-middle\">\r\n" + 
               "                     인기 차박지가 없습니다. 전체 보기를 눌러주세요 ! \r\n" + 
               "            </div></li>"; 
       }
       return hotList_html;
    }
	   
	
	

	@SuppressWarnings("unchecked")
	@RequestMapping("/regionView.region")
	public String regionView(HttpServletRequest req,@RequestParam Map<String,String> params) {
		ChkSignIn(req);
		int ccr_num = Integer.parseInt(params.get("ccr_num"));
		CarCampingRegionDTO dto = RegionMapper.selectRegionByCcrnum(ccr_num);
		req.setAttribute("regionSelected", dto);
		req.setAttribute("reviewCount", RegionMapper.countReviewCcr(ccr_num));
		String mode = req.getParameter("mode");
		if(mode==null) mode="none";
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("mem_id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = RegionMapper.checkRegionLikeLog(id, ccr_num);
			req.setAttribute("check", check);
		}
		
		List<ReviewRegionDTO> list = null;
		int pageSize = 9;
		String pageNum = params.get("pageNum");
		int currentPage;
		if (pageNum == null) {
			pageNum = "1";
			currentPage = Integer.parseInt(pageNum);
		}
		else {
			double pageNum_db = Double.parseDouble(pageNum);
			if(pageNum_db<=0) pageNum_db = 0;
			currentPage = (int) (pageNum_db);
		}
		int startRow = (currentPage - 1) * pageSize + 1;//3-1 4 8
		int endRow = startRow + pageSize - 1;
		int rowCount = RegionMapper.countReviewCcrnum(ccr_num);
		
		if (endRow > rowCount)
			endRow = rowCount;
		String orderBy =  params.get("orderBy");
		if(orderBy==null||orderBy.equals("newly")) orderBy = "review_num";
		
		if (rowCount > 0) {
			if(mode.equals("none")) {
			list = RegionMapper.listCcrReview(ccr_num,startRow-1,endRow,orderBy);
			}
			else if(mode.equals("searchReview")) {
				String search  = params.get("search");
				String searchString = params.get("searchString");
				if(search.equals("mem_nickName")) {
				rowCount = RegionMapper.countRevieWrietrSearch(ccr_num, search, searchString);
				list = RegionMapper.listCcrReviewWriterSearch(ccr_num,  startRow-1, endRow, orderBy, search, searchString);	
				}else {
				rowCount = RegionMapper.countReviewSearch(ccr_num, search, searchString);
				list = RegionMapper.listCcrReviewSearch(ccr_num, startRow-1, endRow, orderBy, search, searchString);
				}
				req.setAttribute("search", search);
				req.setAttribute("searchString", searchString);
			}
			
			if(orderBy.equals("review_likeCount")) {
				orderBy="review_likeCount";
			}else if(orderBy.equals("review_regionScore")) {
				orderBy="review_regionScore";
			}
			
			int pageCount = rowCount/pageSize + (rowCount%pageSize==0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1)/pageBlock  * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("orderBy", orderBy);	
		}
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("rowCount", rowCount);
		req.setAttribute("reviewList", list);
		req.setAttribute("mode", mode);
		
		return "/region/regionView";
	}
	
	@RequestMapping("/regionReviewView.region")
	public String regionReviewView(HttpServletRequest req,HttpServletResponse rep, @RequestParam int review_num) {
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
		  
		ReviewRegionDTO dto = RegionMapper.selectReviewDetail(review_num);
		
		Cookie[] cookies = req.getCookies();
		Cookie viewCookie = null;
		
        if (cookies != null && cookies.length > 0) { 
        	for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("cookie"+review_num)) viewCookie = cookies[i];
            }
        }
        
        if (dto != null) {
            if (viewCookie == null) {    
                Cookie newCookie = new Cookie("cookie"+review_num, "|" + review_num + "|");     
                rep.addCookie(newCookie);
                int result = RegionMapper.addReviewReadCount(review_num);
                dto.setReview_readCount(dto.getReview_readCount()+1);
            }
            	
        }else { 
        	return "/region/RegionErrorPage";
        }
		Class<? extends ReviewRegionDTO> cls = dto.getClass();
		List<String> reviewImages = new java.util.ArrayList<>();
		for(int i=1;i<=5;i++) {
			String imageVar = "review_regionImage"+i;
			try {
				java.lang.reflect.Field f = cls.getDeclaredField(imageVar);
				f.setAccessible(true);
				String imageSrc = (String)f.get(dto);
				if(imageSrc!=null) {
					reviewImages.add(imageSrc);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

		String id = (String) session.getAttribute("mem_id");
		if (id==null || id.equals("")) req.setAttribute("check", 0);
		else{
			int check = RegionMapper.checkReviewLikeLog(id, review_num);
			req.setAttribute("check", check);
		}
					
		req.setAttribute("selectedReview", dto);
		req.setAttribute("reviewImageList", reviewImages); 
		return "/region/regionReviewView";
	}
	
	@RequestMapping(value="updateRegionLike.region",method=RequestMethod.POST)
	@ResponseBody
	public String updateRegionLike(HttpServletRequest req,@RequestParam String mem_id,@RequestParam int ccr_num) {
		
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
		  
		int check = RegionMapper.checkRegionLikeLog(mem_id, ccr_num);
		int count = 0;
		if(check==0) { 
			count = RegionMapper.insertRegionLikeLog(mem_id, ccr_num); 
		}else {
			count = RegionMapper.deleteRegionLikeLog(mem_id, ccr_num);

		}

		return String.valueOf(count);
	}
	
	@RequestMapping(value="updateReviewLike.region",method=RequestMethod.POST)
	@ResponseBody
	public String updateReviewLike(HttpServletRequest req,@RequestParam String mem_id,@RequestParam int review_num) {
		
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
		  
		  
		int check = RegionMapper.checkReviewLikeLog(mem_id, review_num);
		int count = 0;
		if(check==0) {
			count = RegionMapper.insertReviewLikeLog(mem_id, review_num); 
		}else {
			count = RegionMapper.deleteReviewLikeLog(mem_id, review_num);
		}
		return String.valueOf(count);
	}
	
	   @RequestMapping(value="/board.region", method = RequestMethod.GET)
	   public String Board(HttpServletRequest req,HttpServletResponse rep,@RequestParam Map<String,String> params) {
	   List<CarCampingRegionDTO>list =null;
	   int region_num = Integer.parseInt(params.get("region_num"));   
	   String pageNum = params.get("pageNum");
	   String mode=params.get("mode");
	   String orderBy = params.get("orderBy");
	   if(orderBy == null) orderBy="ccr_num";
	   String search = params.get("search");
	   String searchString = params.get("searchString");
	   
	   int pageSize= 12;
	   int currentpage;
	   if(pageNum==null) {
	      pageNum="1";
	      currentpage=Integer.parseInt(pageNum);
	   }else {
	      double pageNum_db =Double.parseDouble(pageNum);
	      if(pageNum_db<=0)pageNum_db = 0 ;
	      currentpage = (int)(pageNum_db);
	   }
	   int startRow = (currentpage -1) * pageSize +1;
	   int endRow = startRow + pageSize - 1;
	   int rowCount=RegionMapper.listRegionCount(region_num);
	   if(endRow>rowCount) endRow=rowCount;
	   if(mode==null || mode.equals("")) {
	      list = RegionMapper.listAllCarCamping(region_num, orderBy, startRow-1, endRow);
	   }
	   else if(mode.equals("searchCcr")){
	      if(search!=null && searchString != null || !(search.equals("") && searchString.equals(""))) {
	         list = RegionMapper.listAllCarCampingSearch(region_num, search, searchString, orderBy, startRow-1, endRow);
	         System.out.println(list.size());
	         rowCount = RegionMapper.listRegionCountSearch(region_num, search, searchString);
	      }
	   }
	   int pageCount = rowCount/pageSize + (rowCount%pageSize==0 ? 0 : 1);
	   int pageBlock = 5;
	   int startPage = (currentpage - 1)/pageBlock  * pageBlock + 1;
	   int endPage = startPage + pageBlock - 1;
	   if (endPage > pageCount) endPage = pageCount;
	   req.setAttribute("mode", mode);
	   req.setAttribute("search", search);
	   req.setAttribute("searchString", searchString);
	   req.setAttribute("orderBy", orderBy);
	   req.setAttribute("region_num", region_num);
	   req.setAttribute("rowCount",rowCount);
	   req.setAttribute("list", list);
	   req.setAttribute("pageCount", pageCount);
	   req.setAttribute("startPage", startPage);
	   req.setAttribute("endPage", endPage);
	   return "/region/regionBoard";
	   }
	
	
	
	private void ChkSignIn(HttpServletRequest req) {
		 HttpSession session = req.getSession();
		  MemberDTO dto = (MemberDTO) session.getAttribute("mbdto");
		  if(session.getAttribute("mbdto")!=null) {
			  session.setAttribute("mem_num", dto.getMem_num());
			  session.setAttribute("mem_id", dto.getMem_id());
		  }
	}
	
	
}
