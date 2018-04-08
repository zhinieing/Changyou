package cn.it.controller;

import java.util.HashMap;
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

import cn.it.model.Comment;
import cn.it.model.User;
import cn.it.service.CommentService;
import cn.it.service.TravelsService;

@Controller
@SessionAttributes("userses")
public class CommentController {
	@Autowired
	private CommentService commentService;
	@Autowired
	private TravelsService travelsService;
//上传评论
	
	@RequestMapping(value="commentsubmit.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView register(@RequestParam("comment") String content,@RequestParam("referId") int referId, ModelMap model,HttpSession httpSession ){
		ModelAndView modelAndView=new ModelAndView();
		User user = (User)httpSession.getAttribute("userses");
		Comment comment = new Comment();
		comment.setReferId(referId);
		comment.setContent(content);
		System.out.print(user.getImage());
		comment.setImg(user.getImage());
		comment.setWriter(user.getNickname());
        commentService.insertcomment(comment);
        int a=commentService.findcount(referId);
        travelsService.insertComment(referId, a);
		modelAndView.setViewName("redirect:detail.do?id="+referId);
        	  

		   return modelAndView;
	}
	
	@RequestMapping(value="commentexam1.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> commentexam1(int id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
        commentService.insertdel(id,2);
        int a = commentService.findrefer(id);
        int b=commentService.findcount(a);
        travelsService.insertComment(a, b);
        resultMap.put("result","SUCCESS");
		   return resultMap;
	}
	
	@RequestMapping(value="commentexam2.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> commentexam2(int id){
		Map<String,Object> resultMap = new HashMap<String, Object>();
        commentService.insertdel(id,1);
        int a = commentService.findrefer(id);
        int b=commentService.findcount(a);
        travelsService.insertComment(a, b);
        resultMap.put("result","SUCCESS");
		   return resultMap;
	}

}
