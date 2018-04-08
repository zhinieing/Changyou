package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.SpotDao;
import cn.it.model.Spot;
import cn.it.model.Ticket;
import cn.it.service.SpotService;
@Service("spotService")
public class SpotServiceImpl implements SpotService{
	@Autowired
	private SpotDao spotDao;

	@Override
	public List<Ticket> findAll() {
		// TODO Auto-generated method stub
		List<Ticket> ticketlist = spotDao.findAll();
		return ticketlist;
	}


	@Override
	public List<Ticket> findMinPrice() {
		// TODO Auto-generated method stub
		List<Ticket> minpricelist = spotDao.findMinPrice();
		return minpricelist;
	}

	@Override
	public Spot findBySpotName(String spotName) {
		// TODO Auto-generated method stub
		Spot spot = spotDao.findBySpotName(spotName);
		return spot;
	}


	@Override
	public void insertSpotPoint(float point, String spotName) {
		// TODO Auto-generated method stub
		spotDao.SpotPointAdd(point, spotName);
	}


	@Override
	public List<Spot> findMaxPoint() {
		// TODO Auto-generated method stub
		List<Spot> maxspotpoint = spotDao.findMaxPoint();
		return maxspotpoint;
	}

	

}
