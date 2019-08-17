package com.nike.llow.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nike.llow.service.IOrderService;
import com.nike.llow.vo.OrderInfoVo;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class OrderManageAction extends ActionSupport{
	
	
	private Integer orderId;
	private List<OrderInfoVo> orderInfoVoList;
	private OrderInfoVo orderInfoVo;
	private String result;
	private Long count;
	
	private String searchStartTime;
	private String searchEndTime;
	private String searchOrderStatus;
	
	@Autowired
	private IOrderService iOrderService;
	
	/**
	 * 订单列表
	 * @return
	 */
	public String orderList() {
		orderInfoVoList = iOrderService.findAllList();
		System.out.println();
		return "list";
	}
	/**
	 * 订单详细信息
	 * @return
	 */
	public String orderInfo() {
		orderInfoVo = iOrderService.findByOrderDetail(orderId);
		return "orderDetail";
	}
	
	/**
	 * 订单发货
	 * @return
	 */
	public String orderSend() {
		iOrderService.updateOrder(orderId);
		result = "";
		return "orderSend";
	}
	
	/**
	 * 订单总数
	 * @return
	 */
	public String orderCount() {
		count = iOrderService.countOrder();
		return "success";
	}

	public String orderSearch(){
		//orderInfoVoList=null;
		System.out.println(searchStartTime+"开始时间"+searchEndTime+"结束时间"+searchOrderStatus+"订单状态");
		orderInfoVoList = iOrderService.findOrderSearchList(searchStartTime, searchEndTime, searchOrderStatus);
		return SUCCESS;
	}
}
