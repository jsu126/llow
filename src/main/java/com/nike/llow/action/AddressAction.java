package com.nike.llow.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nike.llow.domain.Address;
import com.nike.llow.domain.User;
import com.nike.llow.service.IAddressService;


import com.nike.llow.vo.ResponseResult;


import com.nike.llow.vo.UserInfoVo;

import com.opensymphony.xwork2.ActionSupport;



import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class AddressAction extends ActionSupport implements SessionAware {

	private Map<String, Object> session;
	private User user = new User();
	private Address address;
	private Address editAddress=new Address();

	
	
	private ResponseResult responseResult;
	
	private List<Address> addressList;
	
	private int addressId;
	private String addrId;
	private int firstAddressId;
//	收件人信息
	private String userId;
	private String consingee;
	private String phone;
	private String provide;
	private String city;
	private String region;
	private String detailAddress;
	

	    @Autowired
	    private IAddressService iAddressService;
	   
    
	
	
	/**
	 * 收货地址信息
	 * @return
	 */
	public String address(){
		System.out.println("这个是address方法");
		UserInfoVo loginUser=(UserInfoVo) session.get("user");
		System.out.println(loginUser + "===========>loginUser");
		List<Address> addrList=iAddressService.listAddress(loginUser.getUserId());
		List<Address> addressList=new ArrayList<Address>();
		Address address=new Address();
		
		System.out.println("这个地址的个数"+addrList.size());
		for(int i=0;i<addrList.size();i++)
		{
			Address addr=new Address();
			addr=addrList.get(i);
			if(addr.getStatus()==0){
				addressList.add(addr);
			}else{
				address=addr;
			}
			
			
			
		}
		setAddress(address);
		setAddressList(addressList);
		/*Address editAddress=new Address();
		setEditAddress(editAddress);*/	
		return "success";
		
		/*System.out.println(">>>>>>>>>>>>>>**********>>>>>>>>>>>");
		System.out.println("address的数据"+addrId);
		if(addrId==null||addrId==""){
			return "success";
		}else{
			addressId=Integer.parseInt(addrId);
			editAddress=iAddressService.getAddress(addressId);
			System.out.println("editAddress的数据"+editAddress.getCity());
			setEditAddress(editAddress);
			System.out.println("editAddress????"+editAddress);
			return "success";
		}*/

		
	}
	
	/**
	 * 是编辑地址的对象数据为空
	 * @return
	 */
	public String mediumClear(){
		Address editAddress=new Address();
		setEditAddress(editAddress);
		return "success";
	}

	/**
	 * 保存收货地址
	 * @return
	 */
	public String saveAddress(){
		System.out.println("这个是saveAddress方法");
		UserInfoVo loginUser=(UserInfoVo) session.get("user");
		System.out.println("===========>loginUser" +loginUser );
	System.out.println("收件人信息id"+userId);
	System.out.println("收件人信息consingee"+consingee);
	System.out.println("收件人信息phone"+phone);
	System.out.println("收件人信息provide"+provide);
	System.out.println("收件人信息city"+city);
	System.out.println("收件人信息region"+region);
	System.out.println("收件人信息detailaddress"+detailAddress);
	Address addr=new Address();
	addr.setUserId(userId);
	addr.setConsingee(consingee);
	addr.setPhone(phone);
	addr.setProvide(provide);
	addr.setCity(city);
	
	addr.setRegion(region);
	addr.setDetailAddress(detailAddress);
	
//		收件人信息怎么不能像user一样呢
		//System.out.println("收件人信息"+address.getConsingee());
//		后面还有一个编辑的所以应该是save还是update
//		iUserService.saveAddress(loginUser.getUserId(),consingee,phone,provide,city,region,detailAddress );
	responseResult=iAddressService.saveAddress(addr);	
	return "success";
	}
	
	/**删除收货地址
	 * @return
	 */
	public String deleteAddress(){
		System.out.println("这个address该怎么获取？？？");
		System.out.println("address的数据"+addrId);
		addressId=Integer.parseInt(addrId);
		address.setAddressId(addressId);
		responseResult=iAddressService.deleteAddress(address);
		return "success";
	}
	
	/**更改默认地址
	 * @return
	 */
	public String updateAddressStatus(){
		System.out.println("address的数据"+addrId);
		addressId=Integer.parseInt(addrId);
	
		System.out.println("这个旧的addressStatus"+firstAddressId);
		responseResult=iAddressService.updateAddressStatus(addressId,firstAddressId);
		return "success";
	}
	
	/**获取需要编辑的地址信息
	 * @return
	 */
	public String toEditAddress(){
		System.out.println("这个是address方法");
		UserInfoVo loginUser=(UserInfoVo) session.get("user");
		System.out.println(loginUser + "===========>loginUser");
		List<Address> addrList=iAddressService.listAddress(loginUser.getUserId());
		List<Address> addressList=new ArrayList<Address>();
		
		
		System.out.println("这个地址的个数"+addrList.size());
		for(int i=0;i<addrList.size();i++)
		{
			Address addr=new Address();
			addr=addrList.get(i);
			if(addr.getStatus()==0){
				addressList.add(addr);
			}else{
				address=addr;
			}
			
			
			
		}
		setAddress(address);
		setAddressList(addressList);
		
		
//		这个是编辑收货地址
		System.out.println(">>>>>>>>>>>>>>**********>>>>>>>>>>>");
		System.out.println("address的数据"+addrId);
		if(addrId==null||addrId==""){
			return "success";
		}else{
			addressId=Integer.parseInt(addrId);
			editAddress=iAddressService.getAddress(addressId);
			responseResult = new ResponseResult(null);
			responseResult.setMsg("");
			responseResult.setDate(editAddress);
			System.out.println("editAddress的数据"+editAddress.getCity());
			     setEditAddress(editAddress);
			System.out.println("editAddress????"+editAddress);
			return "success";
		}
		
	}
	public String editAddress()
	{
		
		System.out.println("收件人信息--地址id"+addrId);
		
		System.out.println("收件人信息--consingee"+consingee);
		System.out.println("收件人信息--phone"+phone);
		System.out.println("收件人信息--provide"+provide);
		System.out.println("收件人信息--city"+city);
		System.out.println("收件人信息--region"+region);
		System.out.println("收件人信息--detailaddress"+detailAddress);
		Address addr=new Address();
		addressId=Integer.parseInt(addrId);
		addr.setAddressId(addressId);
		addr.setConsingee(consingee);
		addr.setPhone(phone);
		addr.setProvide(provide);
		addr.setCity(city);
		
		addr.setRegion(region);
		addr.setDetailAddress(detailAddress);
		responseResult = new ResponseResult(null);
		responseResult=iAddressService.updateAddress(addr);
		
		return "success";
	}
	
	
	
}
