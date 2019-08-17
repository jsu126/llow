package com.nike.llow.vo;

import lombok.Data;

/**
 * @author zero
 * @date 2019年8月7日
 * @version
 */
@Data
public class UserVo {

	private String userId;
	private String username;
	private String sex;
	private String birthday;
	private String registerTime;
	private String phone;
	private String email;
	private Integer age;
	private String city;
}
