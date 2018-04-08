package cn.it.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Comments;
import cn.it.model.User;
import cn.it.service.CommentsService;
import cn.it.service.HotelService;
import cn.it.service.SpotService;
import cn.it.service.VillageService;

@Controller
@SessionAttributes("userses")
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private SpotService spotService;
	@Autowired
	private VillageService villageService;
	
	@RequestMapping(value="commentslivingsubmit.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView commentslivingSubmit(@RequestParam("status") String content,@RequestParam("hotelName") String hotelNameString,@RequestParam("point") int point, ModelMap model,HttpSession httpSession ) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		User user = (User)httpSession.getAttribute("userses");
		Comments comments = new Comments();
		String hotelName = new String(hotelNameString.getBytes("ISO-8859-1"),"UTF-8");
		comments.setCommentsName(hotelName);
		comments.setContent(content);
		comments.setPoint(point);
		comments.setImage(user.getImage());
		comments.setWriter(user.getNickname());
		commentsService.insertComments(comments);
		
		float livingavgpoint = commentsService.findAvgPoint(hotelName);
		hotelService.insertHotelPoint(livingavgpoint, hotelName);
		modelAndView.setViewName("redirect:livingdetail.do?hotelName="+hotelNameString);
		return modelAndView;
	}
	
	@RequestMapping(value="commentsspotsubmit.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView commentsspotSubmit(@RequestParam("status") String content,@RequestParam("spotName") String spotNameString,@RequestParam("point") int point, ModelMap model,HttpSession httpSession ) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		User user = (User)httpSession.getAttribute("userses");
		Comments comments = new Comments();
		String spotName = new String(spotNameString.getBytes("ISO-8859-1"),"UTF-8");
		comments.setCommentsName(spotName);
		comments.setContent(content);
		comments.setPoint(point);
		comments.setImage(user.getImage());
		comments.setWriter(user.getNickname());
		commentsService.insertComments(comments);
		
		float spotavgpoint = commentsService.findAvgPoint(spotName);
		spotService.insertSpotPoint(spotavgpoint, spotName);
		modelAndView.setViewName("redirect:spotdetail.do?spotName="+spotNameString);
		return modelAndView;
	}
	
	@RequestMapping(value="commentslvillagesubmit.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView commentsvillageSubmit(@RequestParam("status") String content,@RequestParam("villageTitle") String villageTitleString,@RequestParam("id") int villageId,@RequestParam("point") int point, ModelMap model,HttpSession httpSession ) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		User user = (User)httpSession.getAttribute("userses");
		Comments comments = new Comments();
		String villageTitle = new String(villageTitleString.getBytes("ISO-8859-1"),"UTF-8");
		comments.setCommentsName(villageTitle);
		comments.setContent(content);
		comments.setPoint(point);
		comments.setImage(user.getImage());
		comments.setWriter(user.getNickname());
		commentsService.insertComments(comments);
		
		float villageavgpoint = commentsService.findAvgPoint(villageTitle);
		villageService.insertVillagePoint(villageavgpoint, villageTitle);
		modelAndView.setViewName("redirect:villagedetail.do?id="+villageId);
		return modelAndView;
	}
	
	
}
