package com.nike.llow.dao;

import java.util.List;

import com.nike.llow.domain.Address;
import com.nike.llow.domain.Certification;
import com.nike.llow.domain.User;

/**
 * @author Stodger
 * @date 2019年8月6日
 * @version
 */
public interface IAddressDao {
	
	
	
	
	
	/**
	 * 获取收货地址
	 * @param userId
	 * @return
	 */
	List<Address> listAddress(String userId);
	
	/**
	 * 获取该用户的地址数量
	 * @param address
	 * @return
	 */
	long countAddress(String userId);

	/**
	 * 保存新的收货地址
	 * @param address
	 */
	void saveAddress(Address address);

	/**
	 * 删除收货地址
	 * @param address
	 */
	void deleteAddress(Address address);

	
	/**
	 * 获取收货地址
	 * @param id
	 * @return
	 */
	Address getAddress(int id);
	/**
	 * 更换默认地址
	 * @param address
	 */
	void UpdateAddressStatus(Address address);
	
	/**
	 * 编辑已存在地址
	 * @param address
	 */
	void updateAddress(Address address);

	Address getAddress(String userId);
}


