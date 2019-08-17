package com.nike.llow.domain;


import javax.persistence.Entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @author Stodger
 * @version V1.0
 * @date 2019-08-06 08:30
 */
@Entity
@Getter
@Setter
@EqualsAndHashCode
public class Address {
	/**
	 * 地址Id
	 */
    private int addressId;
    /**
     * 用户Id
     */
    private String userId;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 收货人
     */
    private String consingee;
    /**
     * 省份
     */
    private String provide;
    /**
     * 城市
     */
    private String city;
    /**
     * 区域
     */
    private String region;
    /**
     * 详细地址
     */
    private String detailAddress;
    /**
     * 状态
     */
    private int status;
	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", userId=" + userId + ", phone=" + phone + ", consingee="
				+ consingee + ", provide=" + provide + ", city=" + city + ", region=" + region + ", detailAddress="
				+ detailAddress + ", status=" + status + "]";
	}
    
    
    
}
