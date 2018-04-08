package cn.it.service;

import cn.it.model.User;

public interface UserService {
     public User findlogin(User u);
     public User insertuser(User u);
     public User insertuserimage(User u);
     public User insertuserimfor(User u);
     public User findusername(User u);
}
