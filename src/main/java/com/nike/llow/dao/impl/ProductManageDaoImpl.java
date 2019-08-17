package com.nike.llow.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nike.llow.dao.IProductManageDao;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Standard;

@Repository
public class ProductManageDaoImpl implements IProductManageDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<Product> findAllProduct() {
		String hql = "from Product order by productId desc";
		// String hql = "from Product pt join fetch pt.voteOptions ";
		return (List<Product>) this.hibernateTemplate.find(hql);
	}

	@Override
	public Product getProduct(String pid) {
		String hql = "from Product where productId=?0";
		List<Product> productList = (List<Product>) this.hibernateTemplate.find(hql, pid);

		return productList.size() > 0 ? productList.get(0) : null;
	}

	@Override
	public List<Standard> getStandard(String pid) {
		String hql = "from Standard where productId=?0";
		return (List<Standard>) this.hibernateTemplate.find(hql, pid);

	}

	@Override
	public void saveProduct(Product product) {
		this.hibernateTemplate.save(product);
	}

	@Override
	public void saveStandard(Standard standard) {
		this.hibernateTemplate.save(standard);
	}

	@Override
	public void updateProduct(Product product) {
		this.hibernateTemplate.update(product);

	}

	@Override
	public void deleteProduct(Product result) {
		this.hibernateTemplate.delete(result);
	}

	@Override
	public Long countProduct() {
		String hql = "select count(*) from Product";
		List list = (List) this.hibernateTemplate.find(hql);
		return list.size() > 0 ? (Long) list.get(0) : 0;
	}

	@Override
	public long countComment(String pid,int i) {
		String hql = "select count(*) from Comment where product_id=?0 and star_count=?1";
		List list = (List)this.hibernateTemplate.find(hql, pid, i);
		return list.size() > 0 ? (Long)list.get(0) : 0;
	}

	@Override
	public long countSales(String year, String month) {
		String hql = "select sum(saleCount) from Sales where year=?0 and month=?1";
		List list = (List)this.hibernateTemplate.find(hql, year, month);
		System.out.println(list.size() + "========" + month);
		if(list.get(0) == null) {
			System.out.println("11111"+"========" + month);
			return 0;
		}else {
			System.out.println("22222222" + "========" + month);
			return (Long)list.get(0);
		}
	}

	@Override
	public List<Object> findListSalesYear() {
		String hql = "select DISTINCT year from Sales order by year desc";
		List<Object> list = (List<Object>)this.hibernateTemplate.find(hql);
		return list;
	}

}
