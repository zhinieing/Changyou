package cn.it.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.it.dao.RouteDao;
import cn.it.model.Route;
import cn.it.service.RouteService;
@Service("routeService")
public class RouteServiceImpl implements RouteService {
	@Autowired
	private RouteDao routeDao;
	public Route insertroute(Route u){
		routeDao.RouteAdd(u);
		return null;
	}
	public void insertimg(int id,String img){
		routeDao.RouteimgAdd(id, img);
	}
	public int showid(String title){
		int a =routeDao.findid(title);
		return a;
	}
	public Route showroute(int id){
		Route r =routeDao.findbyid(id);
		return r;
	}
	public void insertt(Route u){
		routeDao.RoutetAdd(u);
	}
	public List<Route> showbytitle(String title){
		List<Route> routelist =  routeDao.findbytitle(title);
		return routelist;
	}
	public void insertcount(int id,int count){
		routeDao.RoutecountAdd(id, count);
	}
	public void insertcollect(int id,int count){
		routeDao.RoutecollectAdd(id, count);
	}
	public void insertdel(int id,int del){
		routeDao.RoutedelAdd(id, del);
	}
	public void deletebyid(String title){
		routeDao.deletebyId(title);
	}

}