package com.nike.llow.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nike.llow.domain.Category;
import com.nike.llow.domain.Certification;
import com.nike.llow.domain.User;
import com.nike.llow.service.ICategoryManageService;
import com.nike.llow.service.IFileUploadService;
import com.nike.llow.service.IUserService;
import com.nike.llow.util.CodeUtil;
import com.nike.llow.util.RandomNumberUtil;
import com.nike.llow.vo.UserInfoVo;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class CategoryManageAction extends ActionSupport implements ModelDriven<Category>,SessionAware{
	
	private Map<String,Object> session;
	private Category category = new Category();
    private List<Category> list;
    private String outcome;
    private Category categorys;
    @Autowired
    private ICategoryManageService iCategoryManageService;
	@Override
	public Category getModel() {
		// TODO Auto-generated method stub
		return category;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
	/**
	 * 类目列表显示
	 * @return
	 */
	public String categoryList() {
	    list=iCategoryManageService.listCategorys();
		return SUCCESS;
	}
	
	/**
	 *保存类目
	 * @return
	 */
	public String saveCategory() {
		System.out.println(category.toString()+"-------------------->category");
		if (category.getCategoryName() != null || "".equals(category.getCategoryName())) {
			System.out.println(category.getCategoryName());
			iCategoryManageService.saveCategory(category);
			outcome="";
			return SUCCESS;
		} else {
			outcome="添加失败";
			return ERROR;
		}
	}
	
	
	/**
	 * 查询具体的修改的内容
	 * @return
	 */
	public String categoryModify(){
        categorys=iCategoryManageService.getModifyContext(category);
		return SUCCESS;
	}
	
	/**
	 * 更新内容
	 * @return
	 */
	public String updateCategory() {
		System.out.println(category.getCategoryId()+"-------------------------->");
		System.out.println(category.getCategoryName()+"-------------------------->");
		iCategoryManageService.updateCategory(category);
		outcome="";
		return SUCCESS;
		
	}
	
    /**
     * 停用类目
     * @return
     */
    public String deleteCategory() {
    	System.out.println(category.getCategoryId()+"---------------------->");
    	iCategoryManageService.deleteCategory(category);
    	outcome="";
    	return SUCCESS;
    	
    }
	
	
	
 
	
	

	
	
}
