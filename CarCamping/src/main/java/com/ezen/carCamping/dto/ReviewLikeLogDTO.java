package com.ezen.carCamping.dto;

public class ReviewLikeLogDTO {
	private int rll_num;
	private MemberDTO memberDTO;
	private ReviewRegionDTO ReviewRegionDTO;
	
	public int getRll_num() {
		return rll_num;
	}
	public void setRll_num(int rll_num) {
		this.rll_num = rll_num;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public ReviewRegionDTO getReviewRegionDTO() {
		return ReviewRegionDTO;
	}
	public void setReviewRegionDTO(ReviewRegionDTO ReviewRegionDTO) {
		this.ReviewRegionDTO = ReviewRegionDTO;
	}
	
}
