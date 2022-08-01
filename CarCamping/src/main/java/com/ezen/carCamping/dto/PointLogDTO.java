package com.ezen.carCamping.dto;

public class PointLogDTO {
	private int point_num;
	private MemberDTO memberDTO;
	private String point_sysdate;
	private int point_reason;
	private int point_saving;
	
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public String getPoint_sysdate() {
		return point_sysdate;
	}
	public void setPoint_sysdate(String point_sysdate) {
		this.point_sysdate = point_sysdate;
	}
	public int getPoint_reason() {
		return point_reason;
	}
	public void setPoint_reason(int point_reason) {
		this.point_reason = point_reason;
	}
	public int getPoint_saving() {
		return point_saving;
	}
	public void setPoint_saving(int point_saving) {
		this.point_saving = point_saving;
	}
	
	
}
