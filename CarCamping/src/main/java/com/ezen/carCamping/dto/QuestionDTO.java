package com.ezen.carCamping.dto;

public class QuestionDTO {
	private int question_num;
	private MemberDTO memberDTO;
	private String question_title;
	private String question_content;
	private String question_sysdate;
	private String question_reply;
	private String question_replySysdate;
	
	public int getQuestion_num() {
		return question_num;
	}
	public void setQuestion_num(int question_num) {
		this.question_num = question_num;
	}
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public String getQuestion_sysdate() {
		return question_sysdate;
	}
	public void setQuestion_sysdate(String question_sysdate) {
		this.question_sysdate = question_sysdate;
	}
	public String getQuestion_reply() {
		return question_reply;
	}
	public void setQuestion_reply(String question_reply) {
		this.question_reply = question_reply;
	}
	public String getQuestion_replySysdate() {
		return question_replySysdate;
	}
	public void setQuestion_replySysdate(String question_replySysdate) {
		this.question_replySysdate = question_replySysdate;
	}
	
}
