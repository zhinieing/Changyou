package cn.it.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.it.dao.OrderDao;
import cn.it.model.Order;
import cn.it.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao orderDao;
	@Override
	public void insertOrder(Order o) {
		// TODO Auto-generated method stub
       orderDao.OrderAdd(o);

	}
	@Override
	public void insertdelOrder(int id, int del) {
		// TODO Auto-generated method stub
		orderDao.OrderdelAdd(id,del);
	}
	@Override
	public void deleteOrder(int id) {
		// TODO Auto-generated method stub
		orderDao.deletebyid(id);
		
	}
	@Override
	public Order findbyid(int id) {
		// TODO Auto-generated method stub
		Order order=orderDao.findbyid(id);
		return order;
	}

}
