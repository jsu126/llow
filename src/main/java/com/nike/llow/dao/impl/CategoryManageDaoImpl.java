package com.nike.llow.dao.impl;

import java.util.List;

import org.apache.logging.log4j.core.appender.rolling.SizeBasedTriggeringPolicy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.nike.llow.dao.ICategoryManageDao;
import com.nike.llow.domain.Category;
@Repository
public class CategoryManageDaoImpl implements ICategoryManageDao {
   
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Override
	public List<Category> listCategorys() {
	    String hql="from Category";
	    List<Category> list=(List<Category>) this.hibernateTemplate.find(hql);
		return list;
	}
	
	@Override
	public void saveCategory(Category categorys) {
		this.hibernateTemplate.save(categorys);	
	}

	@Override
	public Category getModifyContext(Category category) {
		Category category2=this.hibernateTemplate.get(Category.class,category.getCategoryId());
		return category2;
	}

	@Override
	public void updateCategory(Category category) {
	   this.hibernateTemplate.update(category);
		
	}

	

}
