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
import com.ezen.carCamping.dto.LoginLogDTO;
import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ProductCategoryDTO;
import com.ezen.carCamping.dto.ProductDTO;
import com.ezen.carCamping.dto.QuestionDTO;
import com.ezen.carCamping.dto.RegionDTO;
import com.ezen.carCamping.dto.RentalLogDTO;
import com.ezen.carCamping.dto.ReviewProductDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

@Service
public class LoginLogMapper {

	@Autowired
	private SqlSession sqlSession;

	public int insertLoginLogSuccess(LoginLogDTO dto) {
		int res = sqlSession.insert("insertLoginLogSuccess",dto);
		return res;
	}
	
	public int insertLoginLogFail(LoginLogDTO dto) {
		int res = sqlSession.insert("insertLoginLogFail",dto);
		return res;
	}
	
	public String latestLoginSuccessDate(String login_userId) {
		String date = (String)sqlSession.selectOne("latestLoginSuccessDate", login_userId);
		return date;
	}
	
	public int countLoginReason_0(String login_userId,String latestLoginSuccessDate) {
		Map<String,Object> map = new HashMap<>();
		map.put("login_userId",login_userId);
		map.put("latestLoginSuccessDate", latestLoginSuccessDate);
		int count = (int)sqlSession.selectOne("countLoginReason_0", map);
		return count;
	}
	
	public int countLoginReason_0_now(String login_userId) {
		int count = (int)sqlSession.selectOne("countLoginReason_0_now", login_userId);
		return count;
		
	}

	public int DeniedMember(String login_userId) {
		int res = sqlSession.update("DeniedMember", login_userId);
		return res;
	}
} 
