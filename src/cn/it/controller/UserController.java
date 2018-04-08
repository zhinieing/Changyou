package cn.it.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.User;
import cn.it.service.UserService;

@Controller
@SessionAttributes("userses")
public class UserController {
	@Autowired
	private UserService userService;
	
	
	//登入
	@RequestMapping(value="login.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView login(User u, ModelMap model){

		ModelAndView modelAndView=new ModelAndView();

		  User user = userService.findlogin(u);
		  //System.out.println("-----------:"+user.getUsername());
		   if(user == null){
			   modelAndView.addObject("error", "登入失败！");
			   modelAndView.setViewName("redirect:welcome1.do");
		   }else{
			   model.addAttribute("userses",user); 
			   modelAndView.setViewName("redirect:welcome.do");
		   }
		   
		   return modelAndView;
	}
	
	@RequestMapping(value="login1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> login1(String username,String password,HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);	
        User u=userService.findlogin(user);
        if(u == null){
        	 resultMap.put("error", "登入失败！");
			 
		   }else{
			   HttpSession session=request.getSession();
				session.setAttribute("userses",u);
			   resultMap.put("error", "登入成功！");
		   }
        resultMap.put("result","SUCCESS");
		   return resultMap;
	}
	
	//注册
	@RequestMapping(value="register.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView register(User u,@RequestParam("passwordre") String passwordre, ModelMap model ){
		ModelAndView modelAndView=new ModelAndView();
		User user = userService.findusername(u);
		if(user == null)
		{
          if(u.getPassword().equals(passwordre) )
		  {
    
        	  userService.insertuser(u);
	      model.addAttribute("userses",u); 
		  modelAndView.setViewName("redirect:welcome.do");
        	  
		  }
          else{
        	  modelAndView.addObject("error", "注册失败！两次输入密码不一样！");
        	  modelAndView.setViewName("redirect:welcome1.do");
        	  
          }
		}
		else{
		modelAndView.addObject("error", "注册失败！已存在用户！");
      	  modelAndView.setViewName("redirect:welcome1.do");
		}
		   
		   return modelAndView;
	}
	
	
	@RequestMapping(value="register1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> register1(String username,String password,String password1,String nickname,HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);	
		user.setNickname(nickname);	
		User u = userService.findusername(user);
        
		if(u == null)
		{
          if(password.equals(password1) )
		  {
    
        	  userService.insertuser(user);
        	  HttpSession session=request.getSession();
		      session.setAttribute("userses",user);
		      resultMap.put("error", "注册成功！");
        	  
		  }
          else{
        	  resultMap.put("error", "注册失败！两次输入密码不一样！");
        	  
          }
		}
		else{
			resultMap.put("error", "注册失败！已存在用户！");
      	  
		}
        resultMap.put("result","SUCCESS");
		   return resultMap;
	}
	
	//修改
	@RequestMapping(value="imforupdate.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView imforupdate(@RequestParam("nickname") String nickname,@RequestParam("email") String email,@RequestParam("specials") String specials, ModelMap model,HttpSession httpSession){
		ModelAndView modelAndView=new ModelAndView();
		System.out.println(nickname);
		User user = (User)httpSession.getAttribute("userses");
        user.setNickname(nickname);
        user.setEmail(email);
        user.setSpecials(specials);
        userService.insertuserimfor(user);
        modelAndView.setViewName("redirect:individual.do?func=a"); 
		   return modelAndView;
	}
	//登出
	@RequestMapping(value="logout.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView logout( ModelMap model,HttpSession Session,SessionStatus sessionStatus){
		ModelAndView modelAndView=new ModelAndView();
		
		Session.removeAttribute("userses");
		sessionStatus.setComplete(); 
        modelAndView.setViewName("redirect:welcome.do"); 
		   return modelAndView;
	}
	
}
