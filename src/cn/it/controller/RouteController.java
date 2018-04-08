package cn.it.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Route;
import cn.it.model.User;
import cn.it.service.RouteService;

@Controller
@SessionAttributes("userses")
public class RouteController {
	@Autowired
	private RouteService routeService;
//上传标题
	
	@RequestMapping(value="routesubmit1.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView routesubmit1(@RequestParam("title") String title,ModelMap model, HttpSession request ){
		ModelAndView modelAndView=new ModelAndView();
		model.addAttribute("title", title); 
		request.setAttribute("title", title);  
		modelAndView.setViewName("routesubmit1");
        	  

		   return modelAndView;
	}
//上传路线坐标
	@RequestMapping(value="routesubmit2.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> routesubmit2(String one,String two,HttpSession httpSession ) throws UnsupportedEncodingException{
		Map<String,Object> resultMap = new HashMap<String, Object>();
		String title=new String(one.getBytes("iso8859-1"),"UTF-8");
        Route route = new Route();
        route.setRouteTitle(title);
        route.setRoutePass(two);
        User user = (User)httpSession.getAttribute("userses");
        route.setRouteWriter(user.getNickname());
        routeService.insertroute(route);
        int a = routeService.showid(title);
        System.out.print(a);
        resultMap.put("count",a);
		
        	  

		   return resultMap;
	}
//上传跳转到第二个上传页面
	@RequestMapping(value="transfor.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView transfor(@RequestParam("id") int id,ModelMap model, HttpSession request) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		Route route=routeService.showroute(id);
		model.addAttribute("route", route); 
		request.setAttribute("route", route);
		modelAndView.setViewName("routesubmit2");
		return modelAndView;
	}
//上传分段内容
	@RequestMapping(value="routesubmit3.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView routesubmit3(@RequestParam("id") int id,@RequestParam("titles") String titles,@RequestParam("place") String place,@RequestParam("content") String content,ModelMap model, HttpSession request) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		String titles1=new String(titles.getBytes("iso8859-1"),"UTF-8");
		String place1=new String(place.getBytes("iso8859-1"),"UTF-8");
		String content1=new String(content.getBytes("iso8859-1"),"UTF-8");
		Route route=routeService.showroute(id);
		route.setRouteTitles(titles1);
		route.setRoutePlace(place1);
		route.setRouteContent(content1);
		routeService.insertt(route);
		model.addAttribute("route", route); 
		request.setAttribute("route", route);
		modelAndView.setViewName("routesubmit3");
		return modelAndView;
	}
	
	@RequestMapping(value="routesubmit4.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView routesubmit4(@RequestParam("id") int id,@RequestParam("title") String title,@RequestParam("pass") String pass,@RequestParam("writer") String writer,ModelMap model, HttpSession request) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		String title1=new String(title.getBytes("iso8859-1"),"UTF-8");
		String writer1=new String(writer.getBytes("iso8859-1"),"UTF-8");
		Route route =new Route();
		route.setRouteId(id);
		route.setRoutePass(pass);
		route.setRouteTitle(title1);
		route.setRouteWriter(writer1);
		routeService.insertroute(route);
		model.addAttribute("route", route); 
		request.setAttribute("route", route);
		modelAndView.setViewName("routesubmit2");
		return modelAndView;
	}
	
	//展示detail
	@RequestMapping(value="routedetail.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView routedetail(@RequestParam("title") String title,ModelMap model, HttpSession request) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		String title1=new String(title.getBytes("iso8859-1"),"UTF-8");
		List<Route> routelist = routeService.showbytitle(title1);
		model.addAttribute("tilte", title1); 
		request.setAttribute("title", title1);
		model.addAttribute("route", routelist); 
		request.setAttribute("route", routelist);
		modelAndView.setViewName("routedetail");
		return modelAndView;
	}
	
	@RequestMapping(value="routeexam1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> routeexam(int id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
        routeService.insertdel(id, 2);
        resultMap.put("result","SUCCESS");
		   return resultMap;
	}
	@RequestMapping(value="routeexam2.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> routeexam1(int id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
        routeService.insertdel(id, 1);
        resultMap.put("result","SUCCESS");
		   return resultMap;
	}

}
