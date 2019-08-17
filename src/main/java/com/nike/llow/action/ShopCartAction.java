package com.nike.llow.action;

import java.security.KeyStore.PrivateKeyEntry;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.core.appender.rolling.SizeBasedTriggeringPolicy;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nike.llow.dao.IOrderDao;
import com.nike.llow.domain.Collection;
import com.nike.llow.domain.ShopCart;
import com.nike.llow.service.IOrderService;
import com.nike.llow.service.IShopCartService;
import com.nike.llow.service.IUserService;
import com.nike.llow.vo.OrderVo;
import com.nike.llow.vo.ResVo;
import com.nike.llow.vo.ResponseResult;
import com.nike.llow.vo.ShopCartVo;
import com.nike.llow.vo.UserInfoVo;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Controller
public class ShopCartAction extends ActionSupport implements SessionAware{
    Map<String, Object> session;
    private ShopCartVo shopCartVo;
    private List<ShopCartVo> shopCartVoList;
    private String outcome;
    private String userId;
    private Integer shopCartId;
    private String productId;
    private Integer count;
    private Double totalPrice;
    private Double priceAndCount[]=new Double[2];
    private String shopCartIds;
    private OrderVo orderVo;
    private String pid;
    private ResVo resVo=new ResVo();
    private ResponseResult responseResult;
    @Autowired
    private IShopCartService iShopCartService; 
    
    @Autowired
    private IOrderService iOrderService;
    
    @Autowired
	private IUserService iUserService;
    
    
	@Override
	public void setSession(Map<String, Object> session) {
	    this.session=session;
	}

	/**
	 * 当前用户的购物车
	 * @return
	 */
	public String listShopCarts() {

		UserInfoVo user = (UserInfoVo) session.get("user");
		if (user != null) {
			shopCartVoList = (List<ShopCartVo>) iShopCartService.listShopCarts(user.getUserId());
			for (ShopCartVo s : shopCartVoList) {
				System.out.println(s.toString());
			}
			return SUCCESS;
		} else {
			return ERROR;
		}

	}

	/**
	 * 异步更新购物车商品的数目
	 * 
	 * @return
	 */
	public String updateShopCartCount() {
		System.out.println(userId+"-------------------->userId");
		System.out.println(shopCartId + "-------------------->shopCartId");
		System.out.println(count + "----------------------------->count");
		ShopCart shopCart =iShopCartService.getShopCart(shopCartId);
		iShopCartService.updateShopCartCount(shopCart, count);
	    totalPrice=iShopCartService.getTotalPrice(shopCartId);
		return SUCCESS;

	}
	
	/**
	 * 移动到收藏夹
	 * @return
	 */
	public String moveToCollection() {
		System.out.println(shopCartId+"-------------------------shopid");
		System.out.println(userId+"-------------------------userId");
		System.out.println(productId+"-------------------------productId");
		iShopCartService.moveToCollection(userId,productId);
		iShopCartService.deleteShopCart(shopCartId);
		return SUCCESS;

	}
	/**
	 * 商品详细页面移动到收藏夹
	 * @return
	 */
	public String moveProductToCollection() {
		System.out.println(pid+"-------------------------pid");
		
		UserInfoVo user=(UserInfoVo) session.get("user");
		System.out.println(user+"-------------------------user");
		iShopCartService.moveToCollection(user.getUserId(),pid);
		resVo.setOk(true);
		return SUCCESS;

	}
	
	
	
	
	/**
	 * 删除购物车的商品
	 * @return
	 */
	public String deleteShopCart() {
		System.out.println(shopCartId+"-------------------------shopid");
		iShopCartService.deleteShopCart(shopCartId);
		return SUCCESS;
		
	}
	
	
	/**结算购物车
	 * @return
	 */
	public String caculateShopCart() {
		UserInfoVo user = (UserInfoVo) session.get("user");
		orderVo = iOrderService.saveOrder(shopCartIds,user.getUserId());
		/*for(Integer shopCartId : shopCartIds) {
			System.out.println(shopCartId + "===============>shopCartId");
		}*/
		System.out.println(shopCartIds + "===============>shopCartIds");
		return SUCCESS;
	}
	
	/**
	 * 商品详细页面取消收藏
	 * @return
	 */
	public String toMoveCProduct(){
		System.out.println("这个tomove方法");
		System.out.println("这个productId是"+productId);
		
		UserInfoVo user = (UserInfoVo) session.get("user");
		
		Collection collection=new Collection();
		
		collection=iUserService.getCollection(pid,user.getUserId());
		
		responseResult=iUserService.deleteCProduct(collection);
		responseResult.setOk(true);
		return "success";
	}
}
