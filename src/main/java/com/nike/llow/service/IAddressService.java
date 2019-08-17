package com.nike.llow.service;



import java.util.List;

import com.nike.llow.domain.Address;
import com.nike.llow.domain.User;
import com.nike.llow.vo.ResponseResult;




/**
 * @author Stodger
 * @date 2019年8月6日
 * @version
 */
public interface IAddressService {

	
	
	/**
	 * 获取用户的收货地址
	 * @param userId
	 * @return
	 */
	List<Address> listAddress(String userId);
	
	/**保存收货地址
	 * @param address
	 */
//	void saveAddress(String id,String consingee,String phone,String provide,String city,String region,String detailAddress );
	ResponseResult saveAddress(Address address);
	
	/**
	 * 删除收货地址
	 * @param address
	 * @return
	 */
	ResponseResult deleteAddress(Address address);
	
	/**
	 * 更改默认地址
	 * @param addressId
	 * @param firstAddress
	 * @return
	 */
	ResponseResult updateAddressStatus(int addressId,int firstAddress);
	
	/**
	 * 编辑地址前获该收货人的信息
	 * @param addressId
	 */
	Address getAddress(int addressId);
	
	/**
	 * @param addressId
	 * @return
	 */
	ResponseResult updateAddress(Address address);

}
