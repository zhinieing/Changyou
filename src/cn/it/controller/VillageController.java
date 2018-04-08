package cn.it.controller;
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
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Collect;
import cn.it.model.Comments;
import cn.it.model.Hotel;
import cn.it.model.Pointgood;
import cn.it.model.Room;
import cn.it.model.Village;
import cn.it.service.CollectService;
import cn.it.service.CommentsService;
import cn.it.service.HotelService;
import cn.it.service.PointgoodService;
import cn.it.service.RouteService;
import cn.it.service.VillageService;

@Controller
public class VillageController {
	@Autowired
	private VillageService villageService;
	@Autowired
	private PointgoodService pointgoodService;
	@Autowired
	private RouteService routeService;
	@Autowired
	private CollectService collectService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private CommentsService commentsService;
	//首页展示游记
	@RequestMapping(value="village1.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcome(ModelMap model, HttpSession request){
		ModelAndView modelAndView=new ModelAndView();
		List<Village> list = villageService.findAll();
		model.addAttribute("villageList", list); 
		request.setAttribute("villageList", list);  
		modelAndView.setViewName("village");
		return modelAndView;
	}
	//详情展示游记
	@RequestMapping(value="villagedetail.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView welcomed(@RequestParam("id") int id,ModelMap model, HttpSession request){
		ModelAndView modelAndView=new ModelAndView();
		Village village = villageService.findbyid(id);
		model.addAttribute("village", village); 
		request.setAttribute("village", village); 
		
		String villageTitle = "%"+village.getVillageTitle()+"%";
		List<Hotel> villageHotels = hotelService.findHotelByVillageTitle(villageTitle);
		model.addAttribute("villageHotels", villageHotels); 
		request.setAttribute("villageHotels", villageHotels); 
		
		List<Comments> commentslist = commentsService.findByCommentsName(village.getVillageTitle());
		model.addAttribute("commentslist", commentslist);
		request.setAttribute("commentslist", commentslist);
		
		List<Room> minpricelist = hotelService.findMinPrice();
		model.addAttribute("minpricelist",minpricelist);
		request.setAttribute("minpricelist", minpricelist);
		
		modelAndView.setViewName("villagedetail");
		return modelAndView;
	}
	//详情展示游记
	@RequestMapping(value="good.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> villagegood(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "参数不合法！");  
	        return resultMap;  
	    }  
	    //xxx逻辑处理  
	    else{
	    Pointgood pointgood = new Pointgood();
	    pointgood.setUserId(idb);
	    pointgood.setClassId(ida);
	    pointgood.setClasst(classt);
	    pointgoodService.insertpointgood(pointgood);
	    int count = pointgoodService.showpointgood(ida,classt);
	    villageService.insertcount(ida, count);
	    resultMap.put("count",count);
	    resultMap.put("result", "SUCCESS");  
	    return resultMap;
	    }
	}
	
	@RequestMapping(value="gooda.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> villagegooda(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "参数不合法！");  
	        return resultMap;  
	    }  
	    //xxx逻辑处理  
	    else{
	    Pointgood pointgood = new Pointgood();
	    pointgood.setUserId(idb);
	    pointgood.setClassId(ida);
	    pointgood.setClasst(classt);
	    pointgoodService.deletebyid(ida, idb, classt);
	    int count = pointgoodService.showpointgood(ida,classt);
	    villageService.insertcount(ida, count);
	    resultMap.put("count",count);
	    resultMap.put("result", "SUCCESS");  
	    return resultMap;
	    }
	}
	
	
	@RequestMapping(value="goodroute.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> good2(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "参数不合法！");  
	        return resultMap;  
	    }  
	    //xxx逻辑处理  
	    else{
	    Pointgood pointgood = new Pointgood();
	    pointgood.setUserId(idb);
	    pointgood.setClassId(ida);
	    pointgood.setClasst(classt);
	    pointgoodService.insertpointgood(pointgood);
	    int count = pointgoodService.showpointgood(ida,classt);
	    routeService.insertcount(ida, count);
	    resultMap.put("count",count);
	    resultMap.put("result", "SUCCESS");  
	    return resultMap;
	    }
	}
	
	@RequestMapping(value="goodroute1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> good3(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "参数不合法！");  
	        return resultMap;  
	    }  
	    //xxx逻辑处理  
	    else{
	    Pointgood pointgood = new Pointgood();
	    pointgood.setUserId(idb);
	    pointgood.setClassId(ida);
	    pointgood.setClasst(classt);
	    pointgoodService.deletebyid(ida, idb, classt);
	    int count = pointgoodService.showpointgood(ida,classt);
	    routeService.insertcount(ida, count);
	    resultMap.put("count",count);
	    resultMap.put("result", "SUCCESS");  
	    return resultMap;
	    }
	}
	
	@RequestMapping(value="good1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> good1(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "未进行点赞");  
	        return resultMap; 
	        
	    }  
	    //xxx逻辑处理  
	    else{
	    int count =pointgoodService.showpointgoodnum(ida,idb,classt);
	    System.out.print(count);
	    if(count==0){
	    	resultMap.put("result", "未进行点赞");  
	        return resultMap;  
	    	
	    }
	    else{
	    	resultMap.put("result", "SUCCESS");  
		    return resultMap;  
	    }
	    }
	}
	@RequestMapping(value="collectroute.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> collect1(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "参数不合法！");  
	        return resultMap;  
	    }  
	    //xxx逻辑处理  
	    else{
	    Collect collect = new Collect();
	    collect.setUserId(idb);
	    collect.setClassId(ida);
	    collect.setClasst(classt);
	    collectService.insertcollect(collect);
	    int count = collectService.showcollect(ida,classt);
	    routeService.insertcollect(ida, count);
	    resultMap.put("count",count);
	    resultMap.put("result", "SUCCESS");  
	    return resultMap;
	    }
	}
	
	
	@RequestMapping(value="collectvillage.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> collecta(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "参数不合法！");  
	        return resultMap;  
	    }  
	    //xxx逻辑处理  
	    else{
	    Collect collect = new Collect();
	    collect.setUserId(idb);
	    collect.setClassId(ida);
	    collect.setClasst(classt);
	    collectService.insertcollect(collect);
	    int count = collectService.showcollect(ida,classt);
	    villageService.insertcollect(ida, count);
	    resultMap.put("count",count);
	    resultMap.put("result", "SUCCESS");  
	    return resultMap;
	    }
	}
	
	
	@RequestMapping(value="collectroute1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> collect2(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "参数不合法！");  
	        return resultMap;  
	    }  
	    //xxx逻辑处理  
	    else{
	    Collect collect = new Collect();
	    collect.setUserId(idb);
	    collect.setClassId(ida);
	    collect.setClasst(classt);
	    collectService.deletebyid(ida, idb, classt);
	    int count = collectService.showcollect(ida,classt);
	    routeService.insertcollect(ida, count);
	    resultMap.put("count",count);
	    resultMap.put("result", "SUCCESS");  
	    return resultMap;
	    }
	}
	
	@RequestMapping(value="collectvillage1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> collectb(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "参数不合法！");  
	        return resultMap;  
	    }  
	    //xxx逻辑处理  
	    else{
	    Collect collect = new Collect();
	    collect.setUserId(idb);
	    collect.setClassId(ida);
	    collect.setClasst(classt);
	    collectService.deletebyid(ida, idb, classt);
	    int count = collectService.showcollect(ida,classt);
	    villageService.insertcollect(ida, count);
	    resultMap.put("count",count);
	    resultMap.put("result", "SUCCESS");  
	    return resultMap;
	    }
	}
	
	@RequestMapping(value="collect1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  Map<String,Object> collect3(int ida,int idb,String classt){
		Map<String,Object> resultMap = new HashMap<String, Object>();  
	    if(ida ==0 || idb == 0 || classt == null){  
	        resultMap.put("result", "未进行点赞");  
	        return resultMap; 
	        
	    }  
	    //xxx逻辑处理  
	    else{
	    int count =collectService.showcollectnum(ida,idb,classt);
	    System.out.print(count);
	    if(count==0){
	    	resultMap.put("result", "未进行点赞");  
	        return resultMap;  
	    	
	    }
	    else{
	    	resultMap.put("result", "SUCCESS");  
		    return resultMap;  
	    }
	    }
	}
}