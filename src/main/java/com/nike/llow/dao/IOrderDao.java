package com.nike.llow.dao;

import java.util.List;

import com.nike.llow.domain.Comment;
import com.nike.llow.domain.Order;
import com.nike.llow.domain.OrderDetail;

/**
 * @author Stodger
 * @date 2019年8月10日
 * @version
 */
public interface IOrderDao {

	/**
	 * 查询所有订单
	 * @return
	 */
	List<Order> findAllOrderList();

	/**
	 * 查询订单
	 * @param orderId
	 * @return
	 */
	Order getOrder(Integer orderId);

	/**
	 * 查询订单详情
	 * @param orderId
	 * @return
	 */
	List<OrderDetail> findOrderDetailList(int orderId);

	/**
	 * 发货
	 * @param order
	 */
	void updateOrder(Order order);

	/**
	 * 订单总数
	 * @return
	 */
	Long countOrder();

	/**
	 * 保存订单
	 * @param order
	 */
	void saveOrder(Order order);

	/**
	 * 根据订单编号获取
	 * @param orderNumber
	 * @return
	 */
	Order getOrder(String orderNumber);

	/**
	 * 保存订单详细
	 * @param orderDetail
	 */
	void saveOrderDetail(OrderDetail orderDetail);
	/**
	 * 根据用户id获取该用户的所有订单
	 * @param userId
	 * @return
	 */
	List<Order> listOrder(String userId);

	
	
	/**保存评价
	 * @param userId
	 * @param orderIdC
	 * @param productIds
	 * @param standardNames
	 * @param commentNums
	 * @param commentContents
	 */
	void saveComment(Comment comment);
	
	/**
	 * 查找指定订单
	 * @param searchStartTime
	 * @param searchEndTime
	 * @param searchOrderStatus
	 * @return
	 */
	List<Order> findOrderSearchList(String searchStartTime,String searchEndTime,String searchOrderStatus);

}
