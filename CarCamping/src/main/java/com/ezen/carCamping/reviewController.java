package com.ezen.carCamping;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;
import com.ezen.carCamping.service.MemberMapper;
import com.ezen.carCamping.service.ProductMapper;
import com.ezen.carCamping.service.RegionMapper;
import com.ezen.carCamping.service.ReviewMapper;
import com.ezen.carCamping.service.S3FileService;


@Controller
public class reviewController {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired 
	private RegionMapper RegionMapper; 

	@Autowired
	private ProductMapper ProductMapper;
	
	@Autowired
	private S3FileService S3FileService;
	
	@RequestMapping(value="field_review.review", method=RequestMethod.GET )
	public String field_review(HttpServletRequest req,@RequestParam(required=false) Integer ccr_num) {

		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources");
		session.setAttribute("upPath", upPath);
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		if(dto==null) {
			req.setAttribute("msg","리뷰 등록을 위해서는 로그인이 필요합니다");
			req.setAttribute("url", "login.login");
			return "message";
		}else {
			req.setAttribute("mem_num", dto.getMem_num());
		}
		if(ccr_num!=null) {
			CarCampingRegionDTO cdto = RegionMapper.selectRegionByCcrnum(ccr_num);
			req.setAttribute("region_num",cdto.getRegionDTO().getRegion_num());
			req.setAttribute("ccr_num",ccr_num);
			req.setAttribute("ccr_name", cdto.getCcr_name());
		}
		return "review/field_review";
	}

	@RequestMapping(value = "ccr_list.review", method=RequestMethod.POST,produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String ccr_list(HttpServletRequest req,HttpServletResponse res ,@RequestParam String region_num) {
		List<CarCampingRegionDTO> list = RegionMapper.listCcr(Integer.parseInt(region_num));
		String ccrListHtml ="";
		for(int i=0;i<list.size();i++) {
			CarCampingRegionDTO dto = list.get(i);
			ccrListHtml += "<option value='"+dto.getCcr_num()+"'>"+dto.getCcr_name()+"</option>";
		}
		return ccrListHtml;
	}
	
	@ResponseBody
	@RequestMapping(value = "/fieldReview_upload.review", method = RequestMethod.POST)
	public String fileUploadFiled(
			@RequestParam("review_Image") List<MultipartFile> multipartFile
			, HttpServletRequest request,ReviewRegionDTO dto) {
		String strResult ="bad";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					//dto image setting
					if (dto.getReview_regionImage1()==null) dto.setReview_regionImage1(S3FileService.upload(file));
					else if (dto.getReview_regionImage2()==null) dto.setReview_regionImage2(S3FileService.upload(file));
					else if (dto.getReview_regionImage3()==null) dto.setReview_regionImage3(S3FileService.upload(file));
					else if (dto.getReview_regionImage4()==null) dto.setReview_regionImage4(S3FileService.upload(file));
					else if (dto.getReview_regionImage5()==null) dto.setReview_regionImage5(S3FileService.upload(file));
				}
				int res = reviewMapper.insertReviewRegion(dto);	
				strResult = "good";
			}
			// 파일 아무것도 첨부 안했을때 
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}	
	
	///////////////////////////////////////////product////////////////////////////////////////
	@RequestMapping(value="goods_review.review", method=RequestMethod.GET )
	public String prod_review(HttpServletRequest req,@RequestParam(required=false) Integer prod_num) {
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources");
		session.setAttribute("upPath", upPath);
		MemberDTO dto = (MemberDTO)session.getAttribute("mbdto");
		if(dto==null) {
			req.setAttribute("msg","리뷰 등록을 위해서는 로그인이 필요합니다");
			req.setAttribute("url", "login.login");
			return "message";
		}else {
			req.setAttribute("mem_num", dto.getMem_num());
			req.setAttribute("prodCateList", reviewMapper.listAllProdCate());
			req.setAttribute("brandCateList", reviewMapper.listAllBrandCate());
		}
		if(prod_num!=null) {
			ProductDTO pdto = ProductMapper.getProduct(prod_num);
			req.setAttribute("pc_num",pdto.getProductCategoryDTO().getPc_num());
			req.setAttribute("brand_num",pdto.getBrandCategoryDTO().getBrand_num());
			req.setAttribute("prod_num",prod_num);
			req.setAttribute("prod_name", pdto.getProd_name());
		}
		return "review/goods_review";
	}

	@RequestMapping(value = "prod_list.review", method=RequestMethod.POST,produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String prod_list(HttpServletRequest req,HttpServletResponse res ,@RequestParam String pc_num,@RequestParam String brand_num) {
		List<ProductDTO> list = reviewMapper.listProdByCategory(Integer.parseInt(pc_num),Integer.parseInt(brand_num));
		String prodListHtml ="";
		for(int i=0;i<list.size();i++) {
			ProductDTO dto = list.get(i);
			prodListHtml += "<option value='"+dto.getProd_num()+"'>"+dto.getProd_name()+"</option>";
		}
		return prodListHtml;
	}
	
	@ResponseBody
	@RequestMapping(value = "/goodsReview_upload.review", method = RequestMethod.POST)
	public String fileUploadGoods(
			@RequestParam("review_Image") List<MultipartFile> multipartFile
			, HttpServletRequest request,ReviewProductDTO dto) {
		String strResult = "bad";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					//dto image setting
					if (dto.getRp_image1()==null) dto.setRp_image1(S3FileService.upload(file));
					else if (dto.getRp_image2()==null) dto.setRp_image2(S3FileService.upload(file));
					else if (dto.getRp_image3()==null) dto.setRp_image3(S3FileService.upload(file));
					else if (dto.getRp_image4()==null) dto.setRp_image4(S3FileService.upload(file));
					else if (dto.getRp_image5()==null) dto.setRp_image5(S3FileService.upload(file));
				}
				int res = reviewMapper.insertReviewProduct(dto);	
				strResult = "good";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}	
	
	@RequestMapping("message.review")
	public String messageReview(String msg,String url,HttpServletRequest req) {
		req.setAttribute("msg",msg);
		req.setAttribute("url",url);
		return "message";
	}

}
