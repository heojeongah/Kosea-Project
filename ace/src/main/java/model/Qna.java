package model;

import org.hibernate.validator.constraints.NotEmpty;

public class Qna {
	private Integer qna_id;
	private String c_id;
	private Integer group_id;
	private Integer parent_id;
	private String w_date;
	private Integer order_no;
	@NotEmpty
	private String title;
	private String content;
	private String w_state;
	
	public Integer getQna_id() {
		return qna_id;
	}
	public void setQna_id(Integer qna_id) {
		this.qna_id = qna_id;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public Integer getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public Integer getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Integer order_no) {
		this.order_no = order_no;
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
	public String getW_state() {
		return w_state;
	}
	public void setW_state(String w_state) {
		this.w_state = w_state;
	}
}