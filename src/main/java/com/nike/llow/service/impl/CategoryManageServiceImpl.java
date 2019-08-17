package com.nike.llow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nike.llow.dao.ICategoryManageDao;
import com.nike.llow.domain.Category;
import com.nike.llow.service.ICategoryManageService;
@Service
@Transactional
public class CategoryManageServiceImpl implements ICategoryManageService {
    @Autowired
    private ICategoryManageDao iCategoryManageDao;
    
	@Override
	public List<Category> listCategorys() {
		// TODO Auto-generated method stub
		return iCategoryManageDao.listCategorys();
	}

	@Override
	public void saveCategory(Category category) {
		Category categorys=new Category();
		categorys.setCategoryStatus(1);
		categorys.setCategoryName(category.getCategoryName());
		iCategoryManageDao.saveCategory(categorys);
		
	}

	@Override
	public Category getModifyContext(Category category) {
		return iCategoryManageDao.getModifyContext(category);
	}

	@Override
	public void updateCategory(Category category) {
		category.setCategoryStatus(1);
		iCategoryManageDao.updateCategory(category);
	}

	@Override
	public void deleteCategory(Category category) {
	
		Category categorys=getModifyContext(category);
	    if(categorys.getCategoryStatus()==0) {
	        categorys.setCategoryStatus(1);
	    }else {
	    	 categorys.setCategoryStatus(0);
	    }
	    iCategoryManageDao.updateCategory(categorys);
	}
}
