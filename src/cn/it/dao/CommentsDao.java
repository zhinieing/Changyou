package cn.it.dao;

import java.util.List;

import cn.it.model.Comments;

public interface CommentsDao {
	public void commentsAdd(Comments u);
	public List<Comments> findByCommentsName(String commentsName);
	public List<Comments> getCommentsNameCount();
    //public List<Comments> findAvgPoint();
    public float findAvgPoint(String commentsName);
}
