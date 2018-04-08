package cn.it.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.UserDao;
import cn.it.model.User;
import cn.it.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{
  
	@Autowired
	private UserDao userDao;
	
	//登入注册
	public User findlogin(User u) {
		 User user=userDao.findByUsernameAndPassWord(u);
		return user;
	}
	public User findusername(User u) {
		 User user=userDao.findByUsername(u.getUsername());
		return user;
	}
	public User insertuser(User u) {
		userDao.UserAdd(u);
		return null;
	}
	public User insertuserimage(User u) {
		userDao.UserimageAdd(u);
		return null;
	}
	public User insertuserimfor(User u) {
		userDao.UserimforAdd(u);
		return null;
	}

}
