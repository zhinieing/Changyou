package cn.it.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Spot;
import cn.it.model.Ticket;


public interface SpotDao {
	public List<Ticket> findAll();
	public List<Ticket> findMinPrice();
	public Spot findBySpotName(String spotName);
	public void SpotPointAdd(@Param("point") float point,@Param("spotName") String spotName);
	public List<Spot> findMaxPoint();
}
