package com.nike.llow.service;

import java.util.List;

import com.nike.llow.domain.Category;

public interface ICategoryManageService {
     
	 /**
	  * 获取类目列表
	 * @return
	 */
	List<Category> listCategorys();

	/**保存类目选项
	 * @param category
	 */
	void saveCategory(Category category);

	/**
	 * 得到修改的内容
	 * @param category
	 * @return
	 */
	Category getModifyContext(Category category);

	/**更新修改的内容
	 * @param category
	 */
	void updateCategory(Category category);

	/**
	 *停用目录
	 * @param category
	 */
	void deleteCategory(Category category);
	
}
