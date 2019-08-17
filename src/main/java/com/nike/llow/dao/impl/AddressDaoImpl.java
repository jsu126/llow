package com.nike.llow.dao.impl;


import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import org.springframework.stereotype.Repository;


import com.nike.llow.dao.IAddressDao;

import com.nike.llow.domain.Address;
import com.nike.llow.domain.User;


@Repository
public class AddressDaoImpl implements IAddressDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	
	
	

	@Override
	public List<Address> listAddress(String userId) {
		String hql="from Address where userId=?0";
		List<Address> addressList=(List<Address>) this.hibernateTemplate.find(hql, userId);
		return addressList;
	}

	public long countAddress(String userId){
		String hql="select count(*) from Address where userId=?0";
		List count = (List) this.hibernateTemplate.find(hql,userId);
		return count.size() > 0 ? (Long) count.get(0) : 0;
	}
	@Override
	public void saveAddress(Address address) {
		
		this.hibernateTemplate.save(address);
		
	}

	@Override
	public void deleteAddress(Address address) {
		System.out.println("要删除的地址id"+address.getAddressId());
		this.hibernateTemplate.delete(address);
		
	}

	@Override
	public Address getAddress(int addressId) {
		return this.hibernateTemplate.get(Address.class, addressId);
	}

	@Override
	public void UpdateAddressStatus(Address address) {
		this.hibernateTemplate.update(address);
		
	}

	@Override
	public void updateAddress(Address address) {
		this.hibernateTemplate.update(address);
		
	}

	@Override
	public Address getAddress(String userId) {
		String hql = "FROM Address where userId=?0 and status=1";
		List<Address> addressList = (List<Address>)this.hibernateTemplate.find(hql, userId);
		return addressList.size() > 0 ? addressList.get(0) : null;
	}

	

}
