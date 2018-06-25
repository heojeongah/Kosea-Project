package dao;

import java.util.List;

import model.Condition;
import model.PCondition;
import model.Product;

public interface ProductDao {
	List<Product> readProduct(PCondition c);
	List<Product> readProductType(PCondition c);
	List<Product> readProductBrand(PCondition c);
	Integer getProductTypeCount(String type);
	Integer getProductBrandCount(String brand);
	Integer getProductCount();
	void updateProduct(Product product);
	List<Product> getProductDetail(String pcode);
	List<String> getBrands();
	List<String> getTypes();
	void deleteProduct(String pcode);
	Integer getMaxPid();
	void insertProduct(Product product);
}










