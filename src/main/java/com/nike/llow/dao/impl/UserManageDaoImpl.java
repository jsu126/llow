package com.nike.llow.dao.impl;

import java.util.List;



import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.nike.llow.dao.IUserManageDao;
import com.nike.llow.domain.Certification;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.User;


@Repository
public class UserManageDaoImpl implements IUserManageDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<User> findListUsers(int pageNum, Integer count) {
		List<User> userList = this.hibernateTemplate.execute(new HibernateCallback<List<User>>() {

			@Override
			public List<User> doInHibernate(Session session) throws HibernateException {
				String hql = "from User order by registerTime asc";
				Query query = session.createQuery(hql);
				query.setFirstResult(pageNum);
				query.setMaxResults(count);
				return (List<User>) query.list();

			}

		});
		return userList;
	}

	@Override
	public long findAllCount() {
		String hql = "select count(*) from  User";
		List count = (List) this.hibernateTemplate.find(hql);

		return count.size() > 0 ? (Long) count.get(0) : 0;
	}

	@Override
	public User getUser(String uid) {

		String hql = "from User where userId=?0";
		List<User> userList = (List<User>) this.hibernateTemplate.find(hql, uid);
		return userList.size() > 0 ? userList.get(0) : null;
	}

	@Override
	public void updateUser(User user) {
		this.hibernateTemplate.update(user);

	}

	@Override
	public List<User> findAll() {
		String hql="from User";
		return (List<User>)this.hibernateTemplate.find(hql);
	}

	@Override
	public void deleteUser(User user) {
		this.hibernateTemplate.delete(user);
		
	}

	@Override
	public List<Certification> findCertificationAll() {
		String hql = "FROM Certification";
		List<Certification> certificationList = (List<Certification>)this.hibernateTemplate.find(hql);
		return certificationList;
	}

	@Override
	public Certification getCertification(Integer certificationId) {
		return this.hibernateTemplate.get(Certification.class, certificationId);
	}

	@Override
	public void updateCertification(Certification certification) {
		this.hibernateTemplate.update(certification);
	}

	@Override
	public void deleteCertification(Certification certification) {
		this.hibernateTemplate.delete(certification);
	}

	@Override
	public Long findReionCount(String city) {
		String hql = "select count(*) from User where city=?0";
		List list = (List)this.hibernateTemplate.find(hql, city);
		return list.size() > 0 ? (Long)list.get(0) : 0;
	}

	@Override
	public List<User> findSearchUsers(String searchStartTime, String searchEndTime, String searchCity) {
		String hql = "from User where 1=1 ";
		if(!"".equals(searchStartTime)){
			hql += "and registerTime >= "+ "'"+searchStartTime +"'";
		}
		if(!"".equals(searchEndTime)){
			hql += "and registerTime <= "+ "'"+searchEndTime+"'";
		}
		if(!"-1".equals(searchCity)){
			hql += "and city="+"'"+searchCity+"'";
		}
	
		return (List<User>)this.hibernateTemplate.find(hql);
	}
	
}
