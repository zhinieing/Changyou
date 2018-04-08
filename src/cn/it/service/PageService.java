package cn.it.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface PageService {
	/** 
     * 分页显示商品 
     * @param request 
     * @param model 
     * @param loginUserId 
     */  
	public void showProductsByPage(HttpServletRequest request,Model model,String villageSeason,String villageSpecial);
	public void showRouteByPage(HttpServletRequest request,Model model);
	public void showTravelsByPage(HttpServletRequest request,Model model);
	public void showTravelstitleByPage(HttpServletRequest request,Model model,String title,String sel);
	public void showComment1ByPage(HttpServletRequest request,Model model);
	public void showCommentByPage(HttpServletRequest request,Model model,int referId);
	public void showind1ByPage(HttpServletRequest request,Model model,int userId,String classt);
	public void showind2ByPage(HttpServletRequest request,Model model,int userId,String classt);
	public void showind3ByPage(HttpServletRequest request,Model model,String writer);
	public void showind4ByPage(HttpServletRequest request,Model model,String writer);
	public void showind5ByPage(HttpServletRequest request,Model model,int id);
	public void showind6ByPage(HttpServletRequest request,Model model,int id);
	
	public void showHotelByPage(HttpServletRequest request,Model model);
	public void showHotelSearchByPage(HttpServletRequest request,Model model,String theme,Date inDate,Date outDate,String hotelName);
	public void showSpotByPage(HttpServletRequest request,Model model);
	public void showSpotSearchByPage(HttpServletRequest request,Model model,String theme,String spotName);
	
	
}
