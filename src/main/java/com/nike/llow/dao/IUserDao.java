package com.nike.llow.dao;

import java.util.List;

import com.nike.llow.domain.Address;
import com.nike.llow.domain.Certification;
import com.nike.llow.domain.Collection;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Standard;
import com.nike.llow.domain.User;

/**
 * @author Stodger
 * @date 2019年8月6日
 * @version
 */
public interface IUserDao {
	
	
	/**
	 * 判断邮箱是否已经存在
	 * @param email
	 */
    int emailRegisterFont(String email);
	
	/**
	 * 查询用户信息
	 * @param userId
	 * @return
	 */
	User getUser(String userId);

	/**
	 * 更新用户
	 * @param resultUser
	 */
	void updateUser(User resultUser);

	/**
	 * 保存用户
	 * @param user
	 */
	void saveUser(User user);

	/**
	 * 保存实名信息
	 * @param certification
	 */
	void saveCertification(Certification certification);

	/**
	 * 更新密码
	 * @param userId
	 * @return
	 */
	Certification findCertification(String userId,int status);

	/**
	 * 更新认证
	 * @param certification
	 */
	void updateCertification(Certification certification);
	/**
	 * 保存email注册的用户
	 * @param user
	 */
	public void saveEmaiRegister(User user);
	/**
	 * 判断电话是否存在
	 * @param phone
	 * @return
	 */
	int phoneRegisterFont(String phone);

	/**
	 * 保存电话注册的用户
	 * @param user
	 */
	void savePhoneRegister(User user);

	/**
	 * 判断用户是否能登录
	 * @param user
	 * @return
	 */
	User checkLogin(User user);

	

	/**通过user查找用户信息
	 * （修改绑定的手机）
	 * @param user
	 * @return
	 */
	User getByUser(User user);
	/**
	 * 绑定新手机
	 * @param user
	 */
	void updateNewPhone(User user);
	

	/**
	 * 绑定新邮箱
	 * @param user
	 */
	void updateEmail(User user);
	
	/**
	 * 新手机是否已被绑定
	 * @param phone
	 * @return
	 */
	User getNewPhone(String phone);
	/**
	 * 新邮箱是否已被绑定
	 * @param phone
	 * @return
	 */
	User getNewEmail(String email);
	
	
	/**
	 * 获取收货地址
	 * @param userId
	 * @return
	 */
	/*List<Address> listAddress(String userId);*/

	/**
	 * 保存新的收货地址
	 * @param address
	 */
	/*void saveAddress(Address address);*/

	/**
	 * 用户总数量
	 * @return
	 */
	Long countUser();

	/**
	 * 性别总数
	 * @return
	 */
	Long countMale(String sex);
	/**
	 * 根据用户获取收藏的产品
	 * @param user
	 * @return
	 */
	List<Collection> listCollectionByUser(User user);
	/**
	 * 获取用户收藏的产品
	 * @param userId
	 * @return
	 */
	Product getCProduct(String id);
	
	/**
	 * 获取standard的信息
	 * @param productId
	 * @return
	 */
	Standard getStandardByProductId(String productId);
	/**根据产品id获取收藏信息
	 * @param productId
	 * @return
	 */
	Collection getCollection(String productId,String userId);
	/**根据产品id删除收藏的商品
	 * @param productId
	 */
	void deleteCollection(Collection collection);

	/**判断手机是否被绑定
	 * @param newPhone
	 * @return
	 */
	User hasPhone(String newPhone);

	/**绑定手机号
	 * @param user
	 */
	void updateBindPhone(User user);
	
	/**
	 * 獲得當前的用戶
	 * @param userId
	 * @param md5EnCode
	 * @return
	 */
	User getModifyUser(String userId, String md5EnCode);
	

	/**
	 * 更新用戶的密碼
	 * @param user
	 */
	void updateModifyPassword(User user);

	

}


