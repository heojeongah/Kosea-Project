package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Condition;
import model.Product;
@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSession session;
	
	public List<Product> readProduct(Condition c) {
		return session.selectList("home.selectProdByCond",c);
	}

	public Integer getProductCount(Condition c) {
		return session.selectOne("home.getProductCount",c);
	}
	public List<Product> getProductDetail(String pcode) {
		return session.selectList("home.getProductDetail",pcode);
	}

	public Integer getMaxPid() {
		return session.selectOne("home.getMaxPcode");
	}

	public List<String> getBrands() {
		return session.selectList("home.getBrands");
	}
	public List<Product> getTypeSearch(Condition c) {
		return session.selectList("home.getTypeSearch",c);
	}
	public List<Product> getProductSearch(Condition c) {
		return session.selectList("home.getProductSearch",c);
	}
}



