package dao;

import model.User;

public interface UserDao {
	User findByUserIdAndPassword(User user);
	void create(User user);
	User checkId(String c_id);
}
