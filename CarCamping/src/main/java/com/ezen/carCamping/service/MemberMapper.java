package com.ezen.carCamping.service;


import java.util.Hashtable;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.carCamping.dto.MemberDTO;
import com.ezen.carCamping.dto.ReviewRegionDTO;

@Service
public class MemberMapper {
   @Autowired
   private SqlSession sqlSession;
   
   public boolean checkMember(Map<String, String> params) {
         MemberDTO dto = sqlSession.selectOne("checkMember", params);
         if(dto == null) return false;
         else return true;
   }

   public String searchMemberID(Map<String, String> params) {
      String sql = null;
      sql = "select * from Member where mem_userName='"+params.get("mem_userName") 
               + "' and mem_email='"+params.get("mem_email")+"'";
            params.put("sql", sql);
            MemberDTO dto = sqlSession.selectOne("searchMemberID", params);
            if (dto == null) return "입력된 값과 일치하는 데이터가 없습니다.";
			return "아이디는 " + dto.getMem_id() +" 입니다.";
   }
   
   public String searchMemberPW(Map<String, String> params) {
      String sql = null;
      sql = "select * from Member where mem_userName='"+params.get("mem_userName") 
      + "' and mem_email='"+params.get("mem_email") + "'";
         params.put("sql", sql);
      MemberDTO dto = sqlSession.selectOne("searchMemberPW", params);
      if (dto == null) return "입력된 값과 일치하는 회원이 없습니다.";
      return "비밀번호는."+dto.getMem_password()+"입니다.";
}
   
   public MemberDTO getMemberId(String mem_id) {
         MemberDTO dto = sqlSession.selectOne("getMemberId", mem_id);
         return dto;
   }

   public int insertMember(MemberDTO dto) {
	      int res = sqlSession.insert("insertMember", dto);
	      return res;
	   }
   public MemberDTO getMemberNick(String mem_nickName) {
       MemberDTO dto = sqlSession.selectOne("getMemberNick", mem_nickName);
       return dto;
   }
   public MemberDTO getMemberEmail(String mem_email) {
       MemberDTO dto = sqlSession.selectOne("getMemberEmail", mem_email);
       return dto;
   }
   public int updateMember(MemberDTO dto) {
		int res = sqlSession.update("updateMember", dto);
		return res;
	}
   public MemberDTO getMember(int mem_num){
		MemberDTO dto = sqlSession.selectOne("getMember", mem_num);
		return dto;
	}

   public String getMemberPassword(int mem_num) {
	   return sqlSession.selectOne("getMemberPassword", mem_num);
	   
	   
   }
   
   public int deleteMember(int mem_num, String mem_password) {
	   Map<String, Object> map = new Hashtable<String, Object>();
		map.put("mem_num", mem_num);
		map.put("mem_password", mem_password);
		System.out.println(mem_password);
		return sqlSession.delete("deleteMember", map);
		
	}
   //박혜성 : 임시비밀번호
   public MemberDTO getMemberByIdNEmail(String mem_id,String mem_email) {
	   Map<String, Object> map = new Hashtable<String, Object>();
	   map.put("mem_id", mem_id);
	   map.put("mem_email", mem_email);
	   return (MemberDTO) sqlSession.selectOne("getMemberByIdNEmail", map); 
	}
   
   public int updatePassword(int mem_num,String mem_password) {
	   Map<String, Object> map = new Hashtable<String, Object>();
	   map.put("mem_num", mem_num);
	   map.put("mem_password", mem_password);
	   return sqlSession.update("updatePassword", map); 
   }
}
   
   


