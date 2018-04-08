package cn.it.service;

import java.util.List;

import cn.it.model.Route;

public interface RouteService {
	public Route insertroute(Route u);
	public void insertimg(int id,String img);
	public int showid(String title);
	public Route showroute(int id);
	public void insertt(Route u);
	public void insertcount(int id,int count);
	public void insertcollect(int id,int count);
	public void insertdel(int id,int del);
	public List<Route> showbytitle(String title);
	public void deletebyid(String title);
}
