package model;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class Order {
	@NotEmpty
	private String o_code;
	private String ol_code;
	@NotNull
	private String p_code;
	private Integer p_size;
	@NotNull
	private String c_id;
	@NotNull
	private Integer o_amount;
	private Integer o_total;
	private String o_state;
	private String o_pay;
	private String o_date;
	private String d_state;
	private String p_name;
	@NotNull
	private String d_name;
	@NotNull
	private String d_addr;
	@NotNull
	private String d_phone;
	private String p_image1;
	private Integer p_price;
	
	public String getOl_code() {
		return ol_code;
	}
	public void setOl_code(String ol_code) {
		this.ol_code = ol_code;
	}
	public Integer getP_price() {
		return p_price;
	}
	public void setP_price(Integer p_price) {
		this.p_price = p_price;
	}
	public String getP_image1() {
		return p_image1;
	}
	public void setP_image1(String p_image1) {
		this.p_image1 = p_image1;
	}
	public String getD_addr() {
		return d_addr;
	}
	public void setD_addr(String d_addr) {
		this.d_addr = d_addr;
	}
	public String getD_phone() {
		return d_phone;
	}
	public void setD_phone(String d_phone) {
		this.d_phone = d_phone;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getD_state() {
		return d_state;
	}
	public void setD_state(String d_state) {
		this.d_state = d_state;
	}
	public String getO_code() {
		return o_code;
	}
	public void setO_code(String o_code) {
		this.o_code = o_code;
	}
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
	public Integer getO_total() {
		return o_total;
	}
	public void setO_total(Integer o_total) {
		this.o_total = o_total;
	}
	public String getO_state() {
		return o_state;
	}
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	public String getO_pay() {
		return o_pay;
	}
	public void setO_pay(String o_pay) {
		this.o_pay = o_pay;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
}
