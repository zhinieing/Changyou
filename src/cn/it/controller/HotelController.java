package cn.it.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Comments;
import cn.it.model.Hotel;
import cn.it.model.Order;
import cn.it.model.Room;
import cn.it.model.User;
import cn.it.service.CommentsService;
import cn.it.service.HotelService;
import cn.it.service.OrderService;

@Controller
@SessionAttributes("userses")
public class HotelController {
	@Autowired
	private HotelService hotelService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="livingdetail.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView livingdetail(HttpServletRequest request, Model model) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		String hotelName = new String(request.getParameter("hotelName").getBytes("ISO-8859-1"),"UTF-8");
		Hotel hotel = hotelService.findByHotelName(hotelName);
		model.addAttribute("hotel",hotel);
		request.setAttribute("hotel",hotel);
		
		List<Room> roomlist = hotelService.findRoomByHotelName(hotelName);
		model.addAttribute("roomlist",roomlist);
		request.setAttribute("roomlist", roomlist);
		
		List<Room> minpricelist = hotelService.findMinPrice();
		model.addAttribute("minpricelist",minpricelist);
		request.setAttribute("minpricelist", minpricelist);
		
		List<Comments> commentslist = commentsService.findByCommentsName(hotelName);
		model.addAttribute("commentslist", commentslist);
		request.setAttribute("commentslist", commentslist);
		
		modelAndView.setViewName("livingdetail");
		return modelAndView;
	}
	
	@RequestMapping(value="hotelexam.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView hotelexam(HttpServletRequest request, Model model,HttpSession httpSession) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		User user = (User)httpSession.getAttribute("userses");
		Hotel h=hotelService.findHotelByUserId(user.getId());
		model.addAttribute("hotel", h);
		request.setAttribute("hotel", h);
		modelAndView.setViewName("busywork");
		return modelAndView;
	}
	
	@RequestMapping(value="busywork12.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView busywork12(@RequestParam("name") String name,HttpServletRequest request, Model model,HttpSession httpSession) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		String hotelName = new String(name.getBytes("ISO-8859-1"),"UTF-8");
		List<Room> roomlist = hotelService.findRoomByHotelName(hotelName);
		model.addAttribute("roomlist", roomlist);
		request.setAttribute("roomlist", roomlist);
		model.addAttribute("hotelName", hotelName);
		request.setAttribute("hotelName", hotelName);
		modelAndView.setViewName("busywork12");
		return modelAndView;
	}
	
	@RequestMapping(value="roomadd.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView roomadd(@RequestParam("name") String name,@RequestParam("typ") String typ,@RequestParam("pol") String pol,@RequestParam("pri") String pri,@RequestParam("pay") String pay,HttpServletRequest request, Model model,HttpSession httpSession) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		String hotelName = new String(name.getBytes("ISO-8859-1"),"UTF-8");
		Room room=new Room();
		room.setHotelName(hotelName);
		room.setPolicy(pol);
		room.setPrice(pri);
		room.setType(typ);
		room.setWayofpayment(pay);
		hotelService.insertRoom(room);
		List<Room> roomlist = hotelService.findRoomByHotelName(hotelName);
		model.addAttribute("hotelName", hotelName);
		request.setAttribute("hotelName", hotelName);
		model.addAttribute("roomlist", roomlist);
		request.setAttribute("roomlist", roomlist);
		modelAndView.setViewName("busywork12");
		return modelAndView;
	}
	
	@RequestMapping(value="roomdelete.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView roomdelete(@RequestParam("name") String name,@RequestParam("id") int id,HttpServletRequest request, Model model,HttpSession httpSession) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		String hotelName = new String(name.getBytes("ISO-8859-1"),"UTF-8");
		
		hotelService.deleteRoom(id);
		List<Room> roomlist = hotelService.findRoomByHotelName(hotelName);
		model.addAttribute("hotelName", hotelName);
		request.setAttribute("hotelName", hotelName);
		model.addAttribute("roomlist", roomlist);
		request.setAttribute("roomlist", roomlist);
		modelAndView.setViewName("busywork12");
		return modelAndView;
	}
	
	@RequestMapping(value="livingorder.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView livingorder(HttpServletRequest request, Model model){
		ModelAndView modelAndView = new ModelAndView();
		
	    modelAndView.setViewName("livingorder");
		return modelAndView;
	}
	
	@RequestMapping(value="ordersubmit.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView ordersubmit(@RequestParam("number") int number,@RequestParam("total") int total,@RequestParam("userId") int userId,@RequestParam("orderName") String orderName,@RequestParam("theme") String theme,@RequestParam("address") String address,@RequestParam("type") String type,@RequestParam("price") int price,@RequestParam("wayofpayment") String wayofpayment,HttpServletRequest request, Model model,HttpSession httpSession) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
		type = new String(type.getBytes("ISO-8859-1"),"UTF-8");
		orderName = new String(orderName.getBytes("ISO-8859-1"),"UTF-8");
		address = new String(address.getBytes("ISO-8859-1"),"UTF-8");
		theme = new String(theme.getBytes("ISO-8859-1"),"UTF-8");
		wayofpayment = new String(wayofpayment.getBytes("ISO-8859-1"),"UTF-8");
		Order order=new Order();
		order.setNumber(number);
		order.setTotal(total);
		order.setAddress(address);
		order.setOrderName(orderName);
		order.setTheme(theme);
		order.setType(type);
		order.setWayofpayment(wayofpayment);
		order.setPrice(price);
		User user = (User)httpSession.getAttribute("userses");
		order.setUseraId(user.getId());
		order.setUserbId(userId);
		  System.out.println(order.getOrderName());
		orderService.insertOrder(order);
		  System.out.println(order.getOrderId());
		model.addAttribute("order", order);
		request.setAttribute("order", order);
	    modelAndView.setViewName("orderpayment");
		return modelAndView;
	}
	
	@RequestMapping(value="orderdel1.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderdel1(@RequestParam("id") int id,HttpServletRequest request, Model model){
		ModelAndView modelAndView = new ModelAndView();
		if(id!=0){
		orderService.insertdelOrder(id, 2);
		}
	    modelAndView.setViewName("redirect:individual.do?func=b");
		return modelAndView;
	}
	
	
	@RequestMapping(value="orderdel2.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderdel2(@RequestParam("id") int id,HttpServletRequest request, Model model){
		ModelAndView modelAndView = new ModelAndView();
		if(id!=0){
		orderService.insertdelOrder(id, 3);
		}
	    modelAndView.setViewName("redirect:busywork13.do?func=a");
		return modelAndView;
	}
	
	@RequestMapping(value="orderdel3.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderdel3(@RequestParam("id") int id,HttpServletRequest request, Model model){
		ModelAndView modelAndView = new ModelAndView();
		if(id!=0){
		orderService.insertdelOrder(id, 4);
		}
	    modelAndView.setViewName("redirect:busywork13.do?func=a");
		return modelAndView;
	}
	
	@RequestMapping(value="orderdetail.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderdetail(@RequestParam("id") int id,HttpServletRequest request, Model model){
		ModelAndView modelAndView = new ModelAndView();
		Order order=orderService.findbyid(id);
		model.addAttribute("order", order);
		request.setAttribute("order", order);
		model.addAttribute("fun", "a");
		request.setAttribute("fun", "a");
	    modelAndView.setViewName("orderpayment");
		return modelAndView;
	}
	
	@RequestMapping(value="orderdelete.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderdelete(@RequestParam("id") int id,HttpServletRequest request, Model model){
		ModelAndView modelAndView = new ModelAndView();
		orderService.deleteOrder(id);
	    modelAndView.setViewName("redirect:individual.do?func=b");
		return modelAndView;
	}
	
	
}
