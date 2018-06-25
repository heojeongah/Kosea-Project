package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.PCondition;
import model.Product;
@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSession session;
	public List<Product> readProduct(PCondition c) {
		return session.selectList("prod.selectProdByCond",c);
	}

	public Integer getProductCount() {
		return session.selectOne("prod.getProductCount");
	}
	public List<Product> getProductDetail(String pcode) {
		return session.selectList("prod.getProductDetail",pcode);
	}

	public Integer getMaxPid() {
		return session.selectOne("prod.getMaxPcode");
	}

	public void insertProduct(Product p) {
		session.insert("prod.insertProduct",p);
	}

	public List<String> getBrands() {
		return session.selectList("prod.getBrands");
	}

	public List<String> getTypes() {
		return session.selectList("prod.getTypes");
	}

	public void updateProduct(Product product) {
		session.update("prod.updateProduct",product);
	}

	public void deleteProduct(String pcode) {
		session.delete("prod.deleteProduct",pcode);
	}

	public List<Product> readProductType(PCondition c) {
		return session.selectList("prod.selectProdByType",c);
	}

	public List<Product> readProductBrand(PCondition c) {
		return session.selectList("prod.selectProdByBrand",c);
	}

	public Integer getProductTypeCount(String type) {
		return session.selectOne("prod.getProductTypeCount",type);
	}

	public Integer getProductBrandCount(String brand) {
		return session.selectOne("prod.getProductBrandCount",brand);
	}
}



