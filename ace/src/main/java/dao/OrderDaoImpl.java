package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CheckOut;
import model.Condition;
import model.Order;
import model.OrderLine;
import model.Sales;
@Repository
public class OrderDaoImpl implements OrderDao {
	@Autowired
	private SqlSession session;
	
	public List<Order> readOrder(Condition c) {
		return session.selectList("home.getOrderList",c);
	}

	public Integer getOrderCount() {
		return session.selectOne("home.getOrderCount");
	}

	public List<Order> getOrderDetail(String o_code) {
		return session.selectList(
				"home.getOrderDetail",o_code);
	}
	public Integer getMaxOcode() {
		return session.selectOne("order.getMaxOcode");
	}

	public Integer getMaxOLcode() {
		return session.selectOne("order.getMaxOLcode");
	}

	public Integer getMaxDNumber() {
		return session.selectOne("order.getMaxDNumber");
	}

	public void addOrderInfo(CheckOut c) {
		session.insert("order.addOrderInfo",c);
	}

	public void addDeliveryInfo(CheckOut c) {
		session.insert("order.addDeliveryInfo",c);
	}

	public void addOrderLine(OrderLine ol) {
		session.insert("order.addOrderLine",ol);
	}

	public void emptyCart(String c_id) {
		session.delete("order.emptyCart",c_id);
	}

	public void addSales(Sales sales) {
		session.insert("order.addSalesInfo",sales);		
	}

	public Sales getSales(Sales sales) {
		return session.selectOne("order.getSalesInfo", sales);
	}

	public void updateSales(Sales sales) {
		session.update("order.updateSalesInfo",sales);		
	}

	public void deleteOrderLine(String ol_code) {
		session.delete("order.deleteOrderLine",ol_code);				
	}

	public void deleteDeliveryInfo(String o_code) {
		session.delete("order.deleteDeliveryInfo",o_code);		
	}

	public void deleteOrderInfo(String o_code) {
		session.delete("order.deleteOrderInfo",o_code);		
	}

	public Integer getOrderLineCount(String o_code) {
		return session.selectOne("order.getOrderLineCount", o_code);
	}
}
