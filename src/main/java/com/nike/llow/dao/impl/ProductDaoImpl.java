package com.nike.llow.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nike.llow.dao.IProductDao;
import com.nike.llow.domain.Category;
import com.nike.llow.domain.Comment;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Sales;
import com.nike.llow.domain.ShopCart;
import com.nike.llow.domain.Standard;
import com.nike.llow.domain.User;


@Repository
public class ProductDaoImpl implements IProductDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<Product> productSearchList(String keyWord, int currentPage, int count) {
		List<Product> productList = this.hibernateTemplate.execute(new HibernateCallback<List<Product>>() {

			@Override
			public List<Product> doInHibernate(Session session) throws HibernateException {
				String hql = "from Product where productName like : title and status=0";
				Query query = session.createQuery(hql);
				query.setParameter("title", "%" + keyWord + "%");
				query.setFirstResult(currentPage);
				query.setMaxResults(count);
				return (List<Product>) query.list();
			}
		});

		return productList;
	}
	@Override
	public List<Product> productGenreList(String status, int currentPage, int count) {
		List<Product> productList = this.hibernateTemplate.execute(new HibernateCallback<List<Product>>() {

			@Override
			public List<Product> doInHibernate(Session session) throws HibernateException {
				String hql = "from Product where status=0 ";
				if(!"".equals(status)){
					hql += " and "+status;
				}
				Query query = session.createQuery(hql);
				query.setFirstResult(currentPage);
				query.setMaxResults(count);
				return (List<Product>) query.list();
			}
		});

		return productList;
	}
	@Override
	public long productSearchListCount(String keyWord) {
		Long count = this.hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException {
				String hql = "select count(*) from Product where productName like:title and status=0";
				Query query = session.createQuery(hql);
				query.setParameter("title", "%" + keyWord + "%");
				List<Long> list = query.list();
				return list.get(0);
			}
		});
		return count;
	}

	@Override
	public long productGenreListCount(String status) {
	    Long count = this.hibernateTemplate.execute(new HibernateCallback<Long>() {

			@Override
			public Long doInHibernate(Session session) throws HibernateException {
				String hql = "select count(*) from Product where status=0";
				if(!"".equals(status)){
					hql += " and "+status;
				}
				Query query = session.createQuery(hql);
				List<Long>list = query.list();
				return list.get(0);
				
			}
		});

		return count;
		
}
	@Override
	public List<Object[]> getPriceScope(String productId) {
		String hql = "select max(price) ,min(price) from Standard where productId=?0";

		return (List<Object[]>) this.hibernateTemplate.find(hql, productId);
	}

	@Override
	public List<Sales> findSale(String productId) {
		String hql = "from Sales where productId=?0";
		return  (List<Sales>) this.hibernateTemplate.find(hql, productId);

	}

	@Override
	public List<Comment> findCommentList(String productId) {
		String hql="from Comment where productId=?0";
		
		return (List<Comment>)this.hibernateTemplate.find(hql, productId);
	}

	@Override
	public List<Standard> findStandardList(String productId) {
		String hql="from Standard where productId=?0";
		return (List<Standard>)this.hibernateTemplate.find(hql, productId);
	}

	@Override
	public Product getProduct(String productId) {
		String hql="from Product where productId=?0";
		List<Product>productList = (List<Product>)this.hibernateTemplate.find(hql,productId);
		
		return productList.size()>0 ? productList.get(0):null;
	}

	@Override
	public Category getCategory(Integer categoryId) {
		String hql="from Category where categoryId=?0";
		List<Category>categoryList = (List<Category>)this.hibernateTemplate.find(hql,categoryId);
		return categoryList.size()>0 ? categoryList.get(0):null;
	}

	@Override
	public User getUser(String userId) {
		String hql="from User where userId=?0";
		List<User>userList = (List<User>)this.hibernateTemplate.find(hql,userId);
		
		return userList.size()>0?userList.get(0):null;
	}

	@Override
	public Standard getStandard(String productId, String standardName) {
		String hql = "from Standard where productId=?0 and standardName=?1";
		List<Standard> standardLsit = (List<Standard>)this.hibernateTemplate.find(hql,productId,standardName);
		return standardLsit.size() > 0 ? standardLsit.get(0) : null;
	}

	@Override
	public void updateStandard(Standard standard) {
		this.hibernateTemplate.update(standard);
	}
	@Override
	public void addShopcart(ShopCart shopCart) {
		String hql="from ShopCart";
		this.hibernateTemplate.save(shopCart);
		
	}

	@Override
	public ShopCart shopCartIsIn(String userId, String productId, String standardName) {
		String hql="from ShopCart where userId=?0 and productId=?1 and standardName=?2";
		List<ShopCart>shopCartList = (List<ShopCart>)this.hibernateTemplate.find(hql, userId,productId,standardName);
		
		return shopCartList.size()>0?shopCartList.get(0):null;
		
	}

	@Override
	public void updateShopCart(ShopCart shopCart) {
		String hql="from ShopCart";
		this.hibernateTemplate.update(shopCart);
		
	}

	@Override
	public List<Product> productList(int currentPage, int count) {
		List<Product> productList = this.hibernateTemplate.execute(new HibernateCallback<List<Product>>() {

			@Override
			public List<Product> doInHibernate(Session session) throws HibernateException {
				String hql = "from Product where status=0";
				Query query = session.createQuery(hql);
				query.setFirstResult(currentPage);
				query.setMaxResults(count);
				return (List<Product>) query.list();
			}
		});

		return productList;
	}

	@Override
	public long productListCount() {
		String hql="select count(*) from Product where status=0";
		List count = (List) this.hibernateTemplate.find(hql);
		return (long)(count.size()>0?count.get(0):0);
	}
	@Override
	public List<Product> productSortList(int categoryId, int currentPage, int count) {
		List<Product> productList = this.hibernateTemplate.execute(new HibernateCallback<List<Product>>() {
			@Override
			public List<Product> doInHibernate(Session session) throws HibernateException {
				String hql = "from Product where categoryId =:categoryId and status=0";
				Query query = session.createQuery(hql);
				query.setParameter("categoryId", categoryId);
				
				query.setFirstResult(currentPage);
				query.setMaxResults(count);
				return (List<Product>) query.list();
			}
		});

		return productList;
	}
	@Override
	public long productSortListCount(int categoryId) {
		String hql="select count(*) from Product where categoryId=?0 and status=0";
		List count = (List)this.hibernateTemplate.find(hql, categoryId);
		
		return (long)count.get(0);
	}
	@Override
	public Sales getSales() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Sales getSales(String productId, String year, String month) {
		String hql = "from Sales where productId=?0 and year=?1 and month=?2";
		List<Sales> salesList = (List<Sales>)this.hibernateTemplate.find(hql,productId, year,month);
		return salesList.size() > 0 ? salesList.get(0) : null;
	}
	@Override
	public void saveSales(Sales sales) {
		this.hibernateTemplate.save(sales);
	}
	@Override
	public void updateSales(Sales sales) {
		this.hibernateTemplate.update(sales);
	}
	@Override
	public long getShopCartCount(String userId) {
		String hql="select count(*) from ShopCart where userId=?0";
		List count=(List)this.hibernateTemplate.find(hql, userId);
		return (long)count.get(0);
	}
	@Override
	public List<Product> findproductCateList(String productId, Integer categoryId) {
		String hql="from Product where productId!=?0 and categoryId =?1 and status=0";
		return (List<Product>)this.hibernateTemplate.find(hql, productId,categoryId);
	}
	@Override
	public List<Sales> findSaleOrderByDesc(String year, String month) {
		return this.hibernateTemplate.execute(new HibernateCallback<List<Sales>>() {
			@Override
			public List<Sales> doInHibernate(Session session) throws HibernateException {
				String hql = "from Sales where year=:year and month=:month order by saleCount desc";
				Query query = session.createQuery(hql);
				query.setParameter("year", year);
				query.setParameter("month", month);
				query.setFirstResult(0);
				query.setMaxResults(4);
				return query.list();
			}
		});
	}
	@Override
	public List<Product> findnewProductRecommend() {
		return this.hibernateTemplate.execute(new HibernateCallback<List<Product>>() {
			@Override
			public List<Product> doInHibernate(Session session) throws HibernateException {
				String hql = "from Product order by productId desc";
				Query query = session.createQuery(hql);
				query.setFirstResult(0);
				query.setMaxResults(10);
				return query.list();
			}
		});
	}
	@Override
	public List<Sales> findSales() {
		return this.hibernateTemplate.execute(new HibernateCallback<List<Sales>>() {
			@Override
			public List<Sales> doInHibernate(Session session) throws HibernateException {
				String hql = "from Sales order by saleCount desc";
				Query query = session.createQuery(hql);
				query.setFirstResult(0);
				query.setMaxResults(3);
				return query.list();
			}
		});
		
	}
}
