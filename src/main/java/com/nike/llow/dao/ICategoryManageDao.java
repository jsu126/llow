package com.nike.llow.dao;

import java.util.List;

import com.nike.llow.domain.Category;

public interface ICategoryManageDao {

	 /**
	  * 获取类目列表
	 * @return
	 */
	List<Category> listCategorys();

	/**
	 * 保存类目
	 * @param categorys
	 */
	void saveCategory(Category categorys);

	/**
	 * 得到修改的内容
	 * @param category
	 * @return
	 */
	Category getModifyContext(Category category);
	
	/**
	 * 更新修改的内容
	 * @param category
	 */
	void updateCategory(Category category);

}
