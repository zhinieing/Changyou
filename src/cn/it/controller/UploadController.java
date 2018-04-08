package cn.it.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Route;
import cn.it.model.User;
import cn.it.model.Hotel;
import cn.it.service.HotelService;
import cn.it.service.RouteService;
import cn.it.service.UserService;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
@Controller
@SessionAttributes("userses")
public class UploadController {
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private UserService userService;
    @Autowired
    private RouteService routeService;
    @Autowired
    private HotelService hotelService;
    /**
     * 上传单个文件的页面
     * @return 页面的路径
     */
//    @RequestMapping(value = "/upload-file", method = RequestMethod.GET)
//    public String uploadFilePage() {
//        return "upload-file.jsp";
//    }
    /**
     * 上传单个文件
     *
     * @param file 上传文件 MultipartFile 的对象
     * @return 上传的结果
     */
    @RequestMapping(value = "upload.do", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadFile(@RequestParam("file") MultipartFile file,HttpSession httpSession) {
    	String path = servletContext.getRealPath("") +"/pic" +File.separator + file.getOriginalFilename();	
    	ModelAndView modelAndView=new ModelAndView();
    	if (!file.isEmpty()) {
        
        try {
        	
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(path));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.print("111111111111");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.print("2222222222");
		}
		User user = (User)httpSession.getAttribute("userses");
	   	String paths ="/pic"+File.separator + file.getOriginalFilename();
	   	user.setImage(paths);
		userService.insertuserimage(user);
		System.out.print(user.getImage());
	    modelAndView.addObject("mess", "上传成功！");
    	}
    	else{modelAndView.addObject("mess", "上传失败！");}
	   modelAndView.setViewName("redirect:individual1.do?func=a");
        return modelAndView;
    }
    
    @RequestMapping(value = "upload1.do",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public ModelAndView uploadFile1(@RequestParam("id") int id,@RequestParam("file") MultipartFile file,HttpSession httpSession,ModelMap model, HttpSession request) {
    	String path = servletContext.getRealPath("") +"/route" +File.separator + file.getOriginalFilename();	
    	ModelAndView modelAndView=new ModelAndView();
    	if (!file.isEmpty()) {
        
        try {
        	
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(path));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.print("111111111111");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.print("2222222222");
		}
		
	   	String paths ="/route"+File.separator + file.getOriginalFilename();
	   	System.out.print(id);
	   	routeService.insertimg(id, paths);
	   	Route route=routeService.showroute(id);
	   	model.addAttribute("route", route); 
		request.setAttribute("route", route);
    	}
	   modelAndView.setViewName("routesubmit2");
        return modelAndView;
    }
    
    
    @RequestMapping(value = "upload2.do",method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public ModelAndView uploadFile2(@RequestParam("hotelName") String hotelName,@RequestParam("issue") String issue,@RequestParam("address") String address,@RequestParam("theme") String theme,@RequestParam("pos") String pos,@RequestParam("tel") String tel,@RequestParam("introduce") String introduce,@RequestParam("file") MultipartFile[] file,@RequestParam("villageTitle") String villageTitle,HttpSession httpSession,ModelMap model,HttpSession request){
    	  System.out.println("11111");
    	  System.out.println(file);
    	  ModelAndView modelAndView=new ModelAndView();
    	Hotel hotel=new Hotel();
    	hotel.setHotelName(hotelName);
    	hotel.setAddress(address);
    	hotel.setTheme(theme);
    	hotel.setPos(pos);
    	hotel.setTel(tel);
    	hotel.setIssue(issue);
    	User user = (User)httpSession.getAttribute("userses");
    	hotel.setUserId(user.getId());
    	hotel.setVillageTitle(villageTitle);
    	hotel.setIntroduce(introduce);
    	String path1 ="./"+"/pic"+File.separator + file[0].getOriginalFilename();
    	  System.out.println(file[0]);
    	  System.out.println(File.separator);
    	  System.out.println(file[0].getOriginalFilename());
    	  System.out.println(path1);
    	hotel.setImage(path1);
    	String path2=null;
    	for (MultipartFile mf : file) {  
    	String path = servletContext.getRealPath("") +"/pic" +File.separator + mf.getOriginalFilename();
    	if(path2!=null){
    	path2=path2+"./"+"/pic"+"/"  + mf.getOriginalFilename()+";";
    	}else{
    		path2="./"+"/pic"+"/"  + mf.getOriginalFilename()+";";
    	}
    	  System.out.println(path);
    	  System.out.println(path2);
    	
    	if (!mf.isEmpty()) {
        
        try {
        	
			FileCopyUtils.copy(mf.getInputStream(), new FileOutputStream(path));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.print("111111111111");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.print("2222222222");
		}
    	}
    	}
    	String path3=path2.substring(0,path2.length()-1);
        hotel.setPhoto(path3);
	   hotelService.insertHotel(hotel);
	   modelAndView.setViewName("redirect:hotelexam.do");
        return modelAndView;
    }
    
    
}
    