package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.HotelDao;
import cn.it.model.Hotel;
import cn.it.model.Room;
import cn.it.service.HotelService;
@Service("hotelService")
public class HotelServiceImpl implements HotelService{
	@Autowired
	private HotelDao hotelDao;

	@Override
	public List<Room> findMinPrice() {
		// TODO Auto-generated method stub
		List<Room> minpricelist = hotelDao.findMinPrice();
		return minpricelist;
	}

	@Override
	public Hotel findByHotelName(String hotelName) {
		// TODO Auto-generated method stub
		Hotel hotel = hotelDao.findByHotelName(hotelName);
		return hotel;
	}

	@Override
	public List<Room> findRoomByHotelName(String hotelName) {
		// TODO Auto-generated method stub
		List<Room> roomlist = hotelDao.findRoomByHotelName(hotelName);
		return roomlist;
	}

	@Override
	public void insertHotelPoint(float point, String hotelName) {
		// TODO Auto-generated method stub
		hotelDao.HotelPointAdd(point, hotelName);
	}

	@Override
	public List<Hotel> findHotelBySpotName(String spotName) {
		// TODO Auto-generated method stub
		List<Hotel> spotHotels = hotelDao.findHotelBySpotName(spotName);
		return spotHotels;
	}

	@Override
	public List<Hotel> findHotelByVillageTitle(String villageTitle) {
		// TODO Auto-generated method stub
		List<Hotel> villageHotels = hotelDao.findHotelByVillageTitle(villageTitle);
		return villageHotels;
	}

	@Override
	public void insertHotel(Hotel h) {
		// TODO Auto-generated method stub
		hotelDao.HotelAdd(h);
	}

	@Override
	public Hotel findHotelByUserId(int userId) {
		// TODO Auto-generated method stub
		Hotel h = hotelDao.findHotelByUserId(userId);
		return h;
	}

	@Override
	public void insertRoom(Room r) {
		// TODO Auto-generated method stub
		hotelDao.RoomAdd(r);
	}

	@Override
	public void deleteRoom(int id) {
		// TODO Auto-generated method stub
		hotelDao.deletebyId(id);
	}



}
