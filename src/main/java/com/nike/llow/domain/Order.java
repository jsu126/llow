package com.nike.llow.domain;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @author Stodger
 * @version V1.0
 * @date 2019-08-06 08:31
 */
@Entity
@Getter
@Setter
@EqualsAndHashCode
public class Order {
	/**
     * 订单Id
     */
    private int orderId;
    /**
     * 用户Id
     */
    private String userId;
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
    private Timestamp orderTime;
    /**
     * 支付时间
     */
    private Timestamp payTime;
    /**
     * 发货时间
     */
    private Timestamp sendTime;
    /**
     * 完成时间
     */
    private Timestamp finishTime;
    /**
     * 状态 0待支付 1待发货 2待收货 3待评价 4交易成功
     */
    private Integer status;
}
