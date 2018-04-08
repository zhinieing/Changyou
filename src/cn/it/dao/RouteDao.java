package cn.it.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Route;

public interface RouteDao {
	public void RouteAdd(Route u);
	public int findid(@Param("routeTitle") String routeTitle);
	public Route findbyid(@Param("routeId") int routeId);
	public void RouteimgAdd(@Param("routeId") int routeId,@Param("routeImg") String routeImg );
	public void RoutetAdd(Route u);
	public void RoutecountAdd(@Param("routeId") int routeId,@Param("routeCount") int routeCount);
	public void RoutecollectAdd(@Param("routeId") int routeId,@Param("routeCollect") int routeCollect);
	public List<Route> findbytitle(@Param("routeTitle") String routeTitle);
	public void RoutedelAdd(@Param("routeId") int routeId,@Param("del") int del);
	public void deletebyId(@Param("routeTitle") String routeTitle);
}
