package cn.it.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.it.dao.TravelsDao;
import cn.it.model.Travels;
import cn.it.service.TravelsService;
@Service("travelsService")
public class TravelsServiceImpl implements TravelsService {
	@Autowired
	private TravelsDao travelsDao;
	public Travels inserttravels(Travels u){
		travelsDao.TravelsAdd(u);
		return null;
	}
	public List<Travels> findAll(){
		List<Travels> travelslist =  travelsDao.findAll();
		return travelslist;
	}
	public List<Travels> findAllbytitle(String title){
		List<Travels> travelslist =  travelsDao.findAllbytitle(title);
		return travelslist;
	}
	public Travels deletetravels(int travelsId){
		travelsDao.deletebyId(travelsId);
		return null;
	}
	public Travels findbyId(int travelsId){
		Travels travels =travelsDao.findbyId(travelsId);
		return(travels);
	}
    public void insertdel(int id,int del){
    	travelsDao.TravelsDelAdd(id, del);
    }
    public void insertComment(int id,int count){
    	travelsDao.TravelsCommentAdd(id, count);
    }
	
}
