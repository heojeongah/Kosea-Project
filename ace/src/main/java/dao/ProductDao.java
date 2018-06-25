package dao;

import java.util.List;

import model.Condition;
import model.Product;

public interface ProductDao {
	List<Product> readProduct(Condition c);
	Integer getProductCount(Condition c);
	List<Product> getProductDetail(String pcode);
	List<String> getBrands();
	Integer getMaxPid();
	List<Product> getTypeSearch(Condition c);
	List<Product> getProductSearch(Condition c);
}










