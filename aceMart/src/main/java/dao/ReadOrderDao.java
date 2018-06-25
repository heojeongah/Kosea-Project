package dao;

import java.util.List;

import model.Condition;
import model.Order;
import model.OrderLine;
import model.SCondition;
import model.Sales;

public interface ReadOrderDao {
	List<Order> readOrder(Condition c);
	Integer getOrderCount();
	List<Order> findByDate(SCondition sc);
	List<Order> findNewOrder(SCondition sc);
	List<Order> findWaitingOrder(Condition c);
	Order getOrderDetail(String o_code);
	void updateOrder(String o_code);
	Integer countNewOrder(String o_date);
	Integer countWaitingPay();
	void updateSales(Sales sales);
	void insertSales(Sales sales);
	Sales readSales(Sales sales); 
	List<OrderLine> readOrderLine(String o_code);
}
