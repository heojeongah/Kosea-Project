package model;

public class Order {
	private String o_code;
	private String o_date;
	private String p_code;
	private String p_name;
	private String c_id;
	private Integer o_amount;
	private String o_state;
	private String ol_code;
	private Integer ol_total;
	private Integer p_size;
	
	public Integer getP_size() {
		return p_size;
	}
	public void setP_size(Integer p_size) {
		this.p_size = p_size;
	}
	public String getOl_code() {
		return ol_code;
	}
	public void setOl_code(String ol_code) {
		this.ol_code = ol_code;
	}
	public Integer getOl_total() {
		return ol_total;
	}
	public void setOl_total(Integer ol_total) {
		this.ol_total = ol_total;
	}
	public String getO_code() {
		return o_code;
	}
	public void setO_code(String o_code) {
		this.o_code = o_code;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public Integer getO_amount() {
		return o_amount;
	}
	public void setO_amount(Integer o_amount) {
		this.o_amount = o_amount;
	}
	public String getO_state() {
		return o_state;
	}
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	
}
