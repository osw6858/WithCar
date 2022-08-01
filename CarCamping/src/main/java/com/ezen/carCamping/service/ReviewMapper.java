package com.ezen.carCamping.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.BrandCategoryDTO;
import com.ezen.carCamping.dto.ProductCategoryDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

@Service
public class ReviewMapper {
	@Autowired
	private SqlSession	sqlSession;

	/*
	 * 리뷰 등록
	*/
	public int insertReviewRegion(ReviewRegionDTO dto) {
		   int res = sqlSession.insert("insertReviewRegion", dto);
		   return res;
	   }
	 
	public int insertReviewProduct(ReviewProductDTO dto) {
		   int res = sqlSession.insert("insertReviewProduct", dto);
		   return res;
	   }

	/*
	 * 용품 리뷰 전체 카테고리  & 브랜드 가져오기
	*/	
	public List<ProductCategoryDTO> listAllProdCate(){
		return sqlSession.selectList("listAllProdCate");
	}
	
	public List<BrandCategoryDTO> listAllBrandCate(){
		return sqlSession.selectList("listAllBrandCate");
	}
	
	/*
	 * 카테고리와 브랜드로 용품 리스트 가져오기
	 */
	public List<ProductDTO> listProdByCategory(int pc_num, int brand_num){
		Map<String,Integer> map = new Hashtable<>();
		System.out.println(pc_num+"---"+brand_num);
		map.put("pc_num", pc_num);
		map.put("brand_num", brand_num);
		return sqlSession.selectList("listProdByCategory",map);
	}
}
