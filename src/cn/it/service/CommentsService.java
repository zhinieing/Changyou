package cn.it.service;

import java.util.List;

import cn.it.model.Comments;

public interface CommentsService {
	public Comments insertComments(Comments u);
	public List<Comments> findByCommentsName(String commentsName);
	public List<Comments> showCommentsNameCount();
    //public List<Comments> findAvgPoint();
	public float findAvgPoint(String commentsName);
}
