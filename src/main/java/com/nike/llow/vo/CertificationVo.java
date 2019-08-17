package com.nike.llow.vo;

import lombok.Data;

@Data
public class CertificationVo {
	/**
     * 实名认证Id
     */
    private int certificationId;
    /**
     * 用户名称
     */
    private String username;
    /**
     * 实名姓名
     */
    private String realName;
    /**
     * 身份证号码
     */
    private String idCard;
    /**
     * 民族
     */
    private String nationality;
    /**
     * 地址
     */
    private String address;
    /**
     * 状态
     */
    private Integer status;
}
