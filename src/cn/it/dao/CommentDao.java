package cn.it.dao;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Comment;

public interface CommentDao {
	public void CommentAdd(Comment u);
	public void CommentDelAdd(@Param("commentId") int commentId,@Param("del") int del);
    public int CommentCount(@Param("referId") int referId);
    public int Commentrefer(@Param("commentId") int commentId);
}
