package dao;

import model.User;

public interface MypageDao {
	User getById(String c_id);
	void update(User user);
	void updatePwd(User user);
}
