package com.ezen.carCamping.dto;

public class ReviewProductLikeLogDTO {
	private int rpll_num;
	private MemberDTO memberDTO;
	private ReviewProductDTO reviewProductDTO;
	
	public int getRpll_num() {
		return rpll_num;
	}
	public void setRpll_num(int rpll_num) {
		this.rpll_num = rpll_num;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public ReviewProductDTO getReviewProductDTO() {
		return reviewProductDTO;
	}
	public void setReviewProductDTO(ReviewProductDTO reviewProductDTO) {
		this.reviewProductDTO = reviewProductDTO;
	}
	
}
