package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;

@Repository
public class MypageDaoImpl implements MypageDao {
	@Autowired
	private SqlSession session;
	
	public void update(User user) {
		session.update("new.updateUserInfo", user);
	}
	public User getById(String c_id) {
		return session.selectOne("new.getUserInfo",c_id);
	}
	public void updatePwd(User user) {
		session.update("new.updatePwd", user);
	}
}
