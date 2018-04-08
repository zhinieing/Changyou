  package cn.it.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Comments;
import cn.it.model.Room;
import cn.it.model.Spot;
import cn.it.model.Ticket;
import cn.it.model.Travels;
import cn.it.service.CommentsService;
import cn.it.service.HotelService;
import cn.it.service.PageService;
import cn.it.service.SpotService;
import cn.it.service.TravelsService;



@Controller
public class PageController {
	@Autowired
	private PageService pageService;
	@Autowired
	private TravelsService travelsService;
	@Autowired
	private SpotService spotService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private CommentsService commentsService;
	//首页展示游记
	@RequestMapping(value="village.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcome(@RequestParam("villageSeason") String villageSeason,@RequestParam("villageSpecial") String villageSpecial,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		String villageSeason1=new String(villageSeason.getBytes("iso8859-1"),"UTF-8");
		String villageSpecial1=new String(villageSpecial.getBytes("iso8859-1"),"UTF-8");
		villageSeason1="%"+villageSeason1+"%";
		villageSpecial1="%"+villageSpecial1+"%";
		this.pageService.showProductsByPage(request, model,villageSeason1,villageSpecial1);
		
//		List<Village> list = villageService.findAll();
//		model.addAttribute("villageList", list); 
//		request.setAttribute("villageList", list);  
		modelAndView.setViewName("village");
		return modelAndView;
	}
	//评论展示
	@RequestMapping(value="detail.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcomea(HttpServletRequest request, Model model){
		ModelAndView modelAndView=new ModelAndView();
		String id = request.getParameter("id"); 
		int referId = Integer.parseInt(id);
		this.pageService.showCommentByPage(request, model,referId); 
		System.out.print(referId);
		Travels travels = travelsService.findbyId(referId);
		model.addAttribute("travels", travels); 
		request.setAttribute("travels", travels);  
		modelAndView.setViewName("travelsdetail");
		return modelAndView;
	}
	
	//路线展示
	@RequestMapping(value="routeshow.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcomeb(HttpServletRequest request, Model model){
		ModelAndView modelAndView=new ModelAndView();
		this.pageService.showRouteByPage(request, model);  
		modelAndView.setViewName("route");
		return modelAndView;
	}
	
	//路线审核
	@RequestMapping(value="routeexam.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcomec(@RequestParam("func") String func,HttpServletRequest request, Model model){
		ModelAndView modelAndView=new ModelAndView();
		model.addAttribute("func", func); 
		request.setAttribute("func", func); 
		this.pageService.showRouteByPage(request, model);  
		modelAndView.setViewName("admindetail");
		return modelAndView;
	}
	
	//游记审核
	@RequestMapping(value="travelsexam.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcomed(@RequestParam("func") String func,HttpServletRequest request, Model model){
		ModelAndView modelAndView=new ModelAndView();
		model.addAttribute("func", func); 
		request.setAttribute("func", func); 
		this.pageService.showTravelsByPage(request, model);  
		modelAndView.setViewName("admindetail");
		return modelAndView;
	}
	
	//评论审核
	@RequestMapping(value="commentexam.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcomee(@RequestParam("func") String func,HttpServletRequest request, Model model){
		ModelAndView modelAndView=new ModelAndView();
		model.addAttribute("func", func); 
		request.setAttribute("func", func); 
		this.pageService.showComment1ByPage(request, model);  
		modelAndView.setViewName("admindetail");
		return modelAndView;
	}
	
	//评论审核
	@RequestMapping(value="travels.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcomef(@RequestParam("title") String title,@RequestParam("sel") String sel,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		String titles=new String(title.getBytes("iso8859-1"),"UTF-8");
		String title1=null;
		if(titles==null){
			title1=null;}
		else{title1="%"+titles+"%";}
		this.pageService.showTravelstitleByPage(request, model, title1,sel);  
		modelAndView.setViewName("travels");
		return modelAndView;
	}
	
	
	//民宿展示
    @RequestMapping(value="living.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView hotel(HttpServletRequest request, Model model){
		ModelAndView modelAndView = new ModelAndView();
		this.pageService.showHotelByPage(request, model);
		
		List<Room> minpricelist = hotelService.findMinPrice();
		model.addAttribute("minpricelist",minpricelist);
		request.setAttribute("minpricelist", minpricelist);

		modelAndView.setViewName("living");
		return modelAndView;
	}
    
    
  //民宿搜索
    @RequestMapping(value="livingsearch.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView hotelSearch(HttpServletRequest request, Model model) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		String searchtheme;
		String hotelvillageName;
		if(request.getMethod()=="GET"){
			searchtheme = new String(request.getParameter("theme").getBytes("ISO-8859-1"),"UTF-8");
			hotelvillageName = new String(request.getParameter("hotelName").getBytes("ISO-8859-1"),"UTF-8");
		}else{
			searchtheme = request.getParameter("theme");
			hotelvillageName = request.getParameter("hotelName");
		}
		
		String referInDate = request.getParameter("inDate");
		String referIOutDate = request.getParameter("outDate");
		String theme = "%"+searchtheme+"%";
		String hotelName = "%"+hotelvillageName+"%";
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date inDate = new Date(formatter.parse(referInDate).getTime());
		Date outDate = new Date(formatter.parse(referIOutDate).getTime());
		this.pageService.showHotelSearchByPage(request, model, theme, inDate, outDate, hotelName);
		
		List<Room> minpricelist = hotelService.findMinPrice();
		model.addAttribute("minpricelist",minpricelist);
		request.setAttribute("minpricelist", minpricelist);
		
		
		modelAndView.setViewName("livingsearch");
		return modelAndView;
	}
  //景点展示
	@RequestMapping(value="spot.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView spot(HttpServletRequest request, Model model){
		ModelAndView modelAndView = new ModelAndView();
		this.pageService.showSpotByPage(request, model);
		
		List<Ticket> ticketlist = spotService.findAll();
		model.addAttribute("ticketlist", ticketlist);
		request.setAttribute("ticketlist", ticketlist);
		
		List<Ticket> minpricelist = spotService.findMinPrice();
		model.addAttribute("minpricelist", minpricelist);
		request.setAttribute("minpricelist", minpricelist);
		
		List<Comments> commentscount = commentsService.showCommentsNameCount();
		model.addAttribute("commentscount", commentscount);
		request.setAttribute("commentscount", commentscount);
		
		List<Spot> maxspotpoint = spotService.findMaxPoint();
		model.addAttribute("maxspotpoint",maxspotpoint);
		request.setAttribute("maxspotpoint", maxspotpoint);
		modelAndView.setViewName("spot");
		return modelAndView;
	}
	
	//景点搜索
	@RequestMapping(value="spotsearch.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView spotSearch(HttpServletRequest request, Model model) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		String searchtheme;
		String spotsearchName;
		if(request.getMethod()=="GET"){
			searchtheme = new String(request.getParameter("theme").getBytes("ISO-8859-1"),"UTF-8");
			spotsearchName = new String(request.getParameter("spotName").getBytes("ISO-8859-1"),"UTF-8");
		}else{
			searchtheme = request.getParameter("theme");
			spotsearchName = request.getParameter("spotName");
		}
		
		String theme = "%"+searchtheme+"%";
		String spotName = "%"+spotsearchName+"%";
		this.pageService.showSpotSearchByPage(request, model, theme, spotName);
		List<Ticket> ticketlist = spotService.findAll();
		model.addAttribute("ticketlist", ticketlist);
		request.setAttribute("ticketlist", ticketlist);
		
		List<Ticket> minpricelist = spotService.findMinPrice();
		model.addAttribute("minpricelist", minpricelist);
		request.setAttribute("minpricelist", minpricelist);
		
		List<Comments> commentscount = commentsService.showCommentsNameCount();
		model.addAttribute("commentscount", commentscount);
		request.setAttribute("commentscount", commentscount);
		
		List<Spot> maxspotpoint = spotService.findMaxPoint();
		model.addAttribute("maxspotpoint",maxspotpoint);
		request.setAttribute("maxspotpoint", maxspotpoint);
		modelAndView.setViewName("spotsearch");
		return modelAndView;
	}

}
