package com.ezen.carCamping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

@Service
public class AdminMapper {

	@Autowired
	private SqlSession sqlSession;
	
	
	
//////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////차박장소/////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public List<RegionDTO> adminListRegion(){
		List<RegionDTO> list = sqlSession.selectList("adminListRegion");
		return list;
	}
	
	public int adminInsertRegion(CarCampingRegionDTO dto) {
		int res = sqlSession.insert("adminInsertRegion", dto);
		return res;
	}
	
	public List<CarCampingRegionDTO> adminListCarCampingRegion(){
		List<CarCampingRegionDTO> adminListCarCampingRegion = sqlSession.selectList("adminListCarCampingRegion");
		
		return adminListCarCampingRegion;
	}
	
	public List<CarCampingRegionDTO> adminListCarCampingRegionSelectRegion(int region_num){
		List<CarCampingRegionDTO> adminListCarCampingRegion = sqlSession.selectList("adminListCarCampingRegionSelectRegion",region_num);
		
		return adminListCarCampingRegion;
	}
	
	public CarCampingRegionDTO getCarCampingRegion(int ccr_num) {
		CarCampingRegionDTO dto = sqlSession.selectOne("adminGetCarCampingRegion", ccr_num);
		return dto;
	}
	
	public int adminUpdateRegion(CarCampingRegionDTO dto) {
		int res = sqlSession.update("adminUpdateRegion", dto);
		return res;
	}
	
	public int adminDeleteRegion(int ccr_num) {
		int res = sqlSession.delete("adminDeleteRegion",ccr_num);
		return res;
	}
	
	
	
//////////////////////////////////////////////////////////////////////////////////////////	
///////////////////////////////대리점/////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public List<AgencyDTO> adminListAgency(){
		List<AgencyDTO> adminListAgency = sqlSession.selectList("adminListAgency");
		return adminListAgency;
	}
	
	public List<AgencyDTO> adminListAgencySort(int region_num){
		List<AgencyDTO> adminListAgency = sqlSession.selectList("adminListAgencySort",region_num);
		return adminListAgency;
	}
	
	public int adminInsertAgency(AgencyDTO dto) {
		int res = sqlSession.insert("adminInsertAgency", dto);
		return res;
	}
	
	public AgencyDTO adminGetAgency(int agency_num) {
		AgencyDTO dto = sqlSession.selectOne("adminGetAgency", agency_num);
		return dto;
	}
	
	public int adminUpdateAgency(AgencyDTO dto) {
		int res = sqlSession.update("adminUpdateAgency", dto);
		return res;
	}
	
	public int adminDeleteAgency(int agency_num) {
		int res = sqlSession.delete("adminDeleteAgency", agency_num);
		return res;
	}
	
	
	
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////카테고리///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public List<BrandCategoryDTO> adminListBrand(){
		List<BrandCategoryDTO> adminListBrand = sqlSession.selectList("adminListBrand");
		return adminListBrand;
	}
	
	public List<ProductCategoryDTO> adminListProductCategoty(){
		List<ProductCategoryDTO> adminListProductCategory = sqlSession.selectList("adminListProductCategory");
		return adminListProductCategory;
	}
	
	public int adminInsertCategory(HashMap<String,String> map) {
		int res = 0;
		String name = map.get("name");
		if (map.get("category").equals("brand")) {
			res = sqlSession.insert("adminInsertBrand",name);
		}
		else {
			res = sqlSession.insert("adminInsertProductCategory",name);
		}
		return res;
	}
	
	public int adminDeleteBrand(int brand_num) {
		int res = sqlSession.delete("adminDeleteBrand", brand_num);
		return res;
	}
	
	public int adminDeleteProductCategory(int pc_num) {
		int res = sqlSession.delete("adminDeleteProductCategory", pc_num);
		return res;
	}
	
	
	
	
////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////차박용품/////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public List<ProductDTO> adminListProduct(){
		List<ProductDTO> adminListProduct = sqlSession.selectList("adminListProduct");
		return adminListProduct;
	}
	
	public List<ProductDTO> adminFindProduct(String search){
		search = "%"+search+"%";
		List<ProductDTO> adminFindProduct = sqlSession.selectList("adminFindProduct", search);
		return adminFindProduct;
	}
	
	public ProductDTO adminGetProduct(int prod_num) {
		ProductDTO dto = sqlSession.selectOne("adminGetProduct",prod_num);
		return dto;
	}
	
	
	public int adminInsertProduct(ProductDTO dto) {
		int res = sqlSession.insert("adminInsertProduct", dto);
		return res;
	}
	
	public int adminUpdateProduct(ProductDTO dto) {
		int res = sqlSession.update("adminUpdateProduct", dto);
		return res;
	}
	
	public int adminDeleteProduct(int prod_num) {
		int res = sqlSession.delete("adminDeleteProduct", prod_num);
		return res;
	}
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////회원//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public List<MemberDTO> adminListMember(){
		List<MemberDTO> list = sqlSession.selectList("adminListMember");
		return list;
	}
	
	public List<MemberDTO> adminListMemberSort(Map<String,String> map){
		List<MemberDTO> list = sqlSession.selectList("adminListMemberSort",map);
		return list;
	}
	
	public List<MemberDTO> adminListMemberSearch(Map<String,String> map){
		List<MemberDTO> list = sqlSession.selectList("adminListMemberSearch", map);
		return list;
	}
	
	public List<MemberDTO> adminListMemberSearchAndSort(Map<String,String> map){
		List<MemberDTO> list = sqlSession.selectList("adminListMemberSearchAndSort", map);
		return list;
	}
	
	public MemberDTO adminGetMember(int mem_num) {
		MemberDTO dto = sqlSession.selectOne("adminGetMember",mem_num);
		return dto;
	}
	
	public int adminDenyMember(Map<String,String> map) {
		int res = sqlSession.update("adminDenyMember", map);
		return res;
	}

	public List<PointLogDTO> adminListPointLog(int mem_num) {
       List<PointLogDTO> list = sqlSession.selectList("adminListPointLog", mem_num);
       return list;
	}
	
	
///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////장소 리뷰//////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public List<ReviewRegionDTO> adminListReviewRegion(){
		List<ReviewRegionDTO> list = sqlSession.selectList("adminListReviewRegion");
		return list;
	}
	
	public List<ReviewRegionDTO> adminListReviewRegionSort(Map<String,String> map){
		List<ReviewRegionDTO> list = sqlSession.selectList("adminListReviewRegionSort",map);
		return list;
	}
	
	public List<ReviewRegionDTO> adminListReviewRegionSearch(Map<String,String> map){
		List<ReviewRegionDTO> list = sqlSession.selectList("adminListReviewRegionSearch",map);
		return list;
	}
	
	public List<ReviewRegionDTO> adminListReviewRegionSearchAndSort(Map<String,String> map){
		List<ReviewRegionDTO> list = sqlSession.selectList("adminListReviewRegionSearchAndSort",map);
		return list;
	}
	
	public ReviewRegionDTO adminGetReviewRegion(int review_num) {
		ReviewRegionDTO dto = sqlSession.selectOne("adminGetReviewRegion", review_num);
		return dto;
	}
	
	public int adminUpdateReviewRegion(Map<String,String> map) {
		int res = sqlSession.update("adminUpdateReviewRegion", map);
		return res;
	}
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////용품 리뷰//////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
	
	
	

	public List<ReviewProductDTO> adminListReviewProduct(){
		List<ReviewProductDTO> list = sqlSession.selectList("adminListReviewProduct");
		return list;
	}

	public List<ReviewProductDTO> adminListReviewProductSort(Map<String,String> map){
		List<ReviewProductDTO> list = sqlSession.selectList("adminListReviewProductSort",map);
		return list;
	}

	public List<ReviewProductDTO> adminListReviewProductSearch(Map<String,String> map){
		List<ReviewProductDTO> list = sqlSession.selectList("adminListReviewProductSearch",map);
		return list;
	}
	
	public List<ReviewProductDTO> adminListReviewProductSearchAndSort(Map<String,String> map){
		List<ReviewProductDTO> list = sqlSession.selectList("adminListReviewProductSearchAndSort",map);
		return list;
	}

	public ReviewProductDTO adminGetReviewProduct(int rp_num) {
		ReviewProductDTO dto = sqlSession.selectOne("adminGetReviewProduct", rp_num);
		return dto;
	}

	public int adminUpdateReviewProduct(Map<String,String> map) {
		int res = sqlSession.update("adminUpdateReviewProduct", map);
		return res;
	}
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////공지사항//////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	public List<AdminAnnounceDTO> adminListAnnounce(){
		List<AdminAnnounceDTO> list = sqlSession.selectList("adminListAnnounce");
		return list;
	}
	
	public List<AdminAnnounceDTO> adminListAnnounceSort(Map<String,String> map){
		List<AdminAnnounceDTO> list = sqlSession.selectList("adminListAnnounceSort",map);
		return list;
	}
	
	public AdminAnnounceDTO adminGetAnnounce(int aa_num) {
		AdminAnnounceDTO dto = sqlSession.selectOne("adminGetAnnounce", aa_num);
		return dto;
	}
	
	public int adminInsertAnnounce(AdminAnnounceDTO dto) {
		int res = sqlSession.insert("adminInsertAnnounce", dto);
		return res;
	}
	
	public int adminUpdateAnnounce(AdminAnnounceDTO dto) {
		int res = sqlSession.update("adminUpdateAnnounce", dto);
		return res;
	}
	
	public int adminDeleteAnnounce(int aa_num) {
		int res = sqlSession.delete("adminDeleteAnnounce", aa_num);
		return res;
	}
	

	
	
///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////문의사항//////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

	
	
	public List<QuestionDTO> adminListQuestion(){
		List<QuestionDTO> list = sqlSession.selectList("adminListQuestion");
		return list;
	}
	
	public List<QuestionDTO> adminListQuestionSys(Map<String,String> map){
		List<QuestionDTO> list = sqlSession.selectList("adminListQuestionSys",map);
		return list;
	}
	
	public List<QuestionDTO> adminListQuestionRep(Map<String,String> map){
		List<QuestionDTO> list = sqlSession.selectList("adminListQuestionRep",map);
		return list;
	}
	
	public QuestionDTO adminGetQuestion(int question_num) {
		QuestionDTO dto = sqlSession.selectOne("adminGetQuestion", question_num);
		return dto;
	}
	
	public int adminUpdateQuestion(QuestionDTO dto) {
		int res = sqlSession.update("adminViewQuestion", dto);
		return res;
	}
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////대여 내역//////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

	
	
	
	public List<RentalLogDTO> adminListRentalLog() {
		List<RentalLogDTO> list = sqlSession.selectList("adminListRentalLog");
		return list;
	}
	
	public List<RentalLogDTO> adminListRentalLogSort(Map<String,String> map) {
		List<RentalLogDTO> list = sqlSession.selectList("adminListRentalLogSort",map);
		return list;
	}
	
	public List<RentalLogDTO> adminListRentalLogSearch(Map<String,String> map) {
		List<RentalLogDTO> list = sqlSession.selectList("adminListRentalLogSearch",map);
		return list;
	}
	
	public List<RentalLogDTO> adminListRentalLogSearchAndSort(Map<String,String> map) {
		List<RentalLogDTO> list = sqlSession.selectList("adminListRentalLogSearchAndSort",map);
		return list;
	}
	
	public RentalLogDTO adminGetRentalLog(int rental_num) {
		RentalLogDTO dto = sqlSession.selectOne("adminGetRentalLog", rental_num);
		return dto;
	}
	
	public int adminUpdateRentalLog(Map<String,String> map) {
		int res = sqlSession.update("adminUpdateRentalLog", map);
		return res;
	}
}
