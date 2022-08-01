package com.ezen.carCamping.dto;

public class ProductDTO {
	private int prod_num;
	private ProductCategoryDTO productCategoryDTO;
	private BrandCategoryDTO brandCategoryDTO;
	private String brand_name;
	private String prod_name;
	private int prod_popular;
	private int prod_price;
	private String prod_viewImage1;
	private String prod_viewImage2;
	private String prod_viewImage3;
	private String prod_viewImage4;
	private String prod_viewImage5;
	private String prod_summary;
	private String prod_viewContent;
	private String prod_sysdate;
	private String prod_update;
	private float prod_reviewScore;
	private int prod_reviewCount;
	
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public int getProd_num() {
		return prod_num;
	}
	public void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	public ProductCategoryDTO getProductCategoryDTO() {
		return productCategoryDTO;
	}
	public void setProductCategoryDTO(ProductCategoryDTO productCategoryDTO) {
		this.productCategoryDTO = productCategoryDTO;
	}
	public BrandCategoryDTO getBrandCategoryDTO() {
		return brandCategoryDTO;
	}
	public void setBrandCategoryDTO(BrandCategoryDTO brandCategoryDTO) {
		this.brandCategoryDTO = brandCategoryDTO;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_popular() {
		return prod_popular;
	}
	public void setProd_popular(int prod_popular) {
		this.prod_popular = prod_popular;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	
	public String getProd_viewImage1() {
		return prod_viewImage1;
	}
	public void setProd_viewImage1(String prod_viewImage1) {
		this.prod_viewImage1 = prod_viewImage1;
	}
	public String getProd_viewImage2() {
		return prod_viewImage2;
	}
	public void setProd_viewImage2(String prod_viewImage2) {
		this.prod_viewImage2 = prod_viewImage2;
	}
	public String getProd_viewImage3() {
		return prod_viewImage3;
	}
	public void setProd_viewImage3(String prod_viewImage3) {
		this.prod_viewImage3 = prod_viewImage3;
	}
	public String getProd_viewImage4() {
		return prod_viewImage4;
	}
	public void setProd_viewImage4(String prod_viewImage4) {
		this.prod_viewImage4 = prod_viewImage4;
	}
	public String getProd_viewImage5() {
		return prod_viewImage5;
	}
	public void setProd_viewImage5(String prod_viewImage5) {
		this.prod_viewImage5 = prod_viewImage5;
	}
	public String getProd_summary() {
		return prod_summary;
	}
	public void setProd_summary(String prod_summary) {
		this.prod_summary = prod_summary;
	}
	public String getProd_viewContent() {
		return prod_viewContent;
	}
	public void setProd_viewContent(String prod_viewContent) {
		this.prod_viewContent = prod_viewContent;
	}
	public String getProd_sysdate() {
		return prod_sysdate;
	}
	public void setProd_sysdate(String prod_sysdate) {
		this.prod_sysdate = prod_sysdate;
	}
	public String getProd_update() {
		return prod_update;
	}
	public void setProd_update(String prod_update) {
		this.prod_update = prod_update;
	}
	public float getProd_reviewScore() {
		return prod_reviewScore;
	}
	public void setProd_reviewScore(float prod_reviewScore) {
		this.prod_reviewScore = prod_reviewScore;
	}
	public int getProd_reviewCount() {
		return prod_reviewCount;
	}
	public void setProd_reviewCount(int prod_reviewCount) {
		this.prod_reviewCount = prod_reviewCount;
	}
}
