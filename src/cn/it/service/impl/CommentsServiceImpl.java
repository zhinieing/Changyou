package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.CommentsDao;
import cn.it.model.Comments;
import cn.it.service.CommentsService;
@Service("commentsService")
public class CommentsServiceImpl implements CommentsService{
	@Autowired
	private CommentsDao commentsDao;

	@Override
	public List<Comments> findByCommentsName(String commentsName) {
		// TODO Auto-generated method stub
		List<Comments> commentslist = commentsDao.findByCommentsName(commentsName);
		return commentslist;
	}

	@Override
	public Comments insertComments(Comments u) {
		// TODO Auto-generated method stub
		commentsDao.commentsAdd(u);
		return null;
	}

	@Override
	public List<Comments> showCommentsNameCount() {
		// TODO Auto-generated method stub
		List<Comments> commentscount = commentsDao.getCommentsNameCount();
		return commentscount;
	}

	@Override
	public float findAvgPoint(String commentsName) {
		// TODO Auto-generated method stub
		float livingavgpoint = commentsDao.findAvgPoint(commentsName);
		return livingavgpoint;
	}

	

}
