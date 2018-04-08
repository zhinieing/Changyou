package cn.it.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import cn.it.dao.PageDao;
import cn.it.model.Comment;
import cn.it.model.Hotel;
import cn.it.model.Order;
import cn.it.model.Page;
import cn.it.model.Route;
import cn.it.model.Spot;
import cn.it.model.Travels;
import cn.it.model.Village;
import cn.it.service.PageService;
@Service("pageService")
public class PageServiceImpl implements PageService {
	@Autowired
    private PageDao pageDao;
	 
	public void showProductsByPage(HttpServletRequest request, Model model,String villageSeason,String villageSpecial) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  

	  
	    List<Village> products = new ArrayList<Village>();  
	    System.out.println(pageDao.getProductsCount(villageSeason,villageSpecial));
	    int totalCount = pageDao.getProductsCount(villageSeason,villageSpecial);  
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectProductsByPage(page.getStartPos(), page.getPageSize(),villageSeason,villageSpecial);  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectProductsByPage(page.getStartPos(), page.getPageSize(),villageSeason,villageSpecial);  
	    }  
	    model.addAttribute("villageSeason", villageSeason.substring(1, villageSeason.length()-1));  
	    System.out.println(villageSeason.substring(1, villageSeason.length()-1));
	    model.addAttribute("villageSpecial", villageSpecial.substring(1, villageSpecial.length()-1));  
	    System.out.println(villageSpecial.substring(1, villageSpecial.length()-1));
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	} 
	
	public void showRouteByPage(HttpServletRequest request, Model model) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  

	  
	    List<Route> products = new ArrayList<Route>();  
	    System.out.println("1111111");
	    System.out.println(pageDao.getRouteCount());
	    int totalCount = pageDao.getRouteCount();  
	    System.out.println("2222222");
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectRouteByPage(page.getStartPos(), page.getPageSize());  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectRouteByPage(page.getStartPos(), page.getPageSize());  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	} 
	
	public void showTravelsByPage(HttpServletRequest request, Model model) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  

	  
	    List<Travels> products = new ArrayList<Travels>();  
	    System.out.println("1111111");
	    System.out.println(pageDao.getTravelsCount());
	    int totalCount = pageDao.getTravelsCount();  
	    System.out.println("2222222");
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectTravelsByPage(page.getStartPos(), page.getPageSize());  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectTravelsByPage(page.getStartPos(), page.getPageSize());  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	}
	
	public void showTravelstitleByPage(HttpServletRequest request, Model model,String title,String sel) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  
	    String select = null;

	    	

	  
	    List<Travels> products = new ArrayList<Travels>();  
	    System.out.println("1111111");
	    System.out.println(pageDao.getTravelstitleCount(title));
	    int totalCount = pageDao.getTravelstitleCount(title);  
	    System.out.println(select);
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));
		    if(sel.equals("a")){
	        products = this.pageDao.selectTravelstitleByPage1(page.getStartPos(), page.getPageSize(),title); 
		    }else if(sel.equals("b")){
		    	products = this.pageDao.selectTravelstitleByPage2(page.getStartPos(), page.getPageSize(),title);
		    }else if(sel.equals("c")){
		    	products = this.pageDao.selectTravelstitleByPage3(page.getStartPos(), page.getPageSize(),title);
		    }else if(sel.equals("d")){
		    	products = this.pageDao.selectTravelstitleByPage4(page.getStartPos(), page.getPageSize(),title);
		    }
		    
	    } else {  
	        page = new Page(totalCount, 1);  
	        if(sel.equals("a")){
		        products = this.pageDao.selectTravelstitleByPage1(page.getStartPos(), page.getPageSize(),title); 
			    }else if(sel.equals("b")){
			    	products = this.pageDao.selectTravelstitleByPage2(page.getStartPos(), page.getPageSize(),title);
			    }else if(sel.equals("c")){
			    	products = this.pageDao.selectTravelstitleByPage3(page.getStartPos(), page.getPageSize(),title);
			    }else if(sel.equals("d")){
			    	products = this.pageDao.selectTravelstitleByPage4(page.getStartPos(), page.getPageSize(),title);
			    }
	    }  
	    model.addAttribute("select",sel );
	    model.addAttribute("title", title.substring(1, title.length()-1));  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	}
	
	public void showComment1ByPage(HttpServletRequest request, Model model) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  

	  
	    List<Comment> products = new ArrayList<Comment>();  
	    System.out.println("1111111");
	    System.out.println(pageDao.getComment1Count());
	    int totalCount = pageDao.getComment1Count();  
	    System.out.println("2222222");
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectComment1ByPage(page.getStartPos(), page.getPageSize());  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectComment1ByPage(page.getStartPos(), page.getPageSize());  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	}
	
	public void showCommentByPage(HttpServletRequest request, Model model,int referId) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  

	  
	    List<Comment> products = new ArrayList<Comment>();  
	    System.out.println("1111111");
	    System.out.println(pageDao.getCommentCount(referId));
	    int totalCount = pageDao.getCommentCount(referId);  
	    System.out.println("2222222");
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectCommentByPage(page.getStartPos(), page.getPageSize(),referId);  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectCommentByPage(page.getStartPos(), page.getPageSize(),referId);  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	} 
	public void showind1ByPage(HttpServletRequest request, Model model,int userId,String classt) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  

	  
	    List<Village> products = new ArrayList<Village>();  
	    System.out.println("1111111");
	    System.out.println(pageDao.getind1Count(userId,classt));
	    int totalCount = pageDao.getind1Count(userId,classt);  
	    System.out.println("2222222");
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectind1ByPage(page.getStartPos(), page.getPageSize(),userId,classt);  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectind1ByPage(page.getStartPos(), page.getPageSize(),userId,classt);  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	} 
	
	public void showind2ByPage(HttpServletRequest request, Model model,int userId,String classt) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  

	  
	    List<Route> products = new ArrayList<Route>();  
	    System.out.println("1111111");
	    System.out.println(pageDao.getind2Count(userId,classt));
	    int totalCount = pageDao.getind2Count(userId,classt);  
	    System.out.println("2222222");
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectind2ByPage(page.getStartPos(), page.getPageSize(),userId,classt);  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectind2ByPage(page.getStartPos(), page.getPageSize(),userId,classt);  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	} 
	
	public void showind3ByPage(HttpServletRequest request, Model model,String writer) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  

	  
	    List<Travels> products = new ArrayList<Travels>();  
	    System.out.println("1111111");
	    int totalCount = pageDao.getind3Count(writer);  
	    System.out.println("2222222");
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectind3ByPage(page.getStartPos(), page.getPageSize(),writer);  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectind3ByPage(page.getStartPos(), page.getPageSize(),writer);  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	} 
	
	public void showind4ByPage(HttpServletRequest request, Model model,String writer) {  
	    String pageNow = request.getParameter("pageNow");  
	  
	    Page page = null;  

	  
	    List<Route> products = new ArrayList<Route>();  
	    System.out.println("1111111");
	    int totalCount = pageDao.getind4Count(writer);  
	    System.out.println("2222222");
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectind4ByPage(page.getStartPos(), page.getPageSize(),writer);  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectind4ByPage(page.getStartPos(), page.getPageSize(),writer);  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	} 
	
	
	@Override
	public void showHotelByPage(HttpServletRequest request, Model model) {
		String pageNow = request.getParameter("pageNow");  
		  
	    Page page = null;  

	  
	    List<Hotel> products = new ArrayList<Hotel>();  
	    int totalCount = pageDao.getHotelCount();
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectHotelByPage(page.getStartPos(), page.getPageSize());  
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectHotelByPage(page.getStartPos(), page.getPageSize());  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	}
	@Override
	public void showHotelSearchByPage(HttpServletRequest request, Model model,String theme, Date inDate, Date outDate, String hotelName) {
		// TODO Auto-generated method stub
		String pageNow = request.getParameter("pageNow");  
		  
	    Page page = null;  

	  
	    List<Hotel> products = new ArrayList<Hotel>();  

	    int totalCount = pageDao.getHotelSearchCount(theme, inDate, outDate, hotelName);
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        products = this.pageDao.selectHotelSearchByPage(page.getStartPos(), page.getPageSize(), theme, inDate, outDate, hotelName); 
	    } else {  
	        page = new Page(totalCount, 1);  
	        products = this.pageDao.selectHotelSearchByPage(page.getStartPos(), page.getPageSize(), theme, inDate, outDate, hotelName);
	    }  
	    model.addAttribute("theme",theme.substring(1, theme.length()-1));
	    model.addAttribute("inDate",inDate);
	    model.addAttribute("outDate",outDate);
	    model.addAttribute("hotelName",hotelName.substring(1, hotelName.length()-1));
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	}

	
	@Override
	public void showSpotByPage(HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String pageNow = request.getParameter("pageNow");  
		  
	    Page page = null;  
        
	  
	    List<Spot> products = new ArrayList<Spot>();  
	    int totalCount = pageDao.getSpotCount();
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow));  
	        page.setPageSize(10);
	        products = this.pageDao.selectSpotByPage(page.getStartPos(), page.getPageSize());  
	    } else {  
	        page = new Page(totalCount, 1);  
	        page.setPageSize(10);
	        products = this.pageDao.selectSpotByPage(page.getStartPos(), page.getPageSize());  
	    }  
	  
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page); 
	}

	
	@Override
	public void showSpotSearchByPage(HttpServletRequest request, Model model,
			String theme, String spotName) {
		// TODO Auto-generated method stub
		String pageNow = request.getParameter("pageNow");  
		  
	    Page page = null;  
	    
	  
	    List<Spot> products = new ArrayList<Spot>();  

	    int totalCount = pageDao.getSpotSearchCount(theme,spotName);
	    if (pageNow != null) {  
	        page = new Page(totalCount, Integer.parseInt(pageNow)); 
	        page.setPageSize(10);
	        products = this.pageDao.selectSpotSearchByPage(page.getStartPos(), page.getPageSize(), theme, spotName);
	    } else {  
	        page = new Page(totalCount, 1);  
	        page.setPageSize(10);
	        products = this.pageDao.selectSpotSearchByPage(page.getStartPos(), page.getPageSize(), theme, spotName);
	    }  
	    model.addAttribute("theme",theme.substring(1, theme.length()-1));
	    model.addAttribute("spotName",spotName.substring(1, spotName.length()-1));
	    model.addAttribute("products", products);  
	    model.addAttribute("page", page);  
	}

	@Override
	public void showind5ByPage(HttpServletRequest request, Model model, int id) {
		// TODO Auto-generated method stub
		 String pageNow = request.getParameter("pageNow");  
		  
		    Page page = null;  

		  
		    List<Order> products = new ArrayList<Order>();  
		    System.out.println("1111111");
		    int totalCount = pageDao.getind5Count(id);  
		    System.out.println("2222222");
		    if (pageNow != null) {  
		        page = new Page(totalCount, Integer.parseInt(pageNow));  
		        products = this.pageDao.selectind5ByPage(page.getStartPos(), page.getPageSize(),id);  
		    } else {  
		        page = new Page(totalCount, 1);  
		        products = this.pageDao.selectind5ByPage(page.getStartPos(), page.getPageSize(),id);  
		    }  
		  
		    model.addAttribute("products", products);  
		    model.addAttribute("page", page); 
	}
	
	@Override
	public void showind6ByPage(HttpServletRequest request, Model model, int id) {
		// TODO Auto-generated method stub
		 String pageNow = request.getParameter("pageNow");  
		  
		    Page page = null;  

		  
		    List<Order> products = new ArrayList<Order>();  
		    System.out.println("1111111");
		    int totalCount = pageDao.getind6Count(id);  
		    System.out.println("2222222");
		    if (pageNow != null) {  
		        page = new Page(totalCount, Integer.parseInt(pageNow));  
		        products = this.pageDao.selectind6ByPage(page.getStartPos(), page.getPageSize(),id);  
		    } else {  
		        page = new Page(totalCount, 1);  
		        products = this.pageDao.selectind6ByPage(page.getStartPos(), page.getPageSize(),id);  
		    }  
		  
		    model.addAttribute("products", products);  
		    model.addAttribute("page", page); 
	}


}
