package cn.it.test;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.it.dao.PageDao;
import cn.it.dao.PointgoodDao;
import cn.it.dao.TravelsDao;
import cn.it.dao.UserDao;
import cn.it.model.Travels;
import cn.it.model.User;
import cn.it.service.PointgoodService;
import cn.it.service.TravelsService;
import cn.it.service.UserService;


public class TestDataSource {
  
	@Test
	public void Test1(){
		
		ApplicationContext ac=new ClassPathXmlApplicationContext("bean.xml");
		DataSource dataSource=(DataSource) ac.getBean("dataSource");
		System.out.println("dataSource:"+dataSource.toString());
		
	}
	
	@Test
	public void Test2(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("bean.xml");
		System.out.println("show:"+ac.getBean("sqlSessionFactory"));
		
	}

	@Test
	public void Test3(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		UserDao userDao=  (UserDao) ac.getBean("userDao");
		System.out.println(userDao.toString());
	}
	
	@Test
	public void Test4(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		TravelsDao travelsDao=  (TravelsDao) ac.getBean("travelsDao");
		Travels travels=travelsDao.findbyId(20);
		String str =travels.getTravelsContent();
        Matcher m1 = Pattern.compile("([\u4e00-\u9fa5]+)").matcher(str);
		Matcher m2 = Pattern.compile("<img.+?src=\"(.+?)\".+?/?>").matcher(str);
	    while(m1.find()){
	        System.out.println(m1.group(1));
	        break;
	    }	
	    while(m2.find()){
	        System.out.println(m2.group(1));
	        break;
	    }	
	}
	
	@Test
	public void Test5(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("bean.xml");//初始化容器
		PointgoodService pointgoodService=  (PointgoodService) ac.getBean("pointgoodService");
		int a  = pointgoodService.showpointgood(1,"village");
		System.out.println(a);
	}
}


