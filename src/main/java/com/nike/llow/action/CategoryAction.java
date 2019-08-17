package com.nike.llow.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nike.llow.domain.Category;
import com.nike.llow.service.ICategoryManageService;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class CategoryAction extends ActionSupport{
	
	private List<Category> categoryList;
	
	@Autowired
    private ICategoryManageService iCategoryManageService;
	
	
	public String categoryList() {
		categoryList = iCategoryManageService.listCategorys();
		return "list";
	}
}
