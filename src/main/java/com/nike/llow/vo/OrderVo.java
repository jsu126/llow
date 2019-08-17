package com.nike.llow.vo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.nike.llow.domain.Address;
import com.nike.llow.domain.OrderDetail;

import lombok.Data;

@Data
public class OrderVo {
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
    private Double totalPrice;
    /**
     * 状态 0待支付 1待发货 2待收货 3完成 4退款
     */
    private Integer status;
    
    private List<Address> addressList = new ArrayList<>();
    
    private List<OrderDetail> orderDetailList = new ArrayList<>();
}
