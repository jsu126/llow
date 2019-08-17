package com.nike.llow.service;

import java.util.List;

import com.nike.llow.domain.Order;
import com.nike.llow.domain.OrderDetail;
import com.nike.llow.vo.OrderInfoVo;
import com.nike.llow.vo.OrderVo;

/**
 * @author Stodger
 * @date 2019年8月10日
 * @version
 */
public interface IOrderService {
	
	/**
	 * 查询所有订单
	 * @return
	 */
	List<OrderInfoVo> findAllList();

	/**
	 * 查询订单详情
	 * @param orderId
	 * @return
	 */
	OrderInfoVo findByOrderDetail(Integer orderId);

	/**
	 * 订单发货
	 * @param orderId
	 */
	void updateOrder(Integer orderId);

	/**
	 * 订单总数
	 * @return
	 */
	Long countOrder();
	
	/**
	 * 根据用户id获取该用户所有的order
	 * @param userId
	 * @return
	 */
	List<Order> listOrder(String userId);
	

	/**
	 * 下订单
	 * @param shopCartIds
	 * @param userId
	 */
	OrderVo saveOrder(String shopCartIds,String userId);
	
	/**
	 * 获取待评价的数据
	 * @param orerList
	 * @return
	 */
//	List<OrderInfoVo> getUnValuedList(List<Order> orerList);
	
	/**获取order页面的所有信息
	 * @param orerList
	 * @return
	 */
	List<OrderInfoVo> getOrderInfoVoList(List<Order> orderList);

	/**
	 * 更新订单
	 * @param orderNumber
	 * @param addressId
	 */
	void updateOrder(String orderNumber, Integer addressId);
	

	
	
	/**
	 * 获取没有评价的orderDetail
	 * @param orderId
	 * @return
	 */
	List<OrderDetail> listOrderDetailList(int orderId);
	
	
	
	/**
	 * 评论商品
	 * @param orderIdC
	 * @param productIds
	 * @param standardNames
	 * @param commentNums
	 * @param commentContents
	 */
	void saveComment(String userId,Integer orderIdC,List<String> productIds,List<String> standardNames,List<Integer> commentNums,List<String> commentContents);

	/**
	 * 确认收货
	 * @param orderId
	 */
	void updateOrderReceipt(int orderId);
	/**
	 * 查找指定订单
	 * @param searchStartTime
	 * @param searchEndTime
	 * @param searchOrderStatus
	 * @return
	 */
	List<OrderInfoVo> findOrderSearchList(String searchStartTime,String searchEndTime,String searchOrderStatus);

	/**
	 * 更新收货地址
	 * @param orderNumber
	 * @param addressId
	 */
	void updateOrderAddress(String orderNumber, Integer addressId);

}
