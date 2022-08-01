package com.ezen.carCamping.dto;

public class ProductCartDTO {
	private int cart_num;
	private MemberDTO memberDTO;
	private ProductDTO productDTO;
	private AgencyDTO agencyDTO;
	private int cart_prodCount;
	private String cart_from;
	private String cart_to;

	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}

	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}

	public ProductDTO getProductDTO() {
		return productDTO;
	}

	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}

	public AgencyDTO getAgencyDTO() {
		return agencyDTO;
	}

	public void setAgencyDTO(AgencyDTO agencyDTO) {
		this.agencyDTO = agencyDTO;
	}

	public int getCart_prodCount() {
		return cart_prodCount;
	}

	public void setCart_prodCount(int cart_prodCount) {
		this.cart_prodCount = cart_prodCount;
	}

	public String getCart_from() {
		return cart_from;
	}

	public void setCart_from(String cart_from) {
		this.cart_from = cart_from;
	}

	public String getCart_to() {
		return cart_to;
	}

	public void setCart_to(String cart_to) {
		this.cart_to = cart_to;
	}

}
