package com.ezen.carCamping.dto;

public class AgencyDTO {
	private int agency_num;
	private RegionDTO regionDTO;
	private String agency_location;
	private String agency_name;
	private String agency_phone;
	
	public int getAgency_num() {
		return agency_num;
	}
	public void setAgency_num(int agency_num) {
		this.agency_num = agency_num;
	}
	public RegionDTO getRegionDTO() {
		return regionDTO;
	}
	public void setRegionDTO(RegionDTO regionDTO) {
		this.regionDTO = regionDTO;
	}
	public String getAgency_location() {
		return agency_location;
	}
	public void setAgency_location(String agency_location) {
		this.agency_location = agency_location;
	}
	public String getAgency_name() {
		return agency_name;
	}
	public void setAgency_name(String agency_name) {
		this.agency_name = agency_name;
	}
	public String getAgency_phone() {
		return agency_phone;
	}
	public void setAgency_phone(String agency_phone) {
		this.agency_phone = agency_phone;
	}
}
