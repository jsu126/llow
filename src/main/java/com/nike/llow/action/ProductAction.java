package com.nike.llow.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nike.llow.domain.Category;
import com.nike.llow.domain.Product;
import com.nike.llow.service.IProductService;
import com.nike.llow.vo.PageInfoVo;
import com.nike.llow.vo.ProductCategoryVo;
import com.nike.llow.vo.ProductDetailVo;
import com.nike.llow.vo.ProductVo;
import com.nike.llow.vo.ResVo;
import com.nike.llow.vo.UserInfoVo;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Getter;
import lombok.Setter;
/**
 * @author ldg
 * @date 2019年8月9日
 * @version
 */
@Getter
@Setter
@Controller
public class ProductAction extends ActionSupport implements SessionAware,ModelDriven<Product>{
    private Map<String,Object> session;
    private Product  product=new Product();
    private ProductCategoryVo productCategory=new ProductCategoryVo();
    private  List<Category> categoryList;
    private String outcome;
    private String productSearchName;
    private PageInfoVo pageInfoVo;
    private int pageNum;
    private String genre;
    private String pid;
    private Integer cid;
    private String sname;
    private String shopCount;
    private String backName;
    private ResVo resVo = new ResVo();
    private ProductDetailVo productDetailVo;
    
    private List<ProductVo> productVoList;
    
    private List<Product> productList;
    
    
    @Autowired
    private IProductService iProductService;
    
    
	@Override
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}
    
	@Override
	public void setSession(Map<String, Object> session) {
	    this.session=session;
		
	}
	
	
	/**
	 * 获取index页面的类目列表
	 * @return
	 */
	public String listCategories() {
		System.out.println(product.getCategoryId()+"----------------->");
        if(product.getCategoryId()==1) {
    	    categoryList = iProductService.listCategorys();
    		return "success";
        }
        outcome = "";
		return "error";

	}
	 
    /**
     * 根据关键字查询商品
     * @return
     * @throws UnsupportedEncodingException 
     */
    public String productSearch() throws UnsupportedEncodingException{
    	
    	//String tempProductSearchName = new String(productSearchName.getBytes("ISO-8859-1"),"utf-8");
    	
    	//productSearchName = tempProductSearchName;
    	//byte[] bytes = productSearchName.getBytes("iso-8859-1");
    	//productSearchName = new String(bytes,"utf-8");
    	
    	System.out.println(productSearchName+"**********商品名称***********"+pageNum+"*****页数******");
    	if(productSearchName.equals("")||productSearchName==null){
    		
    		pageInfoVo = iProductService.findProductList(pageNum, 12);
    		backName="";
    		genre="";
    		cid=null;
    	}
    	else {
    		pageInfoVo=iProductService.findproductSearchList(productSearchName, pageNum, 12);
    		backName = productSearchName;
    		genre="";
    		cid=null;
    	}
    	return SUCCESS;
    }

    /**
     * 显示商品详细信息
     * @return
     */
    public String productInfo(){
    	System.out.println(pid+"*****商品ID******");
    	UserInfoVo user=(UserInfoVo) session.get("user");
    	String usid = "";
    	if(user!=null){
    		 usid = user.getUserId();
    	}
    	else {
    	     usid = "";
    	}
    	
    	productDetailVo=iProductService.findproductDetailVo(pid,null,1,10,usid);
    	
    	System.out.println(productDetailVo);
    	return SUCCESS;
    }
    /**
     * 加入购物车
     * @return
     */
    public String addShopCart(){
    	System.out.println(pid+"商品ID"+sname+"规格名称"+shopCount+"商品数量");
    	UserInfoVo user=(UserInfoVo) session.get("user");
    	Integer sCount = Integer.parseInt(shopCount);
    	System.out.println(sCount);
    	System.out.println(user.getUserId());
    	if(!(sname.equals(""))||sname==null){
    	iProductService.addShopcart(user.getUserId(), pid, sname, sCount);
         resVo.setOk(true);
    	}
    	else  resVo.setOk(false);
    	return  SUCCESS;
    }

    /**
     * 根据商品状态查找数据
     * @return
     */
    public String productGenre(){
    	System.out.println(pageNum+"***页数***"+genre+"***名称**");
    	
    	backName="";
    	cid=null;
    	pageInfoVo=iProductService.productGenreList(genre, pageNum, 12);
    	
    	return SUCCESS;
    }
    /**
     * 根据商品类别查找数据
     * @return
     */
    public String productSort(){
    	System.out.println(pageNum+"***页数***"+cid+"***类别id**");
    	backName="";
    	genre="";
    	pageInfoVo = iProductService.productSortList(cid, pageNum, 12);
    	return SUCCESS;
    }
    public String shopCartCount(){
    	UserInfoVo user=(UserInfoVo) session.get("user");
    	System.out.println(user.getUserId()+"******用户ID******");
    	
    	if(user!=null)
    	{
    	resVo = iProductService.getShopCartCount(user.getUserId());
    	}
    	else resVo.setShopCartCount(0);
    	return SUCCESS;
    }
    
    /**
     * 本月推荐
     * @return
     */
    public String productRecommend() {
    	productList = iProductService.findProductRecommend();
    	return SUCCESS;
    }
    /**
     * 新品推荐
     * @return
     */
    public String newProductRecommend() {
    	productList = iProductService.findnewProductRecommend();
    	return SUCCESS;
    }
    
    public String bestSeller() {
    	productVoList = iProductService.findBestSeller();
    	return SUCCESS;
    }
    
}
