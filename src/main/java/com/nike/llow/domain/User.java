package com.nike.llow.domain;


import java.util.HashSet;
import java.util.Set;

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
public class User {
	/**
     * 用户Id(自定义生成)
     */
    private String userId;
    /**
     * 用户名
     */
    private String username;
    /**
     * 密码(MD5加密)
     */
    private String password;
    /**
     * 邮箱地址
     */
    private String email;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 头像
     */
    private String picture;
    /**
     * 性别
     */
    private String sex;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 城市
     */
    private String city;
    /**
     * 生日
     */
    private String birthday;
    /**
     * 注册时间
     */
    private String registerTime;
    /**
     * 状态 0删除 1不删除
     */
    private Integer status;
    



	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", picture=" + picture + ", sex=" + sex + ", age=" + age + ", city=" + city
				+ ", birthday=" + birthday + ", registerTime=" + registerTime + ", status=" + status + "]";
	}

    
}
