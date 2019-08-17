package com.nike.llow.vo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.nike.llow.domain.Address;
import com.nike.llow.domain.OrderDetail;
import com.nike.llow.domain.Standard;

import lombok.Data;

@Data
public class OrderInfoVo {
	/**
     * 订单Id
     */
    private int orderId;
    /**
     * 用户名
     */
    private String username;
    /**
     * 地址Id
     */
    private Integer addressId;
    /**
     * 订单编号
     */
    private String orderNumber;
    /**
     * 总价
     */
    private BigDecimal totalPrice;
    /**
     * 下单时间
     */
    private String orderTimeStr;
    /**
     * 支付时间
     */
    private String payTimeStr;
    /**
     * 发货时间
     */
    private String sendTimeStr;
    /**
     * 完成时间
     */
    private String finishTimeStr;
    /**
     * 状态 0待支付 1待发货 2待收货 3完成 4退款
     */
    private Integer status;
    
    private Address address = new Address();
    
    private List<OrderDetail> orderDetailList = new ArrayList<>();
}
