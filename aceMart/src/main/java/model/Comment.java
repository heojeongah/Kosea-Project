package model;

import org.hibernate.validator.constraints.NotEmpty;

public class Comment {
	
	@NotEmpty
	private String comment_id;
	private String c_image;
	private String p_name;
	@NotEmpty
	private String title;
	private Integer w_grade;
	private String w_date;
	@NotEmpty
	private String c_id;
	private String ol_code;
	private String content;


	public String getOl_code() {
		return ol_code;
	}
	public void setOl_code(String ol_code) {
		this.ol_code = ol_code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public Integer getW_grade() {
		return w_grade;
	}
	public void setW_grade(Integer w_grade) {
		this.w_grade = w_grade;
	}
}
