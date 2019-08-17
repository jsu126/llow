package com.nike.llow.dao.impl;

import java.util.List;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nike.llow.dao.IUserDao;
import com.nike.llow.domain.Address;
import com.nike.llow.domain.Certification;
import com.nike.llow.domain.Collection;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Standard;
import com.nike.llow.domain.User;
import com.opensymphony.xwork2.Result;

@Repository
public class UserDaoImpl implements IUserDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public User getUser(String userId) {
		return this.hibernateTemplate.get(User.class, userId);
	}

	@Override
	public int emailRegisterFont(String email) {
		String string="";	
		String hql = "from User where email=?0 and email!=?1";
		List<User> user = (List<User>) this.hibernateTemplate.find(hql, email,string);
		System.out.println(user.size());
		return user.size() > 0 ? 1 : 0;

	}

	@Override
	public void saveEmaiRegister(User user) {
		this.hibernateTemplate.save(user);

	}

	@Override
	public int phoneRegisterFont(String phone) {
		String string="";
		String hql = "from User where phone=?0 and phone!=?1";
		List<User> user = (List<User>) this.hibernateTemplate.find(hql, phone,string);
		System.out.println(user.size());
		return user.size() > 0 ? 1 : 0;
	}

	@Override
	public void savePhoneRegister(User user) {
		this.hibernateTemplate.save(user);

	}

	@Override
	public void updateUser(User resultUser) {
		this.hibernateTemplate.update(resultUser);

	}

	@Override
	public void saveUser(User user) {
		this.hibernateTemplate.save(user);
	}

	@Override
	public User getByUser(User user) {
		String hql = "from User where username=?0";
		List<User> userList = (List<User>) this.hibernateTemplate.find(hql, user.getUsername());
		return userList.size() > 0 ? userList.get(0) : null;
	}

	@Override
	public void updateNewPhone(User user) {
		this.hibernateTemplate.update(user);

	}

	@Override
	public void updateEmail(User user) {
		this.hibernateTemplate.update(user);

	}

	@Override
	public User getNewPhone(String phone) {

		String hql = "from User where phone=?0";
		List<User> userList = (List<User>) this.hibernateTemplate.find(hql, phone);
		return userList.size() > 0 ? userList.get(0) : null;
	}

	@Override
	public User getNewEmail(String email) {
		String hql = "from User where email=?0";
		List<User> userList = (List<User>) this.hibernateTemplate.find(hql, email);
		return userList.size() > 0 ? userList.get(0) : null;

	}

	@Override
	public void saveCertification(Certification certification) {
		this.hibernateTemplate.save(certification);
	}

	@Override
	public Certification findCertification(String userId, int status) {
		String hql = "From Certification where userId=?0 and status=?1";
		List<Certification> certificationList = (List<Certification>) this.hibernateTemplate.find(hql, userId,status);
		return certificationList.size() > 0 ? certificationList.get(0) : null;
	}

	@Override
	public void updateCertification(Certification certification) {
		this.hibernateTemplate.update(certification);
	}

	@Override
	public User checkLogin(User user) {

	    String hql="from User where (email=?0 or phone=?1) and (password=?2 and status=1)";
	    List<User> reuslt=(List<User>)this.hibernateTemplate.find(hql,user.getUsername(),user.getUsername(),user.getPassword());
	    System.out.println(reuslt.size());
	    return reuslt.size() > 0?reuslt.get(0):null;
		

	}

	

	/*@Override
	public List<Address> listAddress(String userId) {
		String hql = "from Address where userId=?0";
		List<Address> addressList = (List<Address>) this.hibernateTemplate.find(hql, userId);
		return addressList;
	}

	@Override
	public void saveAddress(Address address) {
		System.out.println(address.getCity());
		System.out.println("收件人信息--------------------" + address.getUserId());
		System.out.println("收件人信息------s" + address.getConsingee());
		System.out.println("收件人信息" + address.getPhone());
		System.out.println("收件人信息" + address.getProvide());
		System.out.println("收件人信息" + address.getCity());
		System.out.println("收件人信息" + address.getRegion());
		System.out.println("收件人信息" + address.getDetailAddress());
		this.hibernateTemplate.save(address);

	}*/
	
	@Override
	public List<Collection> listCollectionByUser(User user) {
		String hql="from Collection where userId=?0";
		List<Collection> collectionList=(List<Collection>) this.hibernateTemplate.find(hql, user.getUserId());
		return collectionList;
	}

	@Override
	public Long countUser() {
		String hql = "select count(*) from User";
		List list = (List) this.hibernateTemplate.find(hql);
		return list.size() > 0 ? (Long) list.get(0) : 0;
	}

	@Override
	public Long countMale(String sex) {
		String hql = "select count(*) from User where sex=?0";
		List list = (List)this.hibernateTemplate.find(hql, sex);
		return list.size() > 0 ? (Long) list.get(0) : 0;
	}
	@Override
	public Product getCProduct(String id) {
		String hql="from Product where productId=?0";
		List<Product> reuslt=(List<Product>) this.hibernateTemplate.find(hql, id);
		return reuslt.size() > 0?reuslt.get(0):null;
		
	}

	@Override
	public Standard getStandardByProductId(String productId) {
		String hql="from Standard where productId=?0";
	    List<Standard> reuslt=(List<Standard>)this.hibernateTemplate.find(hql,productId);
	    return reuslt.size() > 0?reuslt.get(0):null;
	}

	
	
	@Override
	public Collection getCollection(String productId,String userId) {
		System.out.println("getCollection----->");
		String hql="from Collection where productId=?0 and userId=?1";
	    List<Collection> reuslt=(List<Collection>)this.hibernateTemplate.find(hql,productId,userId);
	    return reuslt.size() > 0?reuslt.get(0):null;
	}

	@Override
	public void deleteCollection(Collection collection) {
		System.out.println("delete---->");
		this.hibernateTemplate.delete(collection);
		
		
	}


	@Override
	public User hasPhone(String newPhone) {
		String hql="from User where phone=?0";
		List<User> userList = (List<User>) this.hibernateTemplate.find(hql, newPhone);
		return userList.size() > 0 ? userList.get(0) : null;
	}

	@Override
	public void updateModifyPassword(User user) {
		this.hibernateTemplate.update(user);
		
	}

	@Override
	public void updateBindPhone(User user) {
		this.hibernateTemplate.update(user);
	}

	@Override
	public User getModifyUser(String userId, String md5EnCode) {
		String hql="from User where userId=?0 and password=?1";
		List<User> users=(List<User>) this.hibernateTemplate.find(hql,userId,md5EnCode); 
		return users.size()>0?users.get(0):null;
	}




	
}
