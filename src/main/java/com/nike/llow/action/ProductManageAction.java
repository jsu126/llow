package com.nike.llow.action;



import java.io.File;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import com.google.gson.Gson;
import com.nike.llow.service.IFileUploadService;
import com.nike.llow.domain.Product;
import com.nike.llow.service.IProductManageService;
import com.nike.llow.vo.ProductAndStandardVo;
import com.nike.llow.vo.ProductInfoVo;
import com.nike.llow.vo.ProductVo;
import com.nike.llow.vo.ResVo;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class ProductManageAction extends ActionSupport implements ModelDriven<ProductInfoVo>,SessionAware{
	
	private Map<String,Object>session;
	private File[] upload;
	private String[] uploadContentType;
    private String[] uploadFileName;
    private String result;
    private Long count;
	private Product product;
	private ProductVo productVo;
	private String pid;
	private ResVo resVo;
	private ProductInfoVo productInfoVo = new ProductInfoVo();
	private ProductAndStandardVo productAndStandardVo;
	
	private String year;
	
	private List<Product> productList = new ArrayList<>();
	
	private List<Long> commentCountList = new ArrayList<>();
	
	private List<Long> salesCountList = new ArrayList<>();
	
	private List<Object> salesYearList = new ArrayList<>();
	
	@Autowired
	private IProductManageService iProductManageService;
	@Autowired
	private IFileUploadService iFileUploadService;
	
	public String uploadProductImage() {
		for(int i = 0; i < uploadFileName.length; i++) {
			ServletContext servletContext= ServletActionContext.getServletContext();
	    	String path = servletContext.getRealPath("/upload");
	    	String fileName = iFileUploadService.uploadFile(path, uploadFileName[i], upload[i]);
	    	result = "http://image.stodger.club/images/" + fileName;
	    	result = new Gson().toJson(result);
		}
		
		return SUCCESS;
	}
	
	/**
	 * 添加商品
	 */
	public String saveProduct() {
		System.out.println(productInfoVo + "==========================>productInfoVo");
		iProductManageService.saveProduct(productInfoVo);
		result = "";
		return "addProduct";
	}
	
	
	/**
	 * 显示所有商品
	 * @return
	 */
	public String productList(){
		productList = iProductManageService.findListProducts();
		for(Product p:productList){
			System.out.println(p);
		}
		System.out.println("进来了");
		return SUCCESS;
	}
	
	/**
	 * 显示商品详细信息
	 * @return
	 */
	public String productInfo(){
		productVo = iProductManageService.getProductVo(pid);
		System.out.println(productVo+"商品详细信息");
		return SUCCESS;
	}
	
	/**
	 * 商品的发布和下架
	 * @return
	 */
	public String productStatus(){
		System.out.println(pid+"*****商品id*****");
		
		product = iProductManageService.getProduct(pid);
	
		iProductManageService.updateProductStatus(product);
		
		
		result="77";
		return SUCCESS;
	}
	
	/**
	 * 删除,还原商品
	 * @return
	 */
	public String productDel(){
		System.out.println(pid);
		
		product = iProductManageService.getProduct(pid);
		
		resVo=iProductManageService.deleteProduct(product);
		return SUCCESS;
	}
	/**
	 * 获取商品信息
	 * @return
	 */
	public String getProductInfo() {
		productAndStandardVo = iProductManageService.getProductInfo(pid);
		return "get";
	}
	/**
	 * 更新商品
	 * @return
	 */
	public String updateProduct() {
		System.out.println(productInfoVo + "==========================>productInfoVo");
		iProductManageService.updateProduct(productInfoVo);
		result="123";
		return "update";
	}
	
	public String productCount() {
		count = iProductManageService.countProduct();
		return SUCCESS;
	}
	public String commentCount() {
		commentCountList = iProductManageService.countCommentList(pid);
		
		return SUCCESS;
	}
	/**
	 * 年销售统计
	 * @return
	 */
	public String salesCount() {
		salesCountList = iProductManageService.countSales(year);
		return SUCCESS;
	}
	
	/**
	 * 年份
	 * @return
	 */
	public String salesYeas() {
		salesYearList = iProductManageService.findListSalesYear();
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}

	@Override
	public ProductInfoVo getModel() {
		// TODO Auto-generated method stub
		return productInfoVo;
	}

}
