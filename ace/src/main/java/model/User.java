package model;

import org.hibernate.validator.constraints.NotEmpty;

public class User{
	@NotEmpty
	private String c_id;
	@NotEmpty
	private String c_pwd;
	private String c_name;
	private String c_phone;
	private String c_addr;
	private String c_email;
	private String c_grade;
	private String c_accum;
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_pwd() {
		return c_pwd;
	}
	public void setC_pwd(String c_pwd) {
		this.c_pwd = c_pwd;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_addr() {
		return c_addr;
	}
	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}
	public String getC_email() {
		return c_email;
	}
	public void setC_email(String c_email) {
		this.c_email = c_email;
	}
	public String getC_grade() {
		return c_grade;
	}
	public void setC_grade(String c_grade) {
		this.c_grade = c_grade;
	}
	public String getC_accum() {
		return c_accum;
	}
	public void setC_accum(String c_accum) {
		this.c_accum = c_accum;
	}
}