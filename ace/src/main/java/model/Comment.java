package model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Comment {
	@NotEmpty
	private String comment_id;
	@NotEmpty
	private String c_id;
	@NotEmpty
	private String ol_code;
	private String w_date;
	private Integer w_grade;
	@NotEmpty
	private String title;
	private String content;
	private String c_image;
	private MultipartFile image;
	private Integer num;
	private Integer sum;
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getOl_code() {
		return ol_code;
	}
	public void setOl_code(String ol_code) {
		this.ol_code = ol_code;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public Integer getW_grade() {
		return w_grade;
	}
	public void setW_grade(Integer w_grade) {
		this.w_grade = w_grade;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getC_image() {
		return c_image;
	}
	public void setC_image(String c_image) {
		this.c_image = c_image;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
	}
