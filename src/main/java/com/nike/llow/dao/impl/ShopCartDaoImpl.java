package com.nike.llow.dao.impl;

import java.util.List;

import org.apache.logging.log4j.core.appender.rolling.SizeBasedTriggeringPolicy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nike.llow.dao.IShopCartDao;
import com.nike.llow.domain.Collection;
import com.nike.llow.domain.ShopCart;
import com.nike.llow.domain.Standard;

@Repository
public class ShopCartDaoImpl implements IShopCartDao {    
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<ShopCart> listShopCarts(String userId) {
		System.out.println(userId+"--------------->userId");
		String hql="from ShopCart where userId=?0";
		List<ShopCart> list=(List<ShopCart>) this.hibernateTemplate.find(hql,userId);   
		System.out.println(list.size()+"--------------->listsize");
		return list;
	}

	@Override
	public Standard getStandard(String productId, String standardName) {
		String hql="from Standard where productId=?0 and standardName=?1";
		List<Standard> standard=(List<Standard>) this.hibernateTemplate.find(hql, productId,standardName);
		return standard.size()>0?standard.get(0):null;
	}
	
	@Override
	public ShopCart getShopCart(Integer shopCartId) {
		String hql="from ShopCart";
		ShopCart shopCart=this.hibernateTemplate.get(ShopCart.class, shopCartId);
		return shopCart;
	}


	@Override
	public void updateShopCartCount(ShopCart shopCart) {
	    this.hibernateTemplate.update(shopCart);
		
	}

	@Override
	public Double getShopCartCount(String userId) {
	    String hql="select count(*) from ShopCart where useId=?0";
	    List<Object[]> num=(List<Object[]>) this.hibernateTemplate.find(hql,userId);
	    Double nums= (Double) num.get(0)[0];
	    System.out.println(nums+"---------------------------nums");
		return nums;
	}

	@Override
	public void deleteShopCart(ShopCart shopCart) {
		this.hibernateTemplate.delete(shopCart);
		
	}

	@Override
	public void insertToCollection(Collection collection) {
		this.hibernateTemplate.save(collection);
		
	}

	@Override
	public Collection hasCollocetion(String userId, String productId) {
		String hql="from Collection where userId=?0 and productId=?1";
		List<Collection> lists=(List<Collection>) this.hibernateTemplate.find(hql, userId,productId);
		return lists.size()>0?lists.get(0):null;
	}


}
