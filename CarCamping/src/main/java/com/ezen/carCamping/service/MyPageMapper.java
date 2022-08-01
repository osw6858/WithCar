package com.ezen.carCamping.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.PointLogDTO;
import com.ezen.carCamping.dto.ProductCartDTO;
import com.ezen.carCamping.dto.QuestionDTO;
import com.ezen.carCamping.dto.RentalLogDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;


@Service
public class MyPageMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<ProductCartDTO> cartProduct(int mem_num) {
		List<ProductCartDTO> dto = sqlSession.selectList("cartProduct",mem_num);
		if (dto != null)
			return dto;
		else
			return null;
	}
	
	 public int insertCart(ProductCartDTO dto) {
		 int res =sqlSession.insert("insertCart", dto);
		 return res; 
	 }
	 
	 public int updateCart(ProductCartDTO cartDTO) {
		 int res = sqlSession.update("updateCart", cartDTO);
		return res;
	 }

	 public int deleteCart(int prod_num) {
		 int res = sqlSession.delete("deleteCart", prod_num);
		 return res;
	 }

	 public String getMemberPassword(int mem_num) {

		 String res = sqlSession.selectOne("getMemberPassword", mem_num);
		 return res;
		}	

	 public int insertCartLog(Map<String, String> params) {
		 int res =sqlSession.insert("insertCartLog", params);
		 return res; 
	 }
	 
	 public int updateCartLogPoint(Map<String, String> params2) {
		 int res =sqlSession.update("updateCartLogPoint", params2);
		 return res; 
	 }
		
		

	 public List<QuestionDTO> myPageGetQuestion(){
		 List<QuestionDTO> myPageGetQuestion = sqlSession.selectList("myPageGetQuestion");
		 return myPageGetQuestion;
	 }
	 
	 public List<QuestionDTO> myPageGetQuestionSelectMember(int mem_num){
			List<QuestionDTO> qdto = sqlSession.selectList("myPageGetQuestionSelectMember",mem_num);
			return qdto;
		}
	public int insertQuestion(QuestionDTO dto) {
		int res = sqlSession.insert("insertQuestion", dto);
		return res;
		}
	public QuestionDTO getQuestion(int question_num){
		QuestionDTO qdto = sqlSession.selectOne("getQuestion", question_num);
		return qdto;
	}


	
	public int payCart(int cart_num) {
		int res = sqlSession.delete("payCart",cart_num );
		return res;
	}

	 public List<ReviewRegionDTO> myPageGetWriteReviewRegion(int mem_num){
			List<ReviewRegionDTO> rdto = sqlSession.selectList("myPageGetWriteReviewRegion",mem_num);
			return rdto;
	}
	 public List<ReviewProductDTO> myPageGetWriteReviewProduct(int mem_num){
			List<ReviewProductDTO> pdto = sqlSession.selectList("myPageGetWriteReviewProduct",mem_num);
			return pdto;
	} 
	 public ReviewRegionDTO getReviewRegion(int review_num){
		 	ReviewRegionDTO rdto = sqlSession.selectOne("getReviewRegion", review_num);
			return rdto;
	}
	 public ReviewProductDTO getReviewProduct(int rp_num){
		 	ReviewProductDTO pdto = sqlSession.selectOne("getReviewProduct", rp_num);
			return pdto;
	}
	public int deleteReviewRegion(int review_num) {
		int res = sqlSession.delete("deleteReviewRegion", review_num);
		return res;
	}
	public int deleteReviewProduct(int rp_num) {
		int res = sqlSession.delete("deleteReviewProduct", rp_num);
		return res;
	}

	
	
	 
	//전용재 -- 용품 좋아요 리뷰  
	public List<ReviewProductDTO> ReviewProductList(int mem_num){
		List<ReviewProductDTO>ReviewProductList =sqlSession.selectList("ReviewProductList",mem_num);
		System.out.println("맵퍼의ReviewProductList:" + ReviewProductList);
		return ReviewProductList;
	}
	
	public List<ReviewRegionDTO> ReviewRegionList(int mem_num){
		List<ReviewRegionDTO> ReviewRegionList =sqlSession.selectList("ReviewRegionList",mem_num);
		return ReviewRegionList;
	}
	public ReviewProductDTO ReviewProductNum(int rp_num) {
		ReviewProductDTO ReviewProductNum = sqlSession.selectOne("ReviewProductNum", rp_num);
		 return ReviewProductNum;
	}	
	public ReviewRegionDTO ReviewRegionNum(int review_num) {
		ReviewRegionDTO ReviewRegionNum =sqlSession.selectOne("ReviewRegionNum", review_num);
		System.out.println("맵퍼의:ReviewRegionNum "+ ReviewRegionNum );
		return ReviewRegionNum;
	}
	public int CountReviewLikeLog(String mem_id,int review_num) {
	      Map<String,Object> map = new Hashtable<>();
	      map.put("mem_id", mem_id);
	      map.put("review_num", review_num);
	      int res = (int)sqlSession.selectOne("CountReviewLikeLog", map);
	      if(res>0) System.out.println("해당 아이디의  해당 리뷰에 대해 추천한 기록이있습니다");
	      else System.out.println("해당 아이디의 해당 리뷰에 대해 추천한 기록이 없습니다");
	      return res;
	   }
	   
	   public int CountProductReviewLikeLog(String mem_id,int rp_num) {
	      Map<String,Object> map = new Hashtable<>();
	      map.put("mem_id", mem_id);
	      map.put("rp_num", rp_num);
	      int res = (int)sqlSession.selectOne("CountProductReviewLikeLog", map);
	      if(res>0) System.out.println("해당 아이디의  해당 리뷰에 대해 추천한 기록이있습니다");
	      else System.out.println("해당 아이디의 해당 리뷰에 대해 추천한 기록이 없습니다");
	      return res;
	   }
	   
	
	 public int DeleteProductReview(Map<String,String> map) {
//	 Map<String,Object> map = new Hashtable<>();
//		 map.put("mem_num", mem_num);
//		map.put("rp_mun",rp_num);	
		 int res = sqlSession.delete("DeleteProductReview", map);
		 return res;
	 } 
	 public int DeleteRegionReveiw(Map<String,String>map) {
		 int res = sqlSession.delete("DeleteRegionReveiw", map);
		 return res;
	 }
	 public int UpdateProductLikeLog(int rp_num) {
		int res = sqlSession.update("UpdateProductLikeLog", rp_num);
		return res;
	 }
	 public int UpdateRegionLikeLog(int review_num) {
		int res = sqlSession.update("UpdateRegionLikeLog", review_num);
		return res;
	 }
	 public List<RentalLogDTO> getRentalLog(Map<String,String> map) {
		 List<RentalLogDTO> dto = sqlSession.selectList("getRentalLog", map);
		 return dto;
	 }
	    public List<ReviewRegionDTO> myPageGetWriteReviewRegion_1(int mem_num){
	         List<ReviewRegionDTO> rdto = sqlSession.selectList("myPageGetWriteReviewRegion_1",mem_num);
	         return rdto;
	   }
	    public List<ReviewProductDTO> myPageGetWriteReviewProduct_1(int mem_num){
	         List<ReviewProductDTO> pdto = sqlSession.selectList("myPageGetWriteReviewProduct_1",mem_num);
	         return pdto;
	   } 
	    
    public int myPageExtendRentalLog(Map<String,String> map) {
        int res = sqlSession.update("myPageExtendRentalLog",map);
        return res;
     }
     
     public List<PointLogDTO> myPageListPointLog(int mem_num) {
        List<PointLogDTO> list = sqlSession.selectList("myPageListPointLog", mem_num);
        return list;
     }
     public RentalLogDTO getRentalLogOne(int rental_num) {
         RentalLogDTO dto = sqlSession.selectOne("getRentalLogOne", rental_num);
         return dto;
      }
}
 








