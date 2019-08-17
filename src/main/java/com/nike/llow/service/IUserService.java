package com.nike.llow.service;


import java.io.File;
import java.util.List;

import com.nike.llow.domain.Address;
import com.nike.llow.domain.Certification;
import com.nike.llow.domain.Collection;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Standard;
import com.nike.llow.domain.User;

import com.nike.llow.vo.ResponseResult;

import com.nike.llow.vo.UserInfoVo;


/**
 * @author Stodger
 * @date 2019年8月6日
 * @version
 */
public interface IUserService {

	/**
	 * 验证邮箱是否已经存在 
	 * @param email
	 */
	public int emailRegisterFont(String email);

	/**
	 * 保存email注册的用户 
	 * @param user
	 */
	public void saveEmaiRegister(User user);
	
	/**
	 * 验证邮箱是否已经存在 
	 * @param email
	 */
	public int phoneRegisterFont(String phone);
	
	/**
	 * 保存email注册的用户 
	 * @param user
	 */
	public void savePhoneRegister(User user);
	
	/**
	 * 更新头像
	 * @param user
	 * @param picture
	 */
	void updateUserPicture(User user, String picture);
	
	/**
	 * 保存用户
	 * @param user
	 */
	void saveUser(User user);

	/**
	 * 发送验证码
	 * @param target
	 */
	public void sendCode(UserInfoVo target,int codeNumber);

	/**
	  * 判断用户是否能登录
	 * @param user
	 * @return
	 */
	public UserInfoVo checkLogin(User user);

	
	/**
	 * 更新用户信息
	 * @param userId
	 * @param loginUser
	 * @return
	 */
	UserInfoVo updateUser(String userId, User user);

	/**
	 * 通过user查找用户信息
	 * （修改绑定的手机）
	 * @param user
	 * @return
	 */
	User getByUser(User user);

	/**
	 * 验证第一个验证码是否正确和该号码是否已经被绑定
	 * @param user
	 * @param usercode
	 * @param oldCode
	 */
	ResponseResult getNewPhone(User user,Integer usercode,Integer oldCode);
	/**验证第二个验证码是否正确
	 * 更改绑定的手机
	 * @param user
	 * @param usercode
	 * @param oldCode
	 * @return
	 */
	ResponseResult updateNewPhone(User user,Integer usercode,Integer oldCode,String phone);
	/**
	 * 绑定邮箱
	 * @param user
	 */
	ResponseResult updateEmail(User user,Integer usercode,Integer oldCode,String email);

	/**
	 * 保存身份证信息
	 * @param path
	 * @param idCardImage
	 * @param idCardImageFileName
	 * @param userId
	 * @return
	 */
	Certification saveCertification(String path, File[] idCardImage, String[] idCardImageFileName,String userId);


	/**
	 * 更新
	 * @param string
	 * @param realName
	 * @param idCard
	 */
	String updateCertification(String string, String realName, String idCard);

	/**
	 * 用户总数量
	 * @return
	 */
	public Long countUser();

	/**
	 * 男 女总数
	 * @return
	 */
	public List<Long> countGender();
	
	
	
	/**
	 * 获取收藏信息
	 * @param user
	 * @return
	 */
	List<Collection> listCollectionByUser(User user);
	/**
	 * 根据产品Id获取收藏产品信息
	 * @param user
	 * @return
	 */
	Product getCProduct(String id);
	
	 /**
	  * 根据product获取standard的信息
	 * @param product
	 * @return
	 */
	Standard getStandardByProduct(Product product);

	
	/**
	 * 根据产品id获得收藏信息
	 * @param productId
	 * @return
	 */
	Collection getCollection(String productId ,String userId);
	
	/**
	 * 根据产品删除收藏产品
	 * @param productId
	 */
	ResponseResult deleteCProduct(Collection collection);


	/**判断手机是否存在
	 * @param newPhone
	 * @return
	 */
	public User hasPhone(String newPhone);
	
	
	/**判断邮箱是否存在
	 * @param Email
	 * @return
	 */
	public User hasEmail(String oneEmail);

	/**绑定手机
	 * @param newPhone
	 * @return
	 */
	public ResponseResult updateBindPhone(User user,String newPhone,Integer usercode, Integer oldCode);
	


	/**
	 * 获取用户信息
	 * @param userId
	 * @return
	 */
	public UserInfoVo getUser(String userId);

	/**
	 * @param userId
	 */
	public String checkCertification(String userId);



	/**
	 * 保存更新的密码
	 * @param userInfoVo
	 * @param tempUser
	 * @return
	 */
	public Integer updateModifyPassword(UserInfoVo userInfoVo,String oldPassword, String newPassword);

	/**
	 * 保存绑定的手机号码
	 * @param userInfoVo
	 * @param bindPhone
	 */
	public void saveBindPhone(UserInfoVo userInfoVo, String bindPhone);
}
