package dao;

import java.util.List;

import model.Condition;
import model.SCondition;
import model.Sales;

public interface ReadSalesDao {
	List<Sales> readSales(Condition c);
	Integer getSalesCount();
	List<Sales> findByDate(SCondition sc);
	Integer getMonthlyTotal(String month);
	List<Sales> findByRange(SCondition sc);
	Integer getSum();
	Integer getSumByDate(String s_date);
	Integer getSumByRange(SCondition sc);
}
