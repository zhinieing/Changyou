package cn.it.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Hotel;
import cn.it.model.Room;


public interface HotelDao {
    public List<Room> findMinPrice();
    public Hotel findByHotelName(String hotelName);
    public List<Room> findRoomByHotelName(String hotelName);
    public void HotelPointAdd(@Param("point") float point,@Param("hotelName") String hotelName);
    public List<Hotel> findHotelBySpotName(String spotName);
    public List<Hotel> findHotelByVillageTitle(String villageTitle);
    public Hotel findHotelByUserId(@Param("userId") int userId);
    public void HotelAdd(Hotel h);
    public void RoomAdd(Room r);
    public void deletebyId(int roomId);
}
