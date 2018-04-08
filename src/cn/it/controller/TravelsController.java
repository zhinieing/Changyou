package cn.it.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Travels;
import cn.it.model.User;
import cn.it.model.Village;
import cn.it.service.CollectService;
import cn.it.service.PageService;
import cn.it.service.RouteService;
import cn.it.service.TravelsService;
import cn.it.service.VillageService;

@Controller
@SessionAttributes("userses")
public class TravelsController {
	@Autowired
	private TravelsService travelsService;
	@Autowired
	private VillageService villageService;
	@Autowired
	private PageService pageService;
	@Autowired
	private CollectService collectService;
	@Autowired
	private RouteService routeService;
	//首页展示游记
	@RequestMapping(value="welcome1.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcome1(@RequestParam("error") String error,ModelMap model, HttpSession request) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		String error1=new String(error.getBytes("iso8859-1"),"UTF-8");
		System.out.print(error1);
		if(error != null){
			modelAndView.addObject("error",error1);
		}
		List<Village> list = villageService.findAll();
		model.addAttribute("villagelist", list); 
		request.setAttribute("villagelist", list);  
		modelAndView.setViewName("maint");
		return modelAndView;
	}
	
	//首页展示游记
	@RequestMapping(value="welcome.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcome(ModelMap model, HttpSession request){
		ModelAndView modelAndView=new ModelAndView();
		List<Village> list = villageService.findAll();
		model.addAttribute("villagelist", list); 
		request.setAttribute("villagelist", list);  
		modelAndView.setViewName("maint");
		return modelAndView;
	}
	
	//个人中心展示游记
	@RequestMapping(value="individual1.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcome2(@RequestParam("func") String func,@RequestParam("mess") String mess,ModelMap model, HttpSession request) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		String error1=new String(mess.getBytes("iso8859-1"),"UTF-8");
		System.out.print(error1);
		if(mess != null){
			modelAndView.addObject("mess",error1);
		}
		List<Travels> list = travelsService.findAll();
		model.addAttribute("func", func); 
		request.setAttribute("func", func); 
		model.addAttribute("travelsList", list); 
		request.setAttribute("travelsList", list);  
		modelAndView.setViewName("individualt");
		return modelAndView;
	}
	
	//个人中心展示游记
	@RequestMapping(value="individual.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcomea(@RequestParam("func") String func,Model model,HttpServletRequest request,HttpSession httpSession){
		ModelAndView modelAndView=new ModelAndView();
		User user = (User)httpSession.getAttribute("userses");
		if(func.equals("ca")){
			this.pageService.showind1ByPage(request, model, user.getId(),"village");
		}
		if(func.equals("cc")){
			this.pageService.showind2ByPage(request, model, user.getId(),"route");
		}
		if(func.equals("da")){
			this.pageService.showind3ByPage(request, model, user.getNickname());
		}
		if(func.equals("db")){
			this.pageService.showind4ByPage(request, model, user.getNickname());
		}
		if(func.equals("b")){
			this.pageService.showind5ByPage(request, model, user.getId());
		}
		model.addAttribute("func", func); 
		request.setAttribute("func", func); 
		modelAndView.setViewName("individualt");
		return modelAndView;
	}
	
	@RequestMapping(value="busywork13.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView busywork1(@RequestParam("func") String func,Model model,HttpServletRequest request,HttpSession httpSession){
		ModelAndView modelAndView=new ModelAndView();
		User user = (User)httpSession.getAttribute("userses");
			this.pageService.showind6ByPage(request, model, user.getId());
		model.addAttribute("func", func); 
		request.setAttribute("func", func); 
		modelAndView.setViewName("busywork13");
		return modelAndView;
	}
	
	@RequestMapping(value="delete1.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView delete1(@RequestParam("ida") int ida,@RequestParam("idb") int idb,ModelMap model, HttpSession request){
		ModelAndView modelAndView=new ModelAndView();
		collectService.deletebyid(idb, ida, "village");
		modelAndView.setViewName("redirect:individual.do?func=ca");
		return modelAndView;
	}
	@RequestMapping(value="delete2.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView delete2(@RequestParam("ida") int ida,@RequestParam("idb") int idb,ModelMap model, HttpSession request){
		ModelAndView modelAndView=new ModelAndView();
		collectService.deletebyid(idb, ida, "route");
		modelAndView.setViewName("redirect:individual.do?func=cc");
		return modelAndView;
	}
	
	@RequestMapping(value="delete3.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView delete3(@RequestParam("title") String title,ModelMap model, HttpSession request) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		String titles=new String(title.getBytes("iso8859-1"),"UTF-8");
		routeService.deletebyid(titles);
		modelAndView.setViewName("redirect:individual.do?func=db");
		return modelAndView;
	}
	//游记展示游记
//	@RequestMapping(value="travels.do",method={RequestMethod.GET,RequestMethod.POST})
//	public ModelAndView welcomec(@RequestParam("title") String title,ModelMap model, HttpSession request) throws UnsupportedEncodingException{
//		ModelAndView modelAndView=new ModelAndView();
//		String titles=new String(title.getBytes("iso8859-1"),"UTF-8");
//		String title1=null;
//		if(titles==null){
//			title1=null;}
//		else{title1="%"+titles+"%";}
//		List<Travels> list = travelsService.findAllbytitle(title1);
//		model.addAttribute("travelsList", list); 
//		request.setAttribute("travelsList", list);  
//		modelAndView.setViewName("travels");
//		return modelAndView;
//	}
	//详情展示游记
	@RequestMapping(value="detail1.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcomed(@RequestParam("id") int id,ModelMap model, HttpSession request){
		ModelAndView modelAndView=new ModelAndView();
		Travels travels = travelsService.findbyId(id);
		model.addAttribute("travels", travels); 
		request.setAttribute("travels", travels);  
		modelAndView.setViewName("travelsdetail");
		return modelAndView;
	}
	
	//上传游记
	
	@RequestMapping(value="travelssubmit.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView register(@RequestParam("travelsTitle") String travelsTitle,@RequestParam("month") String travelsClass,@RequestParam("travelsPlace") String travelsPlace,@RequestParam("travelsContent") String travelsContent, ModelMap model,HttpSession httpSession ){
		ModelAndView modelAndView=new ModelAndView();
		User user = (User)httpSession.getAttribute("userses");
		Travels travels = new Travels();
     	travels.setTravelsClass(travelsClass);
		travels.setTravelsContent(travelsContent);
		travels.setTravelsPlace(travelsPlace);
		if(travelsClass.equals("travels")){
			travelsTitle="【游记】"+travelsTitle;
		}else if(travelsClass.equals("strategy")){
			travelsTitle="【攻略】"+travelsTitle;
		}
		travels.setTravelsTitle(travelsTitle);
		travels.setTravelsWriter(user.getNickname());
       travelsService.inserttravels(travels);
		modelAndView.setViewName("redirect:individual.do?func=a");
        	  

		   return modelAndView;
	}
//删除游记
	
	@RequestMapping(value="travelsdelete.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView deletetravels(@RequestParam("id") int id, ModelMap model ){
		ModelAndView modelAndView=new ModelAndView();
		System.out.print(id);
		travelsService.deletetravels(id);
		modelAndView.setViewName("redirect:individual.do?func=da");        	 
		   return modelAndView;
	}
	
	@RequestMapping(value="travelsexam1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> travelsexam1(int id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
        travelsService.insertdel(id,2);
        resultMap.put("result","SUCCESS");
		   return resultMap;
	}
	
	@RequestMapping(value="travelsexam2.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> travelsexam2(int id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
        travelsService.insertdel(id,1);
        resultMap.put("result","SUCCESS");
		   return resultMap;
	}
}
