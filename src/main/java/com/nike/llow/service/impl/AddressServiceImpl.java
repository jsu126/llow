package com.nike.llow.service.impl;


import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.nike.llow.domain.User;
import com.nike.llow.dao.IAddressDao;

import com.nike.llow.domain.Address;

import com.nike.llow.service.IAddressService;

import com.nike.llow.vo.ResponseResult;




@Service
@Transactional
public class AddressServiceImpl implements IAddressService {

	@Autowired
	private IAddressDao iAddressDao;

	
	@Override
	public List<Address> listAddress(String userId) {
		List<Address> addressList=iAddressDao.listAddress(userId);
		return addressList;
	}

	@Override
//	public void saveAddress(String id,String consingee,String phone,String provide,String city,String region,String detailAddress ) {
	public ResponseResult saveAddress(Address addr){
	//		System.out.println("address"+address.getCity());
		/*Address addr=new Address();
		addr.setUserId(id);
		addr.setConsingee(consingee);
		addr.setPhone(phone);
		addr.setProvide(provide);
		addr.setCity(city);
		addr.setRegion(region);
		addr.setDetailAddress(detailAddress);
		System.out.println("-->"+city);*/
//		如果这是保存的第一条数据，这就是默认地址
		System.out.println("********难道是long类型？？");
//		int num=Integer.parseInt(iAddressDao.countAddress(addr.getUserId()))
	     if(iAddressDao.countAddress(addr.getUserId())==0){
			addr.setStatus(1);
		}
			
		iAddressDao.saveAddress(addr);
		User result = null;
		ResponseResult<User> responseResult = new ResponseResult<User>(result);
		responseResult.setMsg("");
		return responseResult ;
		
	}

	@Override
	public ResponseResult deleteAddress(Address address) {
		iAddressDao.deleteAddress(address);
		User result = null;
		ResponseResult<User> responseResult = new ResponseResult<User>(result);
		responseResult.setMsg("");
		return responseResult ;
		
	}

	@Override
	public ResponseResult updateAddressStatus(int addressId, int firstAddress) {
		
	    Address address1=iAddressDao.getAddress(addressId);
	    address1.setStatus(1);
	    System.out.println("是否存在默认地址（存在为地址id,否则为0）"+firstAddress);
	    if(firstAddress!=0){
	    	 Address address2=iAddressDao.getAddress(firstAddress);
	 	     address2.setStatus(0);
	 	     iAddressDao.UpdateAddressStatus(address2);
	    }
	
	    iAddressDao.UpdateAddressStatus(address1);
	    
	    
		User result = null;
		ResponseResult<User> responseResult = new ResponseResult<User>(result);
		responseResult.setMsg("");
		return responseResult ;

	}

	@Override
	public Address getAddress(int addressId) {
		
		Address address=iAddressDao.getAddress(addressId);
	    ;
		return address;
		
		
	}

	@Override
	public ResponseResult updateAddress(Address address) {
		System.out.println(address.getCity()+"--->");
		Address addr=iAddressDao.getAddress(address.getAddressId());
		System.out.println("这个获取addr数据"+addr.getCity()+addr.getConsingee());
		addr.setConsingee(address.getConsingee());
		addr.setPhone(address.getPhone());
		addr.setProvide(address.getProvide());
		addr.setCity(address.getCity());
		addr.setRegion(address.getRegion());
		addr.setDetailAddress(address.getDetailAddress());
		iAddressDao.updateAddress(addr);
		User result = null;
		ResponseResult<User> responseResult = new ResponseResult<User>(result);
		responseResult.setMsg("");
		return responseResult ;
	}
}
