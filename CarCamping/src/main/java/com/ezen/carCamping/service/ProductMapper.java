package com.ezen.carCamping.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.AgencyDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;

@Service
public class ProductMapper {

	@Autowired
	private SqlSession sqlSession;

	public List<ProductDTO> popularProduct() {// 인기용품 리스트
		List<ProductDTO> popList = sqlSession.selectList("popularProd");
		return popList;
	}
	
	public List<ProductDTO> popularProdRank() {
		List<ProductDTO> rank = sqlSession.selectList("popularProdRank");
		return rank;
	}

	public ProductDTO getProduct(int prod_num) {
		ProductDTO dto = sqlSession.selectOne("getProduct", prod_num);
		if (dto != null)
			return dto;
		else
			return null;
	}


	public List<ProductDTO> listProductPrice(int startRow, int endRow) {
		java.util.Map<String, Object> map = new Hashtable<>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO> listProductPrice = sqlSession.selectList("listProductPrice", map);
		return listProductPrice;
	}

	public List<ProductDTO> listProductNew( int startRow, int endRow) {
		java.util.Map<String, Object> map = new Hashtable<>();

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO> listProductNew = sqlSession.selectList("listProductNew", map);
		return listProductNew;
	}

	public List<ProductDTO> listProductPop(int startRow, int endRow) {
		java.util.Map<String, Object> map = new Hashtable<>();

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO> listProductPop = sqlSession.selectList("listProductPop", map);
		return listProductPop;
	}
	
	public List<ProductDTO> listProductPrice(String search,int startRow , int endRow){
		java.util.Map<String,Object> map = new Hashtable<>();
		map.put("search", search);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO> listProductPrice = sqlSession.selectList("listProductPrice",map);
		return listProductPrice;
	}
	public List<ProductDTO> listProductNew(String search,int startRow , int endRow){
		java.util.Map<String,Object> map = new Hashtable<>();
		
		search = "prod_name";
		map.put("search", search);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO>listProductNew = sqlSession.selectList("listProductNew",map);
		return listProductNew;
	}
	public List<ProductDTO> listProductPop(String search,int startRow , int endRow){
		java.util.Map<String,Object> map = new Hashtable<>();
		
		map.put("search", search);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO> listProductPop= sqlSession.selectList("listProductPop",map);
		return listProductPop;
	}
	public List<ProductDTO> listProductsearchPrice(String search,String searchString,int startRow , int endRow){
		java.util.Map<String,Object> map = new Hashtable<>();
		map.put("search", search);
		map.put("searchString", searchString);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO> listProductsearchPrice = sqlSession.selectList("listProductsearchPrice", map);
		return listProductsearchPrice;
	}


	public List<ProductDTO> listProductsearchNew(String search,String searchString,int startRow , int endRow){
		java.util.Map<String,Object> map = new Hashtable<>();

		map.put("search", search);
		map.put("searchString", searchString);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO> listProductsearchNew = sqlSession.selectList("listProductsearchNew", map);
		return listProductsearchNew;
	}


	public List<ProductDTO> listProductsearchPop(String search,String searchString,int startRow , int endRow){
		java.util.Map<String,Object> map = new Hashtable<>();
		map.put("search", search);
		map.put("searchString", searchString);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO> listProductsearchPop = sqlSession.selectList("listProductsearchPop", map);
	return listProductsearchPop;
	}



	
	public List<ReviewProductDTO> listProdReview(int prod_num){
		List<ReviewProductDTO>list= sqlSession.selectList("listProdReview", prod_num);
		return list; 
	}

	public List<ReviewProductDTO> findReview(int prod_num,String search, String searchString) {
		java.util.Map<String, Object> map = new Hashtable<String, Object>();
		map.put("prod_num",prod_num);
		map.put("search", search);
		map.put("searchString", searchString);
		List<ReviewProductDTO> list = sqlSession.selectList("findProdReview", map);
		return list;
	}

	 public ReviewProductDTO getReviewView(int rp_num) {
	      ReviewProductDTO dto = sqlSession.selectOne("getReviewView", rp_num);
	      return dto;
	   }

	public List<AgencyDTO> getAgency() {
		List<AgencyDTO> dto = sqlSession.selectList("getAgency");
		return dto;
	}

	public int plusReviewReadCount(int rp_num) {
		return sqlSession.update("plusReviewReadCount", rp_num);
	}

	public int minReviewReadCount(int rp_num) {
		return sqlSession.update("minReviewReadCount", rp_num);
	}

	public int plusLikeCount(int rp_num) {
		return sqlSession.update("plusLikeCount", rp_num);
	}
	public int minLikeCount(int rp_num) {
		return sqlSession.update("minLikeCount", rp_num);
	}

	public List<ProductDTO> findProduct(String search, String searchString, int startRow, int endRow) {
		Map<String, Object> map = new Hashtable<>();
		System.out.println(map);
		map.put("search", search);
		map.put("searchString", searchString);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<ProductDTO> list = sqlSession.selectList("findProduct", map);
		return list;
	}

	public List<ProductDTO> listProduct(int startRow, int endRow) {
		Map<String, Object> map = new Hashtable<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		System.out.println("매퍼의 map:" + map);
		List<ProductDTO> list = sqlSession.selectList("listProduct", map);
		System.out.println("매퍼의 map:" + map);
		return list;
	}

	public int listProductMainCount() {
		int count = sqlSession.selectOne("listProductMainCount");
		return count;
	}
	
		public int countReviewProd(int prod_num) {
		int count = (int)sqlSession.selectOne("countReviewProd", prod_num);
		return count;
	}


	/*0627 박혜성 추가*/
	// 검색 결과 rowcount
	public int countProductSeacrch(String search, String searchString) {
		java.util.Map<String, String> map = new Hashtable<String, String>();
		map.put("search", search);
		map.put("searchString", searchString);
		int count = sqlSession.selectOne("countProductSeacrch", map);
		return count;

	}

	public int recountProductReviewLike(int rp_num) {
		int res = (int)sqlSession.selectOne("recountProductReviewLike", rp_num);
		return res;
	}
	   public int insertProductReviewLikeLog(String mem_id,int rp_num) {
		      Map<String,Object> map = new Hashtable<>();
		      map.put("mem_id", mem_id);
		      map.put("rp_num",rp_num);
		      int ud = sqlSession.update("plusLikeCount", rp_num);
		      if(ud>0) sqlSession.insert("insertProductReviewLikeLog", map);
		      int res =(int)sqlSession.selectOne("recountProductReviewLike", rp_num);
		      return res;
		   }
		   public int deleteProductReviewLikeLog(String mem_id,int rp_num) {
		      Map<String,Object> map = new Hashtable<>();
		      map.put("mem_id", mem_id);
		      map.put("rp_num", rp_num);
		      int ud = sqlSession.update("minusLikeCount", rp_num);
		      if(ud>0) sqlSession.delete("deleteProductReviewLikeLog", map);
		      int res =(int)sqlSession.selectOne("recountProductReviewLike", rp_num);
		      return res;
		   }
		//리뷰 좋아요 내역 체크
		public int checkProductReviewLikeLog(String mem_id,int rp_num) {
			Map<String,Object> map = new Hashtable<>();
			map.put("mem_id", mem_id);
			map.put("rp_num", rp_num);
			int res = (int)sqlSession.selectOne("checkProductReviewLikeLog", map);
			if(res>0) System.out.println("해당 아이디의  해당 리뷰에 대해 추천한 기록이있습니다");
			else System.out.println("해당 아이디의 해당 리뷰에 대해 추천한 기록이 없습니다");
			return res;
		}
		//리뷰 상세보기 조회수 
		public int addProductReviewReadCount(int rp_num) {
			return sqlSession.update("addProductReviewReadCount", rp_num);
		}
	//브랜드 검색 로우카운트
	  public int listProductbrandSearch(String searchString){ 
		  return sqlSession.selectOne("listProductbrandSearch", searchString); 
	  }
	  
	  //조장님
	  public List<ReviewProductDTO> listReviewsearchLike(String search,String searchString,int prod_num){
	      java.util.Map<String,Object> map = new Hashtable<>();
	      map.put("search", search);
	      map.put("searchString", searchString);
	      map.put("prod_num", prod_num);
	      List<ReviewProductDTO> listReviewsearchLike = sqlSession.selectList("listReviewsearchLike", map);
	      return listReviewsearchLike;
	   }


	   public List<ReviewProductDTO> listReviewsearchSysdate(String search,String searchString,int prod_num){
	      java.util.Map<String,Object> map = new Hashtable<>();

	      map.put("search", search);
	      map.put("searchString", searchString);
	      map.put("prod_num", prod_num);
	      List<ReviewProductDTO> listReviewsearchSysdate = sqlSession.selectList("listReviewsearchSysdate", map);
	      return listReviewsearchSysdate;
	   }


	   public List<ReviewProductDTO> listReviewsearchScore(String search,String searchString,int prod_num){
	      java.util.Map<String,Object> map = new Hashtable<>();
	      map.put("search", search);
	      map.put("searchString", searchString);
	      map.put("prod_num", prod_num);
	      List<ReviewProductDTO> listReviewsearchScore = sqlSession.selectList("listReviewsearchScore", map);
	   return listReviewsearchScore;
	   }
	   
	   public List<ReviewProductDTO> R_orderByScore(int prod_num) {
		      List<ReviewProductDTO> list = sqlSession.selectList("R_orderByScore",prod_num);
		      return list;
		   }

		   public List<ReviewProductDTO> R_orderBysysdate(int prod_num) {
		      List<ReviewProductDTO> list = sqlSession.selectList("R_orderBysysdate",prod_num);
		      return list;
		   }
		   
		   public List<ReviewProductDTO> R_orderByLike(int prod_num) {
		      List<ReviewProductDTO> list = sqlSession.selectList("R_orderByLike",prod_num);
		      return list;
		   }

}
