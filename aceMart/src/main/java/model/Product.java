package model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Product {
	@NotEmpty
	private String p_code;
	@NotNull
	@Min(0)
	private Integer p_size;
	@NotEmpty
	private String p_name;
	@NotNull
	@Min(0)
	private Integer p_price;
	private Integer p_stack;
	private String p_grade;
	private String p_type;
	private String p_intro;
	private String p_brand;
	private String p_image1;
	private String p_image2;
	private String p_image3;
	
	private MultipartFile[] image;
	
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public Integer getP_size() {
		return p_size;
	}
	public void setP_size(Integer p_size) {
		this.p_size = p_size;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public Integer getP_price() {
		return p_price;
	}
	public void setP_price(Integer p_price) {
		this.p_price = p_price;
	}
	public Integer getP_stack() {
		return p_stack;
	}
	public void setP_stack(Integer p_stack) {
		this.p_stack = p_stack;
	}
	public String getP_grade() {
		return p_grade;
	}
	public void setP_grade(String p_grade) {
		this.p_grade = p_grade;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_intro() {
		return p_intro;
	}
	public void setP_intro(String p_intro) {
		this.p_intro = p_intro;
	}
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	public String getP_image1() {
		return p_image1;
	}
	public void setP_image1(String p_image1) {
		this.p_image1 = p_image1;
	}
	public String getP_image2() {
		return p_image2;
	}
	public void setP_image2(String p_image2) {
		this.p_image2 = p_image2;
	}
	public String getP_image3() {
		return p_image3;
	}
	public void setP_image3(String p_image3) {
		this.p_image3 = p_image3;
	}
	public MultipartFile[] getImage() {
		return image;
	}
	public void setImage(MultipartFile[] image) {
		this.image = image;
	}

}
