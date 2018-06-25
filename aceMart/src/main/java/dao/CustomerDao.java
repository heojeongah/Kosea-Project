package dao;

import java.util.List;

import model.Condition;
import model.Customer;

public interface CustomerDao {
	List<Customer> readCustomer(Condition c);
	Integer getCustomerCount();
	List<Customer> getCustomerDetail(String pcode);
}










