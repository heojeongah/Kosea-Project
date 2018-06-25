package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.SCondition;
import model.Sales;
@Repository
public class ReadSalesDaoImpl implements ReadSalesDao {

	@Autowired
	private SqlSession session;
	
	public Integer getSumByRange(SCondition sc) {
		return session.selectOne("sales.getSaelsTotalByRange", sc);
	}

	public Integer getSum() {
		return session.selectOne("sales.getSaelsTotal");
	}

	public Integer getSumByDate(String s_date) {
		return session.selectOne("sales.getSaelsTotalByDate",s_date);
	}	
	
	public List<Sales> readSales(Condition c) {
		return session.selectList("sales.getSalesList",c);
	}

	public Integer getSalesCount() {
		return session.selectOne("sales.getSalesCount");
	}

	public List<Sales> findByDate(SCondition sc) {
		return session.selectList("sales.getSalesListByDate",sc);
	}

	public Integer getMonthlyTotal(String month) {
		Integer total = session.selectOne("sales.getMonthlySales",month);
		if(total == null) total = 0 ;	
		return total;
}

public List<Sales> findByRange(SCondition sc) {
	return session.selectList("sales.getSalesListByRange",sc);
}
	
}