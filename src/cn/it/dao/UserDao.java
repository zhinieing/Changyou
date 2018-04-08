package cn.it.dao;

import java.util.List;

import cn.it.model.User;

public interface UserDao {
	public void UserAdd(User u);

	public void UserDelete(int id);

	public void UserimageAdd(User u);
	
	public void UserimforAdd(User u);

	public User findByUsername(String username);

	public List<User> findAll();

	public User findByUsernameAndPassWord(User u);
}
