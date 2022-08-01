package com.ezen.carCamping.dto;

public class LoginLogDTO {
	private int login_num;
	private int login_auto;
	private int login_success;
	private String login_userId;
	private String login_sysdate;
	private String login_ip;
	private int login_reason;
	
	public int getLogin_num() {
		return login_num;
	}
	public void setLogin_num(int login_num) {
		this.login_num = login_num;
	}
	public int getLogin_auto() {
		return login_auto;
	}
	public void setLogin_auto(int login_auto) {
		this.login_auto = login_auto;
	}
	public int getLogin_success() {
		return login_success;
	}
	public void setLogin_success(int login_success) {
		this.login_success = login_success;
	}
	public String getLogin_userId() {
		return login_userId;
	}
	public void setLogin_userId(String login_userId) {
		this.login_userId = login_userId;
	}
	public String getLogin_sysdate() {
		return login_sysdate;
	}
	public void setLogin_sysdate(String login_sysdate) {
		this.login_sysdate = login_sysdate;
	}
	public String getLogin_ip() {
		return login_ip;
	}
	public void setLogin_ip(String login_ip) {
		this.login_ip = login_ip;
	}
	public int getLogin_reason() {
		return login_reason;
	}
	public void setLogin_reason(int login_reason) {
		this.login_reason = login_reason;
	}
}
