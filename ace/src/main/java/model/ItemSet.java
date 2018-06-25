package model;

public class ItemSet {
	private Product item;
	private Integer quantity;

	public  ItemSet (Product item,Integer quantity) {
		this.item=item;
		this.quantity=quantity;
	}
	public void addQuantity(Integer add) {
		int exit=getQuantity();//현재 갯수
		setQuantity(exit+add);//현재갯수+추가갯수
	}
	public Product getProduct() {
		return item;
	}
	public void setProduct(Product item) {
		this.item = item;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
}
