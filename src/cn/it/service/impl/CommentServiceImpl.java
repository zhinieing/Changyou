package cn.it.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.it.dao.CommentDao;
import cn.it.model.Comment;
import cn.it.service.CommentService;
@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDao commentDao;
	public Comment insertcomment(Comment u){
		commentDao.CommentAdd(u);
		return null;
	}
	public void insertdel(int id,int del){
		commentDao.CommentDelAdd(id, del);
	}
	public int findcount(int referId){
		int a =commentDao.CommentCount(referId);
		return a;
	}
	public int findrefer(int id){
		int a =commentDao.Commentrefer(id);
		return a;
	}

}
