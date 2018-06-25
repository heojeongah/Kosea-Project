package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Order;
import model.OrderLine;
import model.SCondition;
import model.Sales;
@Repository
public class ReadOrderDaoImpl implements ReadOrderDao {


	@Autowired
	private SqlSession session;
	


	public List<OrderLine> readOrderLine(String o_code) {
		return session.selectList("order.getOrderLine",o_code);
	}
	public Sales readSales(Sales sales) {
		return session.selectOne("order.getSalesInfo",sales);
	}

	public void updateSales(Sales sales) {
		session.update("order.updateSales",sales);
	}

	public void insertSales(Sales sales) {
		session.insert("order.insertSales",sales);
	}

	public Integer countWaitingPay() {
		return session.selectOne("order.countWaitngPay");
	}

	public Integer countNewOrder(String o_date) {
		return session.selectOne("order.countNewOrder",o_date);
	}

	public Order getOrderDetail(String o_code) {
		return session.selectOne("order.getOrderDetail",o_code);
	}

	public void updateOrder(String o_code) {
		session.update("order.updatePayment", o_code);
	}
	
	public List<Order> readOrder(Condition c) {
		return session.selectList("order.getOrderList",c);
	}

	public Integer getOrderCount() {
		return session.selectOne("order.getOrderCount");
	}

	public List<Order> findByDate(SCondition sc) {
		return session.selectList("order.getOrderListByDate",sc);
	}

	public List<Order> findNewOrder(SCondition sc) {
		return session.selectList("order.getNewOrderList", sc);
	}

	public List<Order> findWaitingOrder(Condition c) {
		return session.selectList("order.getWaitingOrderList" ,c);
	}
	
	
}
