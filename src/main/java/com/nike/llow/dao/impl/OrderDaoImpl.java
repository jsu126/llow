package com.nike.llow.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nike.llow.dao.IOrderDao;
import com.nike.llow.domain.Comment;
import com.nike.llow.domain.Order;
import com.nike.llow.domain.OrderDetail;
import com.nike.llow.domain.User;

@Repository
public class OrderDaoImpl implements IOrderDao {

	@Autowired
	private HibernateTemplate HibernateTemplate;
	
	@Override
	public List<Order> findAllOrderList() {
		String hql = "from Order";
		List<Order> orderList = (List<Order>)this.HibernateTemplate.find(hql);
		return orderList;
	}

	@Override
	public Order getOrder(Integer orderId) {
		return this.HibernateTemplate.get(Order.class, orderId);
	}

	@Override
	public List<OrderDetail> findOrderDetailList(int orderId) {
		String hql = "from OrderDetail where orderId=?0";
		return (List<OrderDetail>)this.HibernateTemplate.find(hql, orderId);
	}

	@Override
	public void updateOrder(Order order) {
		this.HibernateTemplate.update(order);
	}

	@Override
	public Long countOrder() {
		String hql = "select count(*) from Order";
		List list = (List)this.HibernateTemplate.find(hql);
		return list.size() > 0 ? (Long)list.get(0) : 0;
	}

	@Override
	public void saveOrder(Order order) {
		this.HibernateTemplate.save(order);
	}

	@Override
	public Order getOrder(String orderNumber) {
		String hql = "from Order where orderNumber=?0";
		List<Order> orderList = (List<Order>)this.HibernateTemplate.find(hql, orderNumber);
		return orderList.size() > 0 ? orderList.get(0) : null;
	}

	@Override
	public void saveOrderDetail(OrderDetail orderDetail) {
		this.HibernateTemplate.save(orderDetail);
	}

	@Override
	public List<Order> listOrder(String userId) {
		String hql = "from Order where userId=?0";
		return (List<Order>)this.HibernateTemplate.find(hql, userId);
	}


	@Override
	public void saveComment(Comment comment) {
		this.HibernateTemplate.save(comment);
		
	}

	@Override
	public List<Order> findOrderSearchList(String searchStartTime, String searchEndTime, String searchOrderStatus) {
		String hql = "from Order where 1=1 ";
		if("0".equals(searchOrderStatus)){
			hql += "and status = "+ searchOrderStatus ;
			System.out.println("我是0——————————————————————————————》》》");
			if(!"".equals(searchStartTime)){
			hql += "and orderTime >= "+ "'"+searchStartTime +"'";
			}
			if(!"".equals(searchEndTime)){
			hql += "and orderTime <= "+ "'"+searchEndTime+"'";
			}

		}if("1".equals(searchOrderStatus)){
			hql += "and status = "+ searchOrderStatus ;
			System.out.println("我是1——————————————————————————————》》》");
			if(!"".equals(searchStartTime)){
			hql += "and payTime >= "+ "'"+searchStartTime +"'";
			}
			if(!"".equals(searchEndTime)){
			hql += "and payTime <= "+ "'"+searchEndTime+"'";
			}

		}if("2".equals(searchOrderStatus)){
			hql += "and status = "+ searchOrderStatus ;
			System.out.println("我是2——————————————————————————————》》》");
			if(!"".equals(searchStartTime)){
			hql += "and sendTime >= "+ "'"+searchStartTime +"'";
			}
			if(!"".equals(searchEndTime)){
			hql += "and sendTime <= "+ "'"+searchEndTime+"'";
			}

		}if("3".equals(searchOrderStatus)){
			hql += "and status = "+ searchOrderStatus ;
			System.out.println("我是3——————————————————————————————》》》");
			if(!"".equals(searchStartTime)){
			hql += "and finishTime >= "+ "'"+searchStartTime +"'";
			}
			if(!"".equals(searchEndTime)){
			hql += "and finishTime <= "+ "'"+searchEndTime+"'";
			}

		}if("-1".equals(searchOrderStatus)){
			if(!"".equals(searchStartTime)){
			hql += "and finishTime >= "+ "'"+searchStartTime +"'";
			}
			if(!"".equals(searchEndTime)){
			hql += "and finishTime <= "+ "'"+searchEndTime+"'";
			}

		}
		
	
		return (List<Order>)this.HibernateTemplate.find(hql);
	}

	


	
	
}
