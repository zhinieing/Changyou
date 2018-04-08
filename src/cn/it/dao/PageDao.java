package cn.it.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.it.model.Comment;
import cn.it.model.Hotel;
import cn.it.model.Order;
import cn.it.model.Route;
import cn.it.model.Spot;
import cn.it.model.Travels;
import cn.it.model.Village;

public interface PageDao {
	/** 
	 * 使用注解方式传入多个参数，用户产品分页，通过登录用户ID查询 
	 * @param page 
	 * @param userId 
	 * @return startPos},#{pageSize}  
	 */  
	public List<Village> selectProductsByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="villageSeason") String villageSeason,@Param(value="villageSpecial") String villageSpecial);
	public List<Comment> selectCommentByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="referId") Integer referId);
	public List<Comment> selectComment1ByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize);
	public List<Route> selectRouteByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize);  
	public List<Travels> selectTravelsByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize);  
	public List<Travels> selectTravelstitleByPage1(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="travelsTitle") String travelsTitle);
	public List<Travels> selectTravelstitleByPage2(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="travelsTitle") String travelsTitle); 
	public List<Travels> selectTravelstitleByPage3(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="travelsTitle") String travelsTitle); 
	public List<Travels> selectTravelstitleByPage4(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="travelsTitle") String travelsTitle); 
	public List<Village> selectind1ByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="userId") Integer userId,@Param(value="classt") String classt);
	public List<Route> selectind2ByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="userId") Integer userId,@Param(value="classt") String classt);
	public List<Travels> selectind3ByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="writer") String writer);
	public List<Route> selectind4ByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="writer") String writer);
	public List<Order> selectind5ByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="useraId") int useraId);
	public List<Order> selectind6ByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="userbId") int userbId);
	
	public List<Hotel> selectHotelByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize);
	public List<Hotel> selectHotelSearchByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,
			@Param(value="theme") String theme,@Param(value="inDate") Date inDate,@Param(value="outDate") Date outDate,@Param(value="hotelName") String hotelName);
	public List<Spot> selectSpotByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize);
	public List<Spot> selectSpotSearchByPage(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="theme") String theme,@Param(value="spotName") String spotName);
	
	
	
	/** 
	
	/** 
	 * 取得产品数量信息，通过登录用户ID查询 
	 * @param userId 
	 * @return 
	 */  
	public int getProductsCount(@Param(value="villageSeason") String villageSeason,@Param(value="villageSpecial") String villageSpecial);
	public int getRouteCount();
	public int getTravelsCount();
	public int getTravelstitleCount(@Param(value="travelsTitle") String travelsTitle);
	public int getComment1Count();
	public int getCommentCount(@Param(value="referId") Integer referId);
	public int getind1Count(@Param(value="userId") Integer userId,@Param(value="classt") String classt);
	public int getind2Count(@Param(value="userId") Integer userId,@Param(value="classt") String classt);
	public int getind3Count(@Param(value="writer") String writer);
	public int getind4Count(@Param(value="writer") String writer);
	public int getind5Count(@Param(value="useraId") int useraId);
	public int getind6Count(@Param(value="userbId") int userbId);
	
	public int getHotelCount();
	public int getHotelSearchCount(@Param(value="theme") String theme,@Param(value="inDate") Date inDate,@Param(value="outDate") Date outDate,@Param(value="hotelName") String hotelName);
	public int getSpotCount();
	public int getSpotSearchCount(@Param(value="theme") String theme,@Param(value="spotName") String spotName);

}
