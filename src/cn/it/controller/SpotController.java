package cn.it.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Comments;
import cn.it.model.Hotel;
import cn.it.model.Room;
import cn.it.model.Spot;
import cn.it.model.Ticket;
import cn.it.service.CommentsService;
import cn.it.service.HotelService;
import cn.it.service.SpotService;

@Controller
@SessionAttributes("userses")
public class SpotController {
	@Autowired
	private SpotService spotService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private HotelService hotelService;
    
	@RequestMapping(value="spotdetail.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView livingdetail(HttpServletRequest request, Model model) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		String spotName = new String(request.getParameter("spotName").getBytes("ISO-8859-1"),"UTF-8");
		Spot spot = spotService.findBySpotName(spotName);
		model.addAttribute("spot", spot);
		request.setAttribute("spot", spot);
		
		List<Ticket> ticketlist = spotService.findAll();
		model.addAttribute("ticketlist", ticketlist);
		request.setAttribute("ticketlist", ticketlist);
		
		List<Ticket> minpricelist = spotService.findMinPrice();
		model.addAttribute("minpricelist", minpricelist);
		request.setAttribute("minpricelist", minpricelist);
		
		List<Comments> commentslist = commentsService.findByCommentsName(spotName);
		model.addAttribute("commentslist", commentslist);
		request.setAttribute("commentslist", commentslist);
		
		String spotNameString = "%"+spotName+"%";
		List<Hotel> spotHotels = hotelService.findHotelBySpotName(spotNameString);
		model.addAttribute("spotHotels", spotHotels);
		request.setAttribute("spotHotels", spotHotels);
		
		List<Room> minpriceroomlist = hotelService.findMinPrice();
		model.addAttribute("minpriceroomlist",minpriceroomlist);
		request.setAttribute("minpriceroomlist", minpriceroomlist);
		 
		modelAndView.setViewName("spotdetail");
		return modelAndView;
	}
	
	@RequestMapping(value="spotorder.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView spotorder(HttpServletRequest request, Model model){
		ModelAndView modelAndView = new ModelAndView();
		
	    modelAndView.setViewName("spotorder");
		return modelAndView;
	}
	
}
