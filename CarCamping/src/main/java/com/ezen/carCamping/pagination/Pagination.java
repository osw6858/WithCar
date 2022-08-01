package com.ezen.carCamping.pagination;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ezen.carCamping.dto.CarCampingRegionDTO;

@SuppressWarnings("rawtypes")
public class Pagination {

	//페이지당 게시글 수
	private int postPerPage = 9;
	
	public void setPostPerPage(int postPerPage) {
		this.postPerPage = postPerPage;
	}


	//Singleton instance생성
	private static Pagination instance = new Pagination();
	
	private Pagination() {}
	
	public static Pagination getInstance() {
		return instance;
	}
	


   
//////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////메소드 영역////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////	
	
	
	//총 페이지 수 계산
	public int pageCount(List list) {
		int pageCount = 0; 
		if (list.size()%postPerPage==0) {
			pageCount = list.size()/postPerPage;
		}else {
			pageCount = list.size()/postPerPage + 1;
		}
		return pageCount;
	}
	
	@SuppressWarnings("unchecked")
	public List getPagePost(int page,List list){
		
		//총 페이지 수 계산
		int pageCount = pageCount(list);
		
		//페이지당 게시물을  담을 HashMap 
		//Key : 페이지 번호 / Value : 페이지 번호에 해당되는 게시물리스트
		HashMap<Integer,List> map = new HashMap<>();
		
		int i = 1; //페이지 번호
		int j = 1; //개시글 카운트
		
		//게시물 리스트의 배열
		List[] listArray = new List[pageCount]; 
		for (int k=0; k<listArray.length; k++) {
			listArray[k] = new ArrayList();
		}
		
		for (Object obj : list) {
			listArray[i-1].add(obj);
			
			if(j%postPerPage==0 || j==list.size()) {
				map.put(i, listArray[i-1]);
				i++;
			}
			j++;
		}
	
		return map.get(page);
	}

}

