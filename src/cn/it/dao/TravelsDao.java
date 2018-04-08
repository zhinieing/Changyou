package cn.it.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Travels;
public interface TravelsDao {
	public void TravelsAdd(Travels u);
	public List<Travels> findAll();
	public List<Travels> findAllbytitle(@Param("travelsTitle") String travelsTitle);
	public void deletebyId(int travelsId);
	public Travels findbyId(int travelsId);
	public void TravelsDelAdd(@Param("travelsId") int travelsId,@Param("del") int del);
	public void TravelsCommentAdd(@Param("travelsId") int travelsId,@Param("travelsComment") int travelsComment);
}
