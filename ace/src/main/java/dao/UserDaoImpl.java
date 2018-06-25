package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;
@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SqlSession session;
	public User findByUserIdAndPassword(User user) {
		return session.selectOne("home.getUser",user);
	}
	public void create(User user) {
		session.insert("home.putUser",user);
	}
	public User checkId(String c_id) {
		return session.selectOne("home.checkId",c_id);
	}

}







