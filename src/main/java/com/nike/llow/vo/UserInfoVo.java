package com.nike.llow.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserInfoVo {

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
     * 安全分数
     */
    private Integer score;

	@Override
	public String toString() {
		return "UserInfoVo [userId=" + userId + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", picture=" + picture + ", sex=" + sex + ", age=" + age + ", city=" + city
				+ ", birthday=" + birthday + ", score=" + score + "]";
	}
    

	
    
    

}
