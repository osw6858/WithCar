package com.ezen.carCamping.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.CarCampingRegionDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

@Service
public class RegionMapper{

	@Autowired
	private SqlSession sqlSession;

	private static Hashtable<String,Object> ht = new Hashtable<>();
	
	public static Hashtable<String,Object> getInstance(){

		/*
		 * for(int i=1;i<=9;i++) {
		 * ht.put(String.valueOf(i),listCarCampingRegionHotRegion(i)); }
		 */
		return ht;
	}
	
	public List<RegionDTO> listRegion() {
		List<RegionDTO> list = sqlSession.selectList("listRegion");
		return list;
	}
	public RegionDTO selectRegion(int region_num) {
		RegionDTO dto = sqlSession.selectOne("selectRegion", region_num);
		return dto;
	}
	
	public List<CarCampingRegionDTO> listCcr(int region_num){
		List<CarCampingRegionDTO> list = sqlSession.selectList("listCcr", region_num);
		return list;
	}
	public List<CarCampingRegionDTO> listCarCampingRegionHotRegion(int region_num){
			List<CarCampingRegionDTO> list = sqlSession.selectList("listCarCampingRegionHotRegion", region_num);
			return list;
	}
	
	public List<CarCampingRegionDTO> listHotRegion(){
		List<CarCampingRegionDTO> list = sqlSession.selectList("listHotRegion");
		return list;
	}
	
	public List<CarCampingRegionDTO> listRecommandRegion(){
		List<CarCampingRegionDTO> list = sqlSession.selectList("listRecommandRegion");
		return list;
	}
	
	public CarCampingRegionDTO selectRegionByCcrnum(int ccr_num) {
		CarCampingRegionDTO dto = (CarCampingRegionDTO)sqlSession.selectOne("selectRegionByCcrnum",ccr_num);
		return dto;
	}
	
	public List<ReviewRegionDTO> listCcrReview(int ccr_num , int startRow , int endRow,String orderBy){
		Map<String,Object> map = new Hashtable<>();
		map.put("ccr_num",ccr_num);
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("orderBy",orderBy);
		List<ReviewRegionDTO> list = sqlSession.selectList("listCcrReview", map);
		return list;
	}
	public int countReviewCcrnum(int ccr_num) {
		
		int count = (int)sqlSession.selectOne("countReviewCcrnum", ccr_num);
		return count;
	}

	/*검색*/
	public List<ReviewRegionDTO> listCcrReviewSearch(int ccr_num , int startRow , int endRow,String orderBy,String search,String searchString){
		Map<String,Object> map = new Hashtable<>();
		map.put("ccr_num",ccr_num);
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("orderBy",orderBy);
		map.put("search",search);
		map.put("searchString",searchString);
		List<ReviewRegionDTO> list = sqlSession.selectList("listCcrReviewSearch", map);
		System.out.println("RegionMapper list size : "+list.size());
		return list;	
	}
	public int countReviewSearch(int ccr_num,String search,String searchString) {
		Map<String,Object> map = new Hashtable<>();
		map.put("ccr_num",ccr_num);
		map.put("search",search);
		map.put("searchString",searchString);
		int count = (int)sqlSession.selectOne("countReviewSearch", map);
		return count;
	}
	//작성자 검색 
	public List<ReviewRegionDTO> listCcrReviewWriterSearch(int ccr_num , int startRow , int endRow,String orderBy,String search,String searchString){
		Map<String,Object> map = new Hashtable<>();
		map.put("ccr_num",ccr_num);
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("orderBy",orderBy);
		map.put("search",search);
		map.put("searchString",searchString);
		List<ReviewRegionDTO> list = sqlSession.selectList("listCcrReviewWriterSearch", map);
		System.out.println("RegionMapper list size : "+list.size());
		return list;	
	}
	public int countRevieWrietrSearch(int ccr_num,String search,String searchString) {
		Map<String,Object> map = new Hashtable<>();
		map.put("ccr_num",ccr_num);
		map.put("search",search);
		map.put("searchString",searchString);
		int count = (int)sqlSession.selectOne("countRevieWrietrSearch", map);
		return count;
	}
	//리뷰상세보기
	public ReviewRegionDTO selectReviewDetail(int review_num) {
		return (ReviewRegionDTO)sqlSession.selectOne("selectReviewDetail", review_num);
	}
	//리뷰 상세보기 조회수 
	public int addReviewReadCount(int review_num) {
		return sqlSession.update("addReviewReadCount", review_num);
	}
	
	//지역과 리뷰 좋아요 수 증감
	public int addLikeCountRegion(int ccr_num) {
		int res = sqlSession.update("addLikeCountRegion", ccr_num);
		return res;
	}
	public int subLikeCountRegion(int ccr_num) {
		int res = sqlSession.update("subLikeCountRegion", ccr_num);
		return res;
	}
	public int addLikeCountReview(int review_num) {
		int res = sqlSession.update("addLikeCountReview", review_num);
		return res;
	}
	public int subLikeCountReview(int review_num) {
		int res = sqlSession.update("subLikeCountReview", review_num);
		return res;
	}
	/*지역  좋아요*/
	//지역 좋아요 수 가져오기
	public int recountRegionLike(int ccr_num) {
		int res = (int)sqlSession.selectOne("recountRegionLike", ccr_num);
		return res;
	}
	//지역 좋아요 내역 추가 , 삭제
	public int insertRegionLikeLog(String mem_id,int ccr_num) {
		Map<String,Object> map = new Hashtable<>();
		map.put("mem_id", mem_id);
		map.put("ccr_num",ccr_num);
		int ud = sqlSession.update("addLikeCountRegion", ccr_num);
		if(ud>0) sqlSession.insert("insertRegionLikeLog", map);
		int res =(int)sqlSession.selectOne("recountRegionLike", ccr_num);
		return res;
	}
	public int deleteRegionLikeLog(String mem_id,int ccr_num) {
		Map<String,Object> map = new Hashtable<>();
		map.put("mem_id", mem_id);
		map.put("ccr_num", ccr_num);
		//int res = sqlSession.delete("deleteRegionLikeLog", map);
		int ud = sqlSession.update("subLikeCountRegion", ccr_num);
		if(ud>0) sqlSession.delete("deleteRegionLikeLog", map);
		int res =(int)sqlSession.selectOne("recountRegionLike", ccr_num);
		return res;
	}
	//지역 좋아요 내역 체크
	public int checkRegionLikeLog(String mem_id,int ccr_num) {
		Map<String,Object> map = new Hashtable<>();
		map.put("mem_id", mem_id);
		map.put("ccr_num", ccr_num);
		int res = (int)sqlSession.selectOne("checkRegionLikeLog", map);
		if(res>0) System.out.println("해당 아이디의  해당 지역에 대해 추천한 기록이있습니다");
		else System.out.println("해당 아이디의 해당 지역에 대해 추천한 기록이 없습니다");
		return res;
	}
	
	/*리뷰  좋아요*/
	//리뷰 좋아요 수 가져오기
	public int recountReviewLike(int review_num) {
		int res = (int)sqlSession.selectOne("recountReviewLike", review_num);
		return res;
	}
	//리뷰 좋아요 내역 추가 , 삭제
	public int insertReviewLikeLog(String mem_id,int review_num) {
		Map<String,Object> map = new Hashtable<>();
		map.put("mem_id", mem_id);
		map.put("review_num",review_num);
		int ud = sqlSession.update("addLikeCountReview", review_num);
		if(ud>0) sqlSession.insert("insertReviewLikeLog", map);
		int res =(int)sqlSession.selectOne("recountReviewLike", review_num);
		return res;
	}
	public int deleteReviewLikeLog(String mem_id,int review_num) {
		Map<String,Object> map = new Hashtable<>();
		map.put("mem_id", mem_id);
		map.put("review_num", review_num);
		int ud = sqlSession.update("subLikeCountReview", review_num);
		if(ud>0) sqlSession.delete("deleteReviewLikeLog", map);
		int res =(int)sqlSession.selectOne("recountReviewLike", review_num);
		return res;
	}
	//리뷰 좋아요 내역 체크
	public int checkReviewLikeLog(String mem_id,int review_num) {
		Map<String,Object> map = new Hashtable<>();
		map.put("mem_id", mem_id);
		map.put("review_num", review_num);
		int res = (int)sqlSession.selectOne("checkReviewLikeLog", map);
		if(res>0) System.out.println("해당 아이디의  해당 리뷰에 대해 추천한 기록이있습니다");
		else System.out.println("해당 아이디의 해당 리뷰에 대해 추천한 기록이 없습니다");
		return res;
	}
	//리뷰수가져오기
	public int countReviewCcr(int ccr_num) {
		int count = (int)sqlSession.selectOne("countReviewCcr", ccr_num);
		return count;
	}
	
	
	//페이지의 전체 목록
	public List<CarCampingRegionDTO> listPopRegion(int region_num ,int startRow , int endRow){
		Map<String,Object> map = new Hashtable<>();
		map.put("region_num",region_num);
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		List<CarCampingRegionDTO>listPopRegion=sqlSession.selectList("listPopRegion",map);

		return listPopRegion;
	}


	
	   //페이지 카운트처리
	   public int listRegionCount(int region_num ) {
	      System.out.println("매퍼의 리즌넘:" + region_num);
	      int count =sqlSession.selectOne("listRegionCount",region_num);
	      return count;    
	   }
	   
	   //페이지 카운트처리
	   public int listRegionCountSearch(int region_num,String search,String searchString) {
	      Map<String,Object> map = new Hashtable<>();
	      map.put("region_num",region_num);
	      map.put("search",search);
	      map.put("searchString",searchString);
	      int count = sqlSession.selectOne("listRegionCountSearch", map);
	      return count;
	   }
	   
	   
	   public List<CarCampingRegionDTO> listAllCarCamping(int region_num, String orderBy, int startRow, int endRow){
	      Map<String,Object> map = new Hashtable<>();
	      map.put("region_num",region_num);
	      map.put("orderBy",orderBy); 
	      map.put("startRow",startRow);
	      map.put("endRow",endRow);
	      List<CarCampingRegionDTO> list = sqlSession.selectList("listAllCarCamping", map);
	      return list;
	   }
	   
	   public List<CarCampingRegionDTO> listAllCarCampingSearch(int region_num,String search,String searchString, String orderBy, int startRow, int endRow){
	      Map<String,Object> map = new Hashtable<>();
	      map.put("region_num",region_num);
	      map.put("search",search);
	      map.put("searchString",searchString);
	      map.put("orderBy",orderBy);
	      map.put("startRow",startRow);
	      map.put("endRow",endRow);
	      List<CarCampingRegionDTO> list = sqlSession.selectList("listAllCarCampingSearch", map);
	      return list;
	   }
	   
}
