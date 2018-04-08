package cn.it.service;

import java.util.List;

import cn.it.model.Hotel;
import cn.it.model.Room;

public interface HotelService {
	public List<Room> findMinPrice();
	public Hotel findByHotelName(String hotelName);
	public List<Room> findRoomByHotelName(String hotelName);
	public void insertHotelPoint(float point, String hotelName);
	public List<Hotel> findHotelBySpotName(String spotName);
    public List<Hotel> findHotelByVillageTitle(String villageTitle);
    public Hotel findHotelByUserId(int userId);
    public void insertHotel(Hotel h);
    public void insertRoom(Room r);
    public void deleteRoom(int id);
}
