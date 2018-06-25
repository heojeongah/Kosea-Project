package dao;

import java.util.List;

import model.CheckOut;
import model.Condition;
import model.Order;
import model.OrderLine;
import model.Sales;


public interface OrderDao {
	List<Order> readOrder(Condition c);
	Integer getOrderCount();
	List<Order> getOrderDetail(String o_code);
	Integer getMaxOcode(); 
	Integer getMaxOLcode(); 
	Integer getMaxDNumber();
	Sales getSales(Sales sales);
	Integer getOrderLineCount(String o_code);
	void deleteOrderLine(String ol_code);
	void deleteDeliveryInfo(String o_code);
	void deleteOrderInfo(String o_code);
	void updateSales(Sales sales);
	void addSales(Sales sales);
	void emptyCart(String c_id);
	void addOrderInfo(CheckOut c);
	void addDeliveryInfo(CheckOut c);
	void addOrderLine(OrderLine ol);
	
}
