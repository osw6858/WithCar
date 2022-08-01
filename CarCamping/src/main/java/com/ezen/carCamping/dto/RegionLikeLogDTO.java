package com.ezen.carCamping.dto;

public class RegionLikeLogDTO {
	private int regionLike_num;
	private MemberDTO memberDTO;
	private RegionDTO regionDTO;
	
	public int getRegionLike_num() {
		return regionLike_num;
	}
	public void setRegionLike_num(int regionLike_num) {
		this.regionLike_num = regionLike_num;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public RegionDTO getRegionDTO() {
		return regionDTO;
	}
	public void setRegionDTO(RegionDTO regionDTO) {
		this.regionDTO = regionDTO;
	}
	
	
}
