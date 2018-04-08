package cn.it.service;

import cn.it.model.Comment;

public interface CommentService {
	public Comment insertcomment(Comment u);
	public void insertdel(int id,int del);
	public int findcount(int referId);
	public int findrefer(int id);
}
