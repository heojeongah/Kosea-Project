package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CartItem;
@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SqlSession session;
	
	public void insertCart(CartItem cartItem) {
		session.insert("new.insertCart",cartItem);
	}

	public void deleteCart(CartItem cartItem) {
		session.delete("new.deleteCart",cartItem);
	}

	public void updateCart(CartItem cartItem) {
		session.update("new.updateCart",cartItem);
	}

	public Integer selectMaxCart() {
		return session.selectOne("new.selectMaxCart");
	}

	public List<CartItem> selectCart(String c_id) {
		return session.selectList("new.selectCart",c_id);
	}

}













