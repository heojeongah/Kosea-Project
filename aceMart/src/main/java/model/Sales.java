package model;


public class Sales {
	private String s_date;
	private String p_code;
	private String p_name;
	private Integer s_amount;
	private Integer s_total;
	private Integer p_size;
	

	public Integer getP_size() {
		return p_size;
	}
	public void setP_size(Integer p_size) {
		this.p_size = p_size;
	}
	public String getS_date() {
		return s_date;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public Integer getS_amount() {
		return s_amount;
	}
	public void setS_amount(Integer s_amount) {
		this.s_amount = s_amount;
	}
	public Integer getS_total() {
		return s_total;
	}
	public void setS_total(Integer s_total) {
		this.s_total = s_total;
	}
	
}
