package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Customer;
@Repository
public class CustomerDaoImpl implements CustomerDao {
	@Autowired
	private SqlSession session;
	public List<Customer> readCustomer(Condition c) {
		return session.selectList("heo.selectCustomerByCond",c);
	}
	public Integer getCustomerCount() {
		return session.selectOne("heo.getCustomerCount");
	}
	public List<Customer> getCustomerDetail(String pcode) {
		return session.selectList("heo.getCustomerDetail",pcode);
	}
}



