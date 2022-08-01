package com.ezen.carCamping;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.carCamping.dto.AdminAnnounceDTO;
import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.BrandCategoryDTO;
import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.PointLogDTO;
import com.ezen.carCamping.dto.ProductCategoryDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.QuestionDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.RentalLogDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.pagination.Pagination;
import com.ezen.carCamping.service.AdminMapper;
import com.ezen.carCamping.service.S3FileService;
 


@Controller
public class AdminController {
	
	@Autowired
	private AdminMapper adminMapper;
	
	//Pagination Singleton Instance
	private Pagination pagination = Pagination.getInstance();
	
	//AWS S3
	@Autowired
	private S3FileService S3FileService;
	
	
	@RequestMapping("/goAdmin.admin")
	public String goAdmin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		String upPath = "https://s3.ap-northeast-2.amazonaws.com/qkzptjd5440";
		List<RegionDTO> adminListRegion = adminMapper.adminListRegion();
		
		session.setAttribute("adminListRegion", adminListRegion);
		session.setAttribute("upPath", upPath);
		return "admin/main";
	}

	
	
///////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////장 소////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	@RequestMapping("/adminRegion.admin")
	public String adminRegion(HttpServletRequest req,@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(required=false) String region_num_admin) {
		List<CarCampingRegionDTO> adminListCarCampingRegion = new ArrayList<CarCampingRegionDTO>();
		
		if (region_num_admin==null || region_num_admin.equals("")) {
			adminListCarCampingRegion = adminMapper.adminListCarCampingRegion();
			
		}else {
			adminListCarCampingRegion = adminMapper.adminListCarCampingRegionSelectRegion(Integer.parseInt(region_num_admin));
			req.setAttribute("region_num_admin", region_num_admin);
		}
		
		//현재 페이지
		req.setAttribute("page", page);
		//총 페이지
		req.setAttribute("pageCount", pagination.pageCount(adminListCarCampingRegion));
		//현재 페이지에 맞는 게시물 리스트
		req.setAttribute("adminListCarCampingRegion", pagination.getPagePost(page, adminListCarCampingRegion));
		return "admin/adminRegion";
	}
	
	
	@RequestMapping(value="/adminRegisterRegion.admin", method=RequestMethod.GET)
	public String adminRegisterRegion(HttpServletRequest req) {
		
		return "admin/adminRegisterRegion";
	}
	
	@RequestMapping(value="/adminRegisterRegion.admin", method=RequestMethod.POST)
	public ModelAndView adminRegisterRegionPro(HttpServletRequest req,@ModelAttribute CarCampingRegionDTO dto,@RequestParam("ccr_viewImage") MultipartFile[] file, @RequestParam Map<String,String> map) {
		
		RegionDTO regionDTO = new RegionDTO();
		regionDTO.setRegion_num(Integer.parseInt(map.get("region_num")));
		dto.setRegionDTO(regionDTO);
		
		//차량접근
		String ccr_car = "";
		if (map.containsKey("ccr_car1")) ccr_car += "승용차  ";
		if (map.containsKey("ccr_car2")) ccr_car += "소형 트레일러  ";
		if (map.containsKey("ccr_car3")) ccr_car += "카라반  ";
		if (map.containsKey("ccr_car4")) ccr_car += "루프탑  ";
		if (map.containsKey("ccr_car5")) ccr_car += "캠핑카  ";
		dto.setCcr_car(ccr_car.trim());
		
		//바닥종류
		String ccr_ground = "";
		if (map.containsKey("ccr_ground1")) ccr_ground += "맨흙  ";
		if (map.containsKey("ccr_ground2")) ccr_ground += "자갈  ";
		if (map.containsKey("ccr_ground3")) ccr_ground += "모래  ";
		if (map.containsKey("ccr_ground4")) ccr_ground += "데크  ";
		if (map.containsKey("ccr_ground5")) ccr_ground += "잔디 ";
		dto.setCcr_ground(ccr_ground.trim());
		
		//편의시설
		if (map.containsKey("ccr_amenity1")) dto.setCcr_toilet(0);
		else dto.setCcr_toilet(1);
		
		if (map.containsKey("ccr_amenity2")) dto.setCcr_restroom(0);
		else dto.setCcr_restroom(1);
		
		if (map.containsKey("ccr_amenity3")) dto.setCcr_water(0);
		else dto.setCcr_water(1);
		
		if (map.containsKey("ccr_amenity4")) dto.setCcr_market(0);
		else dto.setCcr_market(1);
		
		if (map.containsKey("ccr_amenity5")) dto.setCcr_river(0);
		else dto.setCcr_river(1);
		
		//다중 파일 전송
		for (MultipartFile f : file) {
			try {
				String str = S3FileService.upload(f); //이름바꾸고 아마존으로 업로드
				
				if (dto.getCcr_viewImage1()==null) dto.setCcr_viewImage1(str);
				else if (dto.getCcr_viewImage2()==null) dto.setCcr_viewImage2(str);
				else if (dto.getCcr_viewImage3()==null) dto.setCcr_viewImage3(str);
				else if (dto.getCcr_viewImage4()==null) dto.setCcr_viewImage4(str);
				else if (dto.getCcr_viewImage5()==null) dto.setCcr_viewImage5(str);
			}catch(IOException e) {
				
			}

		}
			
		int res = adminMapper.adminInsertRegion(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "장소가 등록되었습니다";
			url = "adminRegion.admin";
		}else {
			msg = "장소등록이 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminRegion.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping("/adminViewRegion.admin")
	public ModelAndView adminViewRegion(@RequestParam int ccr_num) {
		CarCampingRegionDTO cdto = adminMapper.getCarCampingRegion(ccr_num);
		return new ModelAndView("admin/adminViewRegion","cdto",cdto);
	}
			
	

	@RequestMapping("/adminUpdateRegion.admin")
	public ModelAndView  updateRegion(HttpServletRequest req,@RequestParam("ccr_viewImage") MultipartFile[] file,
			@ModelAttribute CarCampingRegionDTO dto,@RequestParam Map<String,String> map) {

		//차량접근
		String ccr_car = "";
		if (map.containsKey("ccr_car1")) ccr_car += "승용차  ";
		if (map.containsKey("ccr_car2")) ccr_car += "소형 트레일러  ";
		if (map.containsKey("ccr_car3")) ccr_car += "카라반  ";
		if (map.containsKey("ccr_car4")) ccr_car += "루프탑  ";
		if (map.containsKey("ccr_car5")) ccr_car += "캠핑카  ";
		dto.setCcr_car(ccr_car.trim());
		
		//바닥종류
		String ccr_ground = "";
		if (map.containsKey("ccr_ground1")) ccr_ground += "맨흙  ";
		if (map.containsKey("ccr_ground2")) ccr_ground += "자갈  ";
		if (map.containsKey("ccr_ground3")) ccr_ground += "모래  ";
		if (map.containsKey("ccr_ground4")) ccr_ground += "데크  ";
		if (map.containsKey("ccr_ground5")) ccr_ground += "잔디 ";
		dto.setCcr_ground(ccr_ground.trim());
		
		//편의시설
		if (map.containsKey("ccr_amenity1")) dto.setCcr_toilet(0);
		else dto.setCcr_toilet(1);
		
		if (map.containsKey("ccr_amenity2")) dto.setCcr_restroom(0);
		else dto.setCcr_restroom(1);
		
		if (map.containsKey("ccr_amenity3")) dto.setCcr_water(0);
		else dto.setCcr_water(1);
		
		if (map.containsKey("ccr_amenity4")) dto.setCcr_market(0);
		else dto.setCcr_market(1);
		
		if (map.containsKey("ccr_amenity5")) dto.setCcr_river(0);
		else dto.setCcr_river(1);
		
		
		//이미지 수정했을때
		if (!file[0].isEmpty()) {
			//기존 파일 삭제
			if (map.containsKey("ccr_viewImageHidden1")) S3FileService.deleteImage(map.get("ccr_viewImageHidden1"));
			if (map.containsKey("ccr_viewImageHidden2")) S3FileService.deleteImage(map.get("ccr_viewImageHidden2"));
			if (map.containsKey("ccr_viewImageHidden3")) S3FileService.deleteImage(map.get("ccr_viewImageHidden3"));
			if (map.containsKey("ccr_viewImageHidden4")) S3FileService.deleteImage(map.get("ccr_viewImageHidden4"));
			if (map.containsKey("ccr_viewImageHidden5")) S3FileService.deleteImage(map.get("ccr_viewImageHidden5"));
			
			//새 파일 아마존으로 업로드
			for (MultipartFile f : file) {
				try {
					String str = S3FileService.upload(f); //이름바꾸고 아마존으로 업로드	
					if (dto.getCcr_viewImage1()==null) dto.setCcr_viewImage1(str);
					else if (dto.getCcr_viewImage2()==null) dto.setCcr_viewImage2(str);
					else if (dto.getCcr_viewImage3()==null) dto.setCcr_viewImage3(str);
					else if (dto.getCcr_viewImage4()==null) dto.setCcr_viewImage4(str);
					else if (dto.getCcr_viewImage5()==null) dto.setCcr_viewImage5(str);
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		//수정이미지 업로드 안했을때 (이미지 변경사항 X)	
		}else {
			
			if (map.containsKey("ccr_viewImageHidden1")) dto.setCcr_viewImage1(map.get("ccr_viewImageHidden1"));
			if (map.containsKey("ccr_viewImageHidden2")) dto.setCcr_viewImage2(map.get("ccr_viewImageHidden2"));
			if (map.containsKey("ccr_viewImageHidden3")) dto.setCcr_viewImage3(map.get("ccr_viewImageHidden3"));
			if (map.containsKey("ccr_viewImageHidden4")) dto.setCcr_viewImage4(map.get("ccr_viewImageHidden4"));
			if (map.containsKey("ccr_viewImageHidden5")) dto.setCcr_viewImage5(map.get("ccr_viewImageHidden5"));
		}
		
		//인기장소
		if (map.containsKey("ccr_popular1")) dto.setCcr_popular(0);
		else dto.setCcr_popular(1);
		
		int res = adminMapper.adminUpdateRegion(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "장소가 수정되었습니다";
			url = "adminRegion.admin";
		}else {
			msg = "장소 수정이 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminRegion.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	@RequestMapping("/adminDeleteRegion.admin")
	public ModelAndView adminDeleteRegion(@RequestParam int ccr_num) {
		
		//기존 AWS 파일 삭제
		CarCampingRegionDTO dto = adminMapper.getCarCampingRegion(ccr_num);
		if (dto.getCcr_viewImage1()!=null) S3FileService.deleteImage(dto.getCcr_viewImage1());
		if (dto.getCcr_viewImage2()!=null) S3FileService.deleteImage(dto.getCcr_viewImage2());
		if (dto.getCcr_viewImage3()!=null) S3FileService.deleteImage(dto.getCcr_viewImage3());
		if (dto.getCcr_viewImage4()!=null) S3FileService.deleteImage(dto.getCcr_viewImage4());
		if (dto.getCcr_viewImage5()!=null) S3FileService.deleteImage(dto.getCcr_viewImage5());
		
		//DB에서 삭제
		int res = adminMapper.adminDeleteRegion(ccr_num);
		String msg =null, url = null;
		if (res>0) {
			msg = "장소가 삭제되었습니다";
			url = "adminRegion.admin";
		}else {
			msg = "장소 삭제가 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminRegion.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	
	
////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////대리점////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	@RequestMapping("/adminAgency.admin")
	public String adminAgency(HttpServletRequest req,@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(required=false) String region_num_admin) {
			List<AgencyDTO> adminListAgency = new ArrayList<AgencyDTO>();
			
		if (region_num_admin == null || region_num_admin.equals("")) {
			adminListAgency = adminMapper.adminListAgency();
		}else {
			adminListAgency = adminMapper.adminListAgencySort(Integer.parseInt(region_num_admin));
			req.setAttribute("region_num_admin", region_num_admin);
		}
		//현재 페이지
		req.setAttribute("page", page);
		//총 페이지
		req.setAttribute("pageCount", pagination.pageCount(adminListAgency));
		//현재 페이지에 맞는 게시물 리스트
		req.setAttribute("adminListAgency", pagination.getPagePost(page, adminListAgency));
		
		return "admin/adminAgency";
	}
	
	@RequestMapping(value="/adminRegisterAgency.admin", method=RequestMethod.GET)
	public String adminRegisterAgency() {
		return "admin/adminRegisterAgency";
	}
	
	@RequestMapping(value="/adminRegisterAgency.admin", method=RequestMethod.POST)
	public ModelAndView adminRegisterAgencyPro(@ModelAttribute AgencyDTO dto,@RequestParam int region_num) {
		RegionDTO rdto = new RegionDTO();
		rdto.setRegion_num(region_num);
		dto.setRegionDTO(rdto);
		
		int res = adminMapper.adminInsertAgency(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "대리점이 등록되었습니다";
			url = "adminAgency.admin";
		}else {
			msg = "대리점 등록이 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminAgency.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping(value="/adminViewAgency.admin", method=RequestMethod.GET)
	public ModelAndView adminViewAgency(@RequestParam int agency_num) {
		AgencyDTO adto = adminMapper.adminGetAgency(agency_num);
		return new ModelAndView("admin/adminViewAgency","adto",adto);
	}
	
	@RequestMapping(value="/adminViewAgency.admin", method=RequestMethod.POST)
	public ModelAndView adminViewAgencyPro(@RequestParam Map<String,String> map) {
		AgencyDTO adto = adminMapper.adminGetAgency(Integer.parseInt(map.get("agency_num")));
		adto.setAgency_name(map.get("agency_name"));
		adto.setAgency_location(map.get("agency_location"));
		adto.setAgency_phone(map.get("agency_phone"));
		
		int res = adminMapper.adminUpdateAgency(adto);
		String msg =null, url = null;
		if (res>0) {
			msg = "대리점이 수정되었습니다";
			url = "adminAgency.admin";
		}else {
			msg = "대리점 수정이 실패되었습니다, 서비스 센터에 문의하세요";
			url = "adminAgency.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping("/adminDeleteAgency.admin")
	public ModelAndView adminDeleteAgency(@RequestParam int agency_num) {
		int res = adminMapper.adminDeleteAgency(agency_num);
		String msg =null, url = null;
		if (res>0) {
			msg = "대리점이 삭제되었습니다";
			url = "adminAgency.admin";
		}else {
			msg = "대리점 삭제가 실패되었습니다, 서비스 센터에 문의하세요";
			url = "adminAgency.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////카테고리///////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	@RequestMapping("/adminCategory.admin")
	public String adminCategory(HttpServletRequest req,@RequestParam(required=false) String category) {
		List<BrandCategoryDTO> adminListBrand = adminMapper.adminListBrand();
		req.setAttribute("adminListBrand", adminListBrand);
		List<ProductCategoryDTO> adminListProductCategory = adminMapper.adminListProductCategoty();
		req.setAttribute("adminListProductCategory", adminListProductCategory);
		
		return "admin/adminCategory";
	}
	@RequestMapping(value="/adminInsertCategory.admin", method=RequestMethod.GET)
	public String adminInsertCategory() {
		return "admin/adminRegisterCategory";
	}
	
	
	@RequestMapping(value="/adminInsertCategory.admin", method=RequestMethod.POST)
	public ModelAndView adminInsertCategoryPro(@RequestParam HashMap<String,String> map) {
		int res = adminMapper.adminInsertCategory(map);
		String msg =null, url = null;
		if (res>0) {
			msg = "카테고리가 등록되었습니다";
			url = "adminCategory.admin";
		}else {
			msg = "카테고리 등록이 실패되었습니다, 서비스 센터에 문의하세요";
			url = "adminCategory.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping("/adminDeleteBrand.admin")
	public ModelAndView adminDeleteBrand(int brand_num) {
		int res = adminMapper.adminDeleteBrand(brand_num);
		String msg =null, url = null;
		if (res>0) {
			msg = "브랜드가 삭제되었습니다";
			url = "adminCategory.admin";
		}else {
			msg = "브랜드 삭제가 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminCategory.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping("/adminDeleteProductCategory.admin")
	public ModelAndView adminDeleteProductCategory(int pc_num) {
		int res = adminMapper.adminDeleteProductCategory(pc_num);
		String msg =null, url = null;
		if (res>0) {
			msg = "카테고리가 삭제되었습니다";
			url = "adminCategory.admin";
		}else {
			msg = "카테고리 삭제가 실패되었습니다, 서비스 센터에 문의하세요";
			url = "adminCategory.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	
	
//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////용 품/////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	@RequestMapping("/adminProduct.admin")
	public String adminProduct(HttpServletRequest req,@RequestParam(required=false) String search,@RequestParam(value="page",defaultValue="1") int page) {
		List<BrandCategoryDTO> adminListBrand = adminMapper.adminListBrand();
		List<ProductCategoryDTO> adminListProductCategory = adminMapper.adminListProductCategoty();
		List<ProductDTO> adminListProduct = new ArrayList<ProductDTO>();
		
		if (search==null || search.equals("")) {
			adminListProduct = adminMapper.adminListProduct();
		}else {
			adminListProduct = adminMapper.adminFindProduct(search.trim());
			req.setAttribute("search", search.trim());
		}
		
		req.setAttribute("adminListBrand", adminListBrand);
		req.setAttribute("adminListProductCategory", adminListProductCategory);
		
		//현재 페이지
		req.setAttribute("page", page);
		//총 페이지
		req.setAttribute("pageCount", pagination.pageCount(adminListProduct));
		//현재 페이지에 맞는 게시물 리스트
		req.setAttribute("adminListProduct", pagination.getPagePost(page, adminListProduct));
	
		return "admin/adminProduct";
	}
	
	@RequestMapping(value="/adminRegisterProduct.admin", method=RequestMethod.GET)
	public String adminRegisterProduct(HttpServletRequest req) {
		List<BrandCategoryDTO> adminListBrand = adminMapper.adminListBrand();
		List<ProductCategoryDTO> adminListProductCategory = adminMapper.adminListProductCategoty();
		
		req.setAttribute("adminListBrand", adminListBrand);
		req.setAttribute("adminListProductCategory", adminListProductCategory);
		return "admin/adminRegisterProduct";
	}
	
	@RequestMapping(value="/adminRegisterProduct.admin", method=RequestMethod.POST)
	public ModelAndView adminRegisterProduct(HttpServletRequest req,@ModelAttribute ProductDTO dto,@RequestParam("prod_viewImage") MultipartFile[] file,@RequestParam Map<String,String> map) {
		BrandCategoryDTO bdto = new BrandCategoryDTO();
		bdto.setBrand_num(Integer.parseInt(map.get("brand_num")));
		dto.setBrandCategoryDTO(bdto);
		
		ProductCategoryDTO cdto = new ProductCategoryDTO();
		cdto.setPc_num(Integer.parseInt(map.get("pc_num")));
		dto.setProductCategoryDTO(cdto);
		
		
		//다중파일 전송
		for (MultipartFile f : file) {
			try {
				String str = S3FileService.upload(f);	
				
				if (dto.getProd_viewImage1()==null) dto.setProd_viewImage1(str);
				else if (dto.getProd_viewImage2()==null) dto.setProd_viewImage2(str);
				else if (dto.getProd_viewImage3()==null) dto.setProd_viewImage3(str);
				else if (dto.getProd_viewImage4()==null) dto.setProd_viewImage4(str);
				else if (dto.getProd_viewImage5()==null) dto.setProd_viewImage5(str);
			}catch(IOException e) {
				e.printStackTrace();
			}
			
		}
		
		int res = adminMapper.adminInsertProduct(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "용품이 등록되었습니다";
			url = "adminProduct.admin";
		}else {
			msg = "용품 등록이 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminProduct.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping(value="/adminViewProduct.admin", method=RequestMethod.GET)
	public String adminViewProduct(HttpServletRequest req, @RequestParam int prod_num) {
		ProductDTO pdto = adminMapper.adminGetProduct(prod_num);
		
		req.setAttribute("pdto", pdto);
		
		return "admin/adminViewProduct";
	}
	
	@RequestMapping(value="/adminViewProduct.admin", method=RequestMethod.POST)
	public ModelAndView adminViewProduct(HttpServletRequest req,@ModelAttribute ProductDTO dto, @RequestParam("prod_viewImage") MultipartFile[] file,
			@RequestParam Map<String,String> map) {
		
		if (!map.containsKey("prod_popular1")) dto.setProd_popular(1);
		else dto.setProd_popular(0);
		
		//용품 이미지 수정했을시
		if (!file[0].isEmpty()) {
			//기존 파일 삭제
			if (map.containsKey("prod_viewImageHidden1")) S3FileService.deleteImage(map.get("prod_viewImageHidden1"));
			if (map.containsKey("prod_viewImageHidden2")) S3FileService.deleteImage(map.get("prod_viewImageHidden2"));
			if (map.containsKey("prod_viewImageHidden3")) S3FileService.deleteImage(map.get("prod_viewImageHidden3"));
			if (map.containsKey("prod_viewImageHidden4")) S3FileService.deleteImage(map.get("prod_viewImageHidden4"));
			if (map.containsKey("prod_viewImageHidden5")) S3FileService.deleteImage(map.get("prod_viewImageHidden5"));
			
			//새 이미지 업로드
			for (MultipartFile f : file) {
				try {
					String filename = S3FileService.upload(f);
					
					if (dto.getProd_viewImage1()==null) dto.setProd_viewImage1(filename);
					else if (dto.getProd_viewImage2()==null) dto.setProd_viewImage2(filename);
					else if (dto.getProd_viewImage3()==null) dto.setProd_viewImage3(filename);
					else if (dto.getProd_viewImage4()==null) dto.setProd_viewImage4(filename);
					else if (dto.getProd_viewImage5()==null) dto.setProd_viewImage5(filename);
		
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
			
		//이미지 수정 안했을 때
		}else {
			if (map.containsKey("prod_viewImageHidden1")) dto.setProd_viewImage1(map.get("prod_viewImageHidden1"));
			if (map.containsKey("prod_viewImageHidden2")) dto.setProd_viewImage2(map.get("prod_viewImageHidden2"));
			if (map.containsKey("prod_viewImageHidden3")) dto.setProd_viewImage3(map.get("prod_viewImageHidden3"));
			if (map.containsKey("prod_viewImageHidden4")) dto.setProd_viewImage4(map.get("prod_viewImageHidden4"));
			if (map.containsKey("prod_viewImageHidden5")) dto.setProd_viewImage5(map.get("prod_viewImageHidden5"));
		}
		
		int res = adminMapper.adminUpdateProduct(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "용품이 수정되었습니다";
			url = "adminProduct.admin";
		}else {
			msg = "용품수정이 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminProduct.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping("/adminDeleteProduct.admin")
	public ModelAndView adminDeleteProduct(@RequestParam int prod_num) {
		//기존 AWS 이미지 삭제
		ProductDTO dto = adminMapper.adminGetProduct(prod_num);
		if (dto.getProd_viewImage1()!=null) S3FileService.deleteImage(dto.getProd_viewImage1());
		if (dto.getProd_viewImage2()!=null) S3FileService.deleteImage(dto.getProd_viewImage2());
		if (dto.getProd_viewImage3()!=null) S3FileService.deleteImage(dto.getProd_viewImage3());
		if (dto.getProd_viewImage4()!=null) S3FileService.deleteImage(dto.getProd_viewImage4());
		if (dto.getProd_viewImage5()!=null) S3FileService.deleteImage(dto.getProd_viewImage5());
		
		//DB에서 삭제
		int res = adminMapper.adminDeleteProduct(prod_num);
		
		String msg =null, url = null;
		if (res>0) {
			msg = "용품이 삭제되었습니다";
			url = "adminProduct.admin";
		}else {
			msg = "용품 삭제가 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminProduct.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////회 원//////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	@RequestMapping("/adminMember.admin")
	public String adminMember(HttpServletRequest req,@RequestParam(value="page",defaultValue="1") int page,@RequestParam(required=false) Map<String,String> map) {
		List<MemberDTO> adminListMember = adminMapper.adminListMember();
			
		// 정렬만 있을때
		if((map.get("sort") != null && !map.get("sort").equals("")) && (map.get("name1") == null || map.get("name1").equals(""))) {
			adminListMember = adminMapper.adminListMemberSort(map);
		}
		// 검색만 있을때
		if((map.get("name1") != null && !map.get("name1").equals("")) && (map.get("sort") == null || map.get("sort").equals(""))) {
			adminListMember = adminMapper.adminListMemberSearch(map);
		}
		// 둘 다 있을때
		if ((map.get("sort") != null && !map.get("sort").equals("")) && (map.get("name1") != null && !map.get("name1").equals(""))) {
			adminListMember = adminMapper.adminListMemberSearchAndSort(map);
		}
		
		req.setAttribute("sort", map.get("sort"));
		req.setAttribute("name1", map.get("name1"));
		req.setAttribute("name2", map.get("name2"));
		
		//현재 페이지
		req.setAttribute("page", page);
		//총 페이지
		req.setAttribute("pageCount", pagination.pageCount(adminListMember));
		//현재 페이지에 맞는 게시물 리스트
		req.setAttribute("adminListMember", pagination.getPagePost(page, adminListMember));
		
		return "admin/adminMember";
	}
	
	@RequestMapping(value="/adminViewMember.admin",method=RequestMethod.GET)
	public String adminViewMember(HttpServletRequest req,@RequestParam int mem_num) {
		MemberDTO dto = adminMapper.adminGetMember(mem_num);
		req.setAttribute("mdto", dto);
      
		//포인트 내역
		List<PointLogDTO> listPointLog = adminMapper.adminListPointLog(mem_num);
		req.setAttribute("listPointLog", listPointLog);
		return "admin/adminViewMember";
	}
	
	@RequestMapping(value="/adminViewMember.admin",method=RequestMethod.POST)
	public ModelAndView adminDenyMember(@RequestParam(required=false) Map<String,String> map) {
		if (map.containsKey("denied")) {
			map.put("mem_denied", "0");
		}else {
			map.put("mem_denied", "1");
		}
		int res = adminMapper.adminDenyMember(map);
		String msg =null, url = null;
		if (res>0) {
			msg = "수정되었습니다";
			url = "adminMember.admin";
		}else {
			msg = "수정 실패했습니다. 서비스 센터에 문의하세요";
			url = "adminMember.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	
	
//////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////장 소 리 뷰////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	@RequestMapping("/adminReviewRegion.admin")
	public String adminReviewRegion(HttpServletRequest req,@RequestParam(value="page",defaultValue="1") int page,@RequestParam(required=false) Map<String,String> map) {
		
		List<ReviewRegionDTO> adminListReviewRegion = adminMapper.adminListReviewRegion();
		
		//정렬만 있을때
		if ((map.get("sort") != null && !map.get("sort").equals("")) && (map.get("search") == null || map.get("search").equals(""))) {
			adminListReviewRegion = adminMapper.adminListReviewRegionSort(map);
		}
		
		//검색만 있을때
		if ((map.get("search") != null && !map.get("search").equals("")) && (map.get("sort") == null || map.get("sort").equals(""))) {
			adminListReviewRegion = adminMapper.adminListReviewRegionSearch(map);
		}
		
		//둘다 있을때
		if ((map.get("sort") != null && !map.get("sort").equals("")) && (map.get("search") != null && !map.get("search").equals(""))){
			adminListReviewRegion = adminMapper.adminListReviewRegionSearchAndSort(map);
		}
		
		req.setAttribute("sort", map.get("sort"));
		req.setAttribute("search", map.get("search"));
		
		//현재 페이지
		req.setAttribute("page", page);
		//총 페이지
		req.setAttribute("pageCount", pagination.pageCount(adminListReviewRegion));
		//현재 페이지에 맞는 게시물 리스트
		req.setAttribute("adminListReviewRegion", pagination.getPagePost(page, adminListReviewRegion));
		
		return "admin/adminReviewRegion";
	}
	
	@RequestMapping(value="/adminViewReviewRegion.admin",method=RequestMethod.GET)
	public String adminViewReviewRegion(HttpServletRequest req,@RequestParam int review_num) {
		ReviewRegionDTO dto = adminMapper.adminGetReviewRegion(review_num);
		req.setAttribute("rdto", dto);
		return "admin/adminViewReviewRegion";
	}
	
	@RequestMapping(value="/adminViewReviewRegion.admin",method=RequestMethod.POST)
	public ModelAndView adminViewReviewRegion(@RequestParam(required=false) Map<String,String> map) {
		
		if (map.containsKey("review_popular1")) {
			map.put("review_popular", "0");
		}else {
			map.put("review_popular", "1");
		}
		
		if (map.containsKey("review_adminConfirm1")) {
			map.put("review_adminConfirm", "0");
		}else {
			map.put("review_adminConfirm", "1");
		}
		
		int res = adminMapper.adminUpdateReviewRegion(map);
		String msg =null, url = null;
		if (res>0) {
			msg = "수정되었습니다";
			url = "adminReviewRegion.admin";
		}else {
			msg = "수정실패했습니다. 서비스 센터에 문의하세요";
			url = "adminReviewRegion.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}

	
	
//////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////용 품 리 뷰////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	@RequestMapping("/adminReviewProduct.admin")
	public String adminReviewProduct(HttpServletRequest req,@RequestParam(required=false) Map<String,String> map,
			@RequestParam(value="page",defaultValue="1") int page) {
		List<ReviewProductDTO> adminListReviewProduct = adminMapper.adminListReviewProduct();
		
		//정렬만 있을때
		if ((map.get("sort") != null && !map.get("sort").equals("")) && (map.get("search") == null || map.get("search").equals(""))) {
			adminListReviewProduct = adminMapper.adminListReviewProductSort(map);
		}
		
		//검색만 있을때
		if ((map.get("search") != null && !map.get("search").equals("")) && (map.get("sort") == null || map.get("sort").equals(""))) {	
			adminListReviewProduct = adminMapper.adminListReviewProductSearch(map);
		}
		
		//둘다 있을때
		if ((map.get("sort") != null && !map.get("sort").equals("")) && (map.get("search") != null && !map.get("search").equals(""))){
			adminListReviewProduct = adminMapper.adminListReviewProductSearchAndSort(map);
		}
		
		req.setAttribute("sort", map.get("sort"));
		req.setAttribute("search", map.get("search"));
		
		//현재 페이지
		req.setAttribute("page", page);
		//총 페이지
		req.setAttribute("pageCount", pagination.pageCount(adminListReviewProduct));
		//현재 페이지에 맞는 게시물 리스트
		req.setAttribute("adminListReviewProduct", pagination.getPagePost(page, adminListReviewProduct));
		
		return "admin/adminReviewProduct";
	}
	
	@RequestMapping(value="/adminViewReviewProduct.admin",method=RequestMethod.GET)
	public String adminViewReviewProduct(HttpServletRequest req,@RequestParam int rp_num) {
		ReviewProductDTO dto = adminMapper.adminGetReviewProduct(rp_num);
		req.setAttribute("rdto", dto);
		return "admin/adminViewReviewProduct";
	}
	
	@RequestMapping(value="/adminViewReviewProduct.admin",method=RequestMethod.POST)
	public ModelAndView adminViewReviewProduct(@RequestParam(required=false) Map<String,String> map) {
		
		if (map.containsKey("rp_popular1")) {
			map.put("rp_popular", "0");
		}else {
			map.put("rp_popular", "1");
		}
		
		if (map.containsKey("rp_adminConfirm1")) {
			map.put("rp_adminConfirm", "0");
		}else {
			map.put("rp_adminConfirm", "1");
		}
		
		int res = adminMapper.adminUpdateReviewProduct(map);
		String msg =null, url = null;
		if (res>0) {
			msg = "수정되었습니다";
			url = "adminReviewProduct.admin";
		}else {
			msg = "수정 실패했습니다. 서비스 센터에 문의하세요";
			url = "adminReviewProduct.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	


//////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////공 지 사 항////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
	

	
	@RequestMapping("/adminAnnounce.admin")
	public String adminAnnounce(HttpServletRequest req,@RequestParam(required=false) Map<String,String> map,
			@RequestParam(value="page",defaultValue="1") int page) {
		List<AdminAnnounceDTO> list = new ArrayList<AdminAnnounceDTO>();
		
		if (map.containsKey("sort")) {
			list = adminMapper.adminListAnnounceSort(map);
		}else {
			list = adminMapper.adminListAnnounce();
		}
		//현재 페이지
		req.setAttribute("page", page);
		//총 페이지
		req.setAttribute("pageCount", pagination.pageCount(list));
		//현재 페이지에 맞는 게시물 리스트
		req.setAttribute("adminListAnnounce", pagination.getPagePost(page, list));
		
		return "admin/adminAnnounce";
	}
	
	@RequestMapping(value="/adminRegisterAnnounce.admin", method=RequestMethod.GET)
	public String adminInsertAnnounce() {
		return "admin/adminRegisterAnnounce";
	}
	
	@RequestMapping(value="/adminRegisterAnnounce.admin", method=RequestMethod.POST)
	public ModelAndView adminInsertAnnounce(HttpServletRequest req,@ModelAttribute AdminAnnounceDTO dto,
			@RequestParam("aa_image") MultipartFile[] file) {
		
		//AWS에 파일업로드
		for (MultipartFile f : file) {
			try {
				String str = S3FileService.upload(f);
				
				if (dto.getAa_image1()==null) dto.setAa_image1(str);
				else if (dto.getAa_image2()==null) dto.setAa_image2(str);
				else if (dto.getAa_image3()==null) dto.setAa_image3(str);
				else if (dto.getAa_image4()==null) dto.setAa_image4(str);
				else if (dto.getAa_image5()==null) dto.setAa_image5(str);
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		int res = adminMapper.adminInsertAnnounce(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "공지사항이 등록되었습니다";
			url = "adminAnnounce.admin";
		}else {
			msg = "공지사항 등록이 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminAnnounce.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping(value="/adminViewAnnounce.admin", method=RequestMethod.GET)
	public String adminViewAnnounce(HttpServletRequest req,@RequestParam int aa_num) {
		AdminAnnounceDTO dto = adminMapper.adminGetAnnounce(aa_num);
		req.setAttribute("adto", dto);
		
		return "admin/adminViewAnnounce";
	}
	
	@RequestMapping(value="/adminViewAnnounce.admin", method=RequestMethod.POST)
	public ModelAndView adminViewAnnounce(HttpServletRequest req,@RequestParam("aa_image") MultipartFile[] file,
			@ModelAttribute AdminAnnounceDTO dto,@RequestParam Map<String,String> map) {
		
		//이미지 수정했을때
		if (!file[0].isEmpty()) {
			//기존 파일 삭제
			if (map.containsKey("aa_imageHidden1")) S3FileService.deleteImage(map.get("aa_imageHidden1"));
			if (map.containsKey("aa_imageHidden2")) S3FileService.deleteImage(map.get("aa_imageHidden2"));
			if (map.containsKey("aa_imageHidden3")) S3FileService.deleteImage(map.get("aa_imageHidden3"));
			if (map.containsKey("aa_imageHidden4")) S3FileService.deleteImage(map.get("aa_imageHidden4"));
			if (map.containsKey("aa_imageHidden5")) S3FileService.deleteImage(map.get("aa_imageHidden5"));
			
			//새 파일 AWS에 업로드
			for (MultipartFile f : file) {
				try {
					String str = S3FileService.upload(f);		
					if (dto.getAa_image1()==null) dto.setAa_image1(str);
					else if (dto.getAa_image2()==null) dto.setAa_image2(str);
					else if (dto.getAa_image3()==null) dto.setAa_image3(str);
					else if (dto.getAa_image4()==null) dto.setAa_image4(str);
					else if (dto.getAa_image5()==null) dto.setAa_image5(str);

				}catch(IOException e) {
					e.printStackTrace();
				}
			}
			
		//이미지 수정 안했을 때
		}else {
			if (map.containsKey("aa_imageHidden1")) dto.setAa_image1(map.get("aa_imageHidden1"));
			if (map.containsKey("aa_imageHidden2")) dto.setAa_image2(map.get("aa_imageHidden2"));
			if (map.containsKey("aa_imageHidden3")) dto.setAa_image3(map.get("aa_imageHidden3"));
			if (map.containsKey("aa_imageHidden4")) dto.setAa_image4(map.get("aa_imageHidden4"));
			if (map.containsKey("aa_imageHidden5")) dto.setAa_image5(map.get("aa_imageHidden5"));
		}
		int res = adminMapper.adminUpdateAnnounce(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "수정되었습니다";
			url = "adminAnnounce.admin";
		}else {
			msg = "수정실패했습니다. 서비스 센터에 문의하세요";
			url = "adminAnnounce.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	@RequestMapping("/adminDeleteAnnounce.admin")
	public ModelAndView adminDeleteAnnounce(@RequestParam int aa_num) {
		int res = adminMapper.adminDeleteAnnounce(aa_num);
		String msg =null, url = null;
		if (res>0) {
			msg = "삭제되었습니다";
			url = "adminAnnounce.admin";
		}else {
			msg = "삭제 실패했습니다. 서비스 센터에 문의하세요";
			url = "adminAnnounce.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}

	
	
//////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////문 의 사 항////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	@RequestMapping("/adminQuestion.admin")
	public String adminQuestion(HttpServletRequest req,@RequestParam(required=false) Map<String,String> map,
			@RequestParam(value="page",defaultValue="1") int page) {
		List<QuestionDTO> adminListQuestion = new ArrayList<QuestionDTO>();
		
		if (map.containsKey("sort")) {
			if (map.get("sort").equals("question_sysdate")) {
				adminListQuestion = adminMapper.adminListQuestionSys(map);
			}else {
				adminListQuestion = adminMapper.adminListQuestionRep(map);
			}
		}else {
			adminListQuestion = adminMapper.adminListQuestion();
		}
		
		//현재 페이지
		req.setAttribute("page", page);
		//총 페이지
		req.setAttribute("pageCount", pagination.pageCount(adminListQuestion));
		//현재 페이지에 맞는 게시물 리스트
		req.setAttribute("adminListQuestion", pagination.getPagePost(page, adminListQuestion));
		
		return "admin/adminQuestion";
	}
	
	@RequestMapping(value="/adminViewQuestion.admin", method=RequestMethod.GET)
	public String adminViewQuestion(HttpServletRequest req, @RequestParam int question_num) {
		QuestionDTO dto = adminMapper.adminGetQuestion(question_num);
		
		req.setAttribute("qdto", dto);	
		return "admin/adminViewQuestion";
	}
	
	@RequestMapping(value="/adminViewQuestion.admin", method=RequestMethod.POST)
	public ModelAndView adminViewQuestion(@ModelAttribute QuestionDTO dto) {
		int res = adminMapper.adminUpdateQuestion(dto);
		String msg =null, url = null;
		if (res>0) {
			msg = "답글이 작성(수정)되었습니다";
			url = "adminQuestion.admin";
		}else {
			msg = "답글 작성(수정)이 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminQuestion.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	
	
	
//////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////대 여 내 역////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	@RequestMapping("/adminRental.admin")
	public String adminRental(HttpServletRequest req,@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(required=false) Map<String,String> map) {
		List<RentalLogDTO> list = adminMapper.adminListRentalLog();
		if (map.get("rental_from_date") == null || map.get("rental_from_date").equals("")) {
			map.put("rental_from_date","2021-06-01");
//			Date date = new Date();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
//			System.out.println(sdf.format(date));
		}
		if (map.get("rental_to_date") == null || map.get("rental_to_date").equals("")) {
			map.put("rental_to_date", "2100-06-01");
		}
		
		if (map.get("rental_date") == null || map.get("rental_date").equals("")) {
			map.put("rental_date", "rental_from");
		}
		
		//정렬만 있을때
		if ((map.get("sort") != null && !map.get("sort").equals("")) && (map.get("search") == null || map.get("search").equals(""))) {
			list = adminMapper.adminListRentalLogSort(map);
			
		}
		//검색만 있을때
		if ((map.get("search") != null && !map.get("search").equals("")) && (map.get("sort") == null || map.get("sort").equals(""))) {
			list = adminMapper.adminListRentalLogSearch(map);

		}
		//둘다 있을때
		if ((map.get("sort") != null && !map.get("sort").equals("")) && (map.get("search") != null && !map.get("search").equals(""))) {
			list = adminMapper.adminListRentalLogSearchAndSort(map);
			
		}
		req.setAttribute("rental_from_date", map.get("rental_from_date"));
		req.setAttribute("rental_to_date", map.get("rental_to_date"));
		req.setAttribute("rental_date", map.get("rental_date"));
		req.setAttribute("sort", map.get("sort"));
		req.setAttribute("search", map.get("search"));
		
		
		//현재 페이지
		req.setAttribute("page", page);
		//총 페이지
		req.setAttribute("pageCount", pagination.pageCount(list));
		//현재 페이지에 맞는 게시물 리스트
		req.setAttribute("adminListRentalLog", pagination.getPagePost(page, list));

		return "admin/adminRental";
	}
	
	@RequestMapping(value="/adminViewRentalLog.admin",method=RequestMethod.GET)
	public String adminViewRentalLog(HttpServletRequest req,@RequestParam int rental_num) {
		RentalLogDTO dto = adminMapper.adminGetRentalLog(rental_num);
		
		req.setAttribute("rdto", dto);
		return "admin/adminViewRentalLog";
	}
	
	@RequestMapping(value="/adminViewRentalLog.admin",method=RequestMethod.POST)
	public ModelAndView adminViewRentalLog(@RequestParam Map<String,String> map) {
		int res = adminMapper.adminUpdateRentalLog(map);
		String msg =null, url = null;
		if (res>0) {
			msg = "수정되었습니다";
			url = "adminRental.admin";
		}else {
			msg = "수정이 실패되었습니다. 서비스 센터에 문의하세요";
			url = "adminRental.admin";
		}
		ModelAndView mav = new ModelAndView("admin/message");
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		return mav;
	}
	
	//공지사항 보기 - user  박혜성 추가 0701
	   @RequestMapping("/uesrAnnounce.admin")
	   public String uesrAnnounce(HttpServletRequest req,@RequestParam(required=false) Map<String,String> map,
	         @RequestParam(value="page",defaultValue="1") int page) {
	      List<AdminAnnounceDTO> list = new ArrayList<AdminAnnounceDTO>();
	      
	      if (map.containsKey("sort")) {
	         list = adminMapper.adminListAnnounceSort(map);
	      }else {
	         list = adminMapper.adminListAnnounce();
	      }
	      //현재 페이지
	      req.setAttribute("page", page);
	      //총 페이지
	      req.setAttribute("pageCount", pagination.pageCount(list));
	      //현재 페이지에 맞는 게시물 리스트
	      req.setAttribute("adminListAnnounce", pagination.getPagePost(page, list));
	      
	      return "announce";
	   }
	   
	   @RequestMapping(value="/userViewAnnounce.admin", method=RequestMethod.GET)
	   public String userViewAnnounce(HttpServletRequest req,@RequestParam int aa_num) {
	      AdminAnnounceDTO dto = adminMapper.adminGetAnnounce(aa_num);
	      req.setAttribute("adto", dto);
	      
	      return "announceView";
	   }
	
}
