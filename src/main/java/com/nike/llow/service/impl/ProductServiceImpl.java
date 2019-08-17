package com.nike.llow.service.impl;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.SynchronossPartHttpMessageReader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Splitter;
import com.nike.llow.dao.ICategoryManageDao;
import com.nike.llow.dao.IProductDao;
import com.nike.llow.dao.IShopCartDao;
import com.nike.llow.domain.Category;
import com.nike.llow.domain.Collection;
import com.nike.llow.domain.Comment;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Sales;
import com.nike.llow.domain.ShopCart;
import com.nike.llow.domain.Standard;
import com.nike.llow.domain.User;
import com.nike.llow.service.IProductService;
import com.nike.llow.util.DateAndStringUtil;
import com.nike.llow.vo.CommentAndUserVo;
import com.nike.llow.vo.PageInfoVo;
import com.nike.llow.vo.ProductDetailVo;
import com.nike.llow.vo.ProductInfoVo;
import com.nike.llow.vo.ProductVo;
import com.nike.llow.vo.ResVo;


/**
 * @author ldg
 * @date 2019年8月9日
 * @version
 */

@Service
@Transactional
public class ProductServiceImpl implements IProductService {
	
	@Autowired
	private IProductDao iProductDao;
	@Autowired
	private ICategoryManageDao iCategoryManageDao;
	@Autowired
	private IShopCartDao iShopCartDao;

	@Override
	public List<Category> listCategorys() {
		List<Category> lists=new ArrayList<Category>();
		List<Category> list=iCategoryManageDao.listCategorys();
		for(Category l: list) {
			if(l.getCategoryStatus()==1) {
				lists.add(l);
			}
		}
		return lists;
	}

	@Override
	public PageInfoVo findproductSearchList(String title, int pageNum, int pageSize) {
		PageInfoVo  pageInfoVo = new PageInfoVo<>();
		//List<Product> productList = new ArrayList<Product>();
		
		long total = iProductDao.productSearchListCount(title);
		System.out.println(total+"**********商品总数**********");
		
		pageInfoVo = getPage(total, pageNum, pageSize);
		
		List<Product> productList = iProductDao.productSearchList(title, (pageNum-1)*pageSize, pageSize);
		List<ProductVo> productVoList= new ArrayList<ProductVo>();
		for(Product p:productList){
			 List<Sales>salesList = iProductDao.findSale(p.getProductId());
			ProductVo productVo = new ProductVo();
			if(salesList.size() == 0){
				productVo.setProductSaleCount(0);
			}
			
			else{ 	
				Integer saCount=0;
				for(Sales sal:salesList){
					saCount+=sal.getSaleCount();
				}
				productVo.setProductSaleCount(saCount);
			
			}
			productVo.setProductId(p.getProductId());
			productVo.setProductName(p.getProductName());
			productVo.setMainPicture(p.getMainPicture());
			
			List<Object[]>priceList = iProductDao.getPriceScope(p.getProductId());
			Iterator iterator=priceList.iterator();
			while(iterator.hasNext()){
				 Object[] objects=(Object[]) iterator.next();
				 productVo.setProductMaxPrice((BigDecimal)objects[0]);
				 productVo.setProductMinPrice((BigDecimal)objects[1]); 
			}
			productVoList.add(productVo);
			
		}
		pageInfoVo.setList(productVoList);
		for(ProductVo VO:productVoList){
			System.out.println(VO+"***商品***");
		}
		return pageInfoVo;
	}
	
	@Override
	public PageInfoVo productGenreList(String status, int pageNum, int pageSize) {
		
		String jionString = status+"=1";
		PageInfoVo  pageInfoVo = new PageInfoVo<>();
		long total = iProductDao.productGenreListCount(jionString);
		pageInfoVo = getPage(total, pageNum, pageSize);
		
		System.out.println(jionString+"商品总数total");
		
		List<Product> productList =iProductDao.productGenreList(jionString, (pageNum - 1) * pageSize, pageSize);
	
		List<ProductVo> productVoList= new ArrayList<ProductVo>();
		
		for(Product p:productList){
			System.out.println(p+"**********");
			List<Sales>salesList = iProductDao.findSale(p.getProductId());
			ProductVo productVo = new ProductVo();
			if(salesList.size() == 0){
				productVo.setProductSaleCount(0);
			}
			
			else{ 	
				Integer saCount=0;
				for(Sales sal:salesList){
					saCount+=sal.getSaleCount();
				}
				productVo.setProductSaleCount(saCount);
			
			}
			productVo.setProductId(p.getProductId());
			productVo.setProductName(p.getProductName());
			productVo.setMainPicture(p.getMainPicture());
			
			List<Object[]>priceList = iProductDao.getPriceScope(p.getProductId());
			Iterator iterator=priceList.iterator();
			while(iterator.hasNext()){
				 Object[] objects=(Object[]) iterator.next();
				 productVo.setProductMaxPrice((BigDecimal)objects[0]);
				 productVo.setProductMinPrice((BigDecimal)objects[1]); 
			}
			productVoList.add(productVo);
			
		}
		pageInfoVo.setList(productVoList);
		for(ProductVo VO:productVoList){
			System.out.println(VO+"***商品***");
		}
		return pageInfoVo;
	}
	
	private PageInfoVo getPage(long total, Integer pageNum, Integer count) {
		PageInfoVo pageInfoVo = new PageInfoVo();
		long totalPage = total / count;
		if (total % count != 0) {
			totalPage += 1;
		}
		if (pageNum <= 1) {
			pageInfoVo.setHasPrePage(false);
			pageInfoVo.setPrePage(1);
		} else if (totalPage > 1) {
			pageInfoVo.setHasPrePage(true);
			pageInfoVo.setPrePage(pageNum - 1);
		}
		if (totalPage <= pageNum) {
			pageInfoVo.setHasNextPage(false);
			pageInfoVo.setNextpage(totalPage);
		} else if (totalPage >= 1) {
			pageInfoVo.setHasNextPage(true);
			pageInfoVo.setNextpage(pageNum + 1);
		}
		return pageInfoVo;
	}

	
	
	@Override
	public ProductDetailVo findproductDetailVo(String productId,String standardName,int pageNum, int pageSize ,String usid) {
		PageInfoVo  pageInfoVo = new PageInfoVo<>();
		ProductDetailVo productDetailVo = new ProductDetailVo();
		Product product = iProductDao.getProduct(productId);
		
		if(usid=="")productDetailVo.setCollectionStatus(0);
		else {
			Collection hasCollocetion=iShopCartDao.hasCollocetion(usid,productId);
			 if(hasCollocetion==null) {   
				 productDetailVo.setCollectionStatus(0);
			    }
			 else  productDetailVo.setCollectionStatus(1);
		}
		
         if(standardName==null||standardName==""){
        	List<Object[]>priceList = iProductDao.getPriceScope(product.getProductId());
 			Iterator iterator=priceList.iterator();
 			while(iterator.hasNext()){
 				Object[] objects=(Object[]) iterator.next();
 				productDetailVo.setProductMaxPrice((BigDecimal)objects[0]);
 				productDetailVo.setProductMinPrice((BigDecimal)objects[1]); 
 				if((BigDecimal)objects[0]!=(BigDecimal)objects[1])productDetailVo.setNameStatus(0);
 				//if(productDetailVo.getProductMaxPrice()!=productDetailVo.getProductMinPrice())productDetailVo.setNameStatus(0);
 				else productDetailVo.setNameStatus(1);
 				
 			}
 			
 			
		}
		List<Standard>standardList = iProductDao.findStandardList(productId);
		
		Integer count = 0;
		for(Standard s:standardList){
			count+=s.getStock();
		}
		
		List<Comment>commentList = iProductDao.findCommentList(productId);
		//List<User>userList = new ArrayList<>();
		List<CommentAndUserVo>commentAndUserList = new ArrayList<>();
		
		int lev = 0;
		int good=0;
		int mid=0;
		int bad=0;
if(commentList.size()>0){
		for(Comment co:commentList){
			
			lev+=co.getStarCount();
			
			if(co.getStarCount()==3)good+=1;
			if(co.getStarCount()==2)mid+=1;
			if(co.getStarCount()==1)bad+=1;
			
			CommentAndUserVo commentAndUserVo = new  CommentAndUserVo();
			BeanUtils.copyProperties(co, commentAndUserVo);
			
			User user = new User();
			user = iProductDao.getUser(co.getUserId());
			BeanUtils.copyProperties(user, commentAndUserVo);
			
			commentAndUserList.add(commentAndUserVo);
			
			Integer degree = (lev*100)/(commentList.size()*3);
			productDetailVo.setDegree(degree);
			productDetailVo.setGoodCount(good);
			productDetailVo.setMidCount(mid);
			productDetailVo.setBadCount(bad);
			productDetailVo.setCommentCount(commentList.size());
		}
		productDetailVo.setCommentAndUserList(commentAndUserList);
	}
else{
	productDetailVo.setDegree(0);
	productDetailVo.setGoodCount(0);
	productDetailVo.setMidCount(0);
	productDetailVo.setBadCount(0);
	productDetailVo.setCommentCount(commentList.size());
}
		
		Category category = iProductDao.getCategory(product.getCategoryId());
		
		List<Product>productList = iProductDao.findproductCateList(productId, category.getCategoryId());
		
		List<ProductVo> productVoList= new ArrayList<ProductVo>();
		for(Product p:productList){
			 List<Sales>salesList = iProductDao.findSale(p.getProductId());
			ProductVo productVo = new ProductVo();
			if(salesList.size() == 0){
				productVo.setProductSaleCount(0);
			}
			
			else{ 	
				Integer saCount=0;
				for(Sales sal:salesList){
					saCount+=sal.getSaleCount();
				}
				productVo.setProductSaleCount(saCount);
			
			}
			productVo.setProductId(p.getProductId());
			productVo.setProductName(p.getProductName());
			productVo.setMainPicture(p.getMainPicture());
			
			List<Object[]>priceList = iProductDao.getPriceScope(p.getProductId());
			Iterator iterator=priceList.iterator();
			while(iterator.hasNext()){
				 Object[] objects=(Object[]) iterator.next();
				 productVo.setProductMaxPrice((BigDecimal)objects[0]);
				 productVo.setProductMinPrice((BigDecimal)objects[1]); 
			}
			productVoList.add(productVo);
			
		}
		
		productDetailVo.setProductList(productVoList);
		
		
		
		
		List<Sales>salesList = iProductDao.findSale(productId);
		if(salesList.size() == 0){
			productDetailVo.setProductSaleCount(0);
			productDetailVo.setProductMonthCount(0);
		}
		
		else{ 	
			Integer saCount=0;
			Integer monthCount=0;
			for(Sales sal:salesList){
				saCount+=sal.getSaleCount();
				
			}
			monthCount = saCount/salesList.size();
			productDetailVo.setProductSaleCount(saCount);
			productDetailVo.setProductMonthCount(monthCount);
		
		}
		
		
		BeanUtils.copyProperties(product, productDetailVo);
		
		
		productDetailVo.setStandardList(standardList);
		
		//productDetailVo.setCommentList(commentList);
		
		
		
		
		
		productDetailVo.setCategoryName(category.getCategoryName());
		
		
		
	
		
		
		productDetailVo.setStockCount(count);
		
		String smallPicture = product.getSmallPicture();
		String details = product.getDetails();
		productDetailVo.setSmallPictureList(Splitter.on(",").trimResults().splitToList(smallPicture));
		productDetailVo.setDetailsList(Splitter.on(",").trimResults().splitToList(details));
		
		//System.out.println(productDetailVo);
		return productDetailVo;
	}

	@Override
	public void addShopcart(String userId,String productId,String standardName,int count) {
		 ShopCart shopCart2=iProductDao.shopCartIsIn(userId, productId, standardName);
		 if(shopCart2!=null){
			 shopCart2.setProductCount((count+shopCart2.getProductCount()));
			 iProductDao.updateShopCart(shopCart2);
		 }
		 else{
		 ShopCart shopCart = new ShopCart();
		 shopCart.setUserId(userId);
		 shopCart.setProductCount(count);
		 shopCart.setProductId(productId);
		 shopCart.setStandardName(standardName);
		 iProductDao.addShopcart(shopCart);
		 }
		
	}

	@Override
	public PageInfoVo findProductList(int pageNum, int pageSize) {
		PageInfoVo  pageInfoVo = new PageInfoVo<>();

		
		long total = iProductDao.productListCount();
		System.out.println("商品总数");
		System.out.println(total+"**********商品总数**********");
		
		pageInfoVo = getPage(total, pageNum, pageSize);
		
		List<Product> productList = iProductDao.productList((pageNum - 1) * pageSize, pageSize);
		
		List<ProductVo> productVoList= new ArrayList<ProductVo>();
		for(Product p:productList){
			
			 List<Sales>salesList = iProductDao.findSale(p.getProductId());
			
			ProductVo productVo = new ProductVo();
			if(salesList.size() == 0){
				productVo.setProductSaleCount(0);
			}
			
			else{ 	
				Integer saCount=0;
				for(Sales sal:salesList){
					saCount+=sal.getSaleCount();
				}
				productVo.setProductSaleCount(saCount);
			
			}

			
			productVo.setProductId(p.getProductId());
			productVo.setProductName(p.getProductName());
			productVo.setMainPicture(p.getMainPicture());
		
			
			List<Object[]>priceList = iProductDao.getPriceScope(p.getProductId());
			Iterator iterator=priceList.iterator();
			while(iterator.hasNext()){
				 Object[] objects=(Object[]) iterator.next();
				 productVo.setProductMaxPrice((BigDecimal)objects[0]);
				 productVo.setProductMinPrice((BigDecimal)objects[1]); 
			}
			productVoList.add(productVo);
			
		}
		pageInfoVo.setList(productVoList);
		for(ProductVo VO:productVoList){
			System.out.println(VO+"***商品***");
		}
		return pageInfoVo;
	}

	@Override
	public PageInfoVo productSortList(int categoryId, int pageNum, int pageSize) {
		
         PageInfoVo  pageInfoVo = new PageInfoVo<>();

		
		long total = iProductDao.productSortListCount(categoryId);
		
		System.out.println("商品总数");
		System.out.println(total+"**********商品总数**********");
		
		pageInfoVo = getPage(total, pageNum, pageSize);
		
		List<Product> productList = iProductDao.productSortList(categoryId, (pageNum-1)*pageSize, pageSize);
		
		List<ProductVo> productVoList= new ArrayList<ProductVo>();
		for(Product p:productList){
			
			 List<Sales>salesList = iProductDao.findSale(p.getProductId());
			
			ProductVo productVo = new ProductVo();
			if(salesList.size() == 0){
				productVo.setProductSaleCount(0);
			}
			
			else{ 	
				Integer saCount=0;
				for(Sales sal:salesList){
					saCount+=sal.getSaleCount();
				}
				productVo.setProductSaleCount(saCount);
			
			}

			
			productVo.setProductId(p.getProductId());
			productVo.setProductName(p.getProductName());
			productVo.setMainPicture(p.getMainPicture());
		
			
			List<Object[]>priceList = iProductDao.getPriceScope(p.getProductId());
			Iterator iterator=priceList.iterator();
			while(iterator.hasNext()){
				 Object[] objects=(Object[]) iterator.next();
				 productVo.setProductMaxPrice((BigDecimal)objects[0]);
				 productVo.setProductMinPrice((BigDecimal)objects[1]); 
			}
			productVoList.add(productVo);
			
		}
		pageInfoVo.setList(productVoList);
		for(ProductVo VO:productVoList){
			System.out.println(VO+"***商品***");
		}
		return pageInfoVo;
	}

	@Override
	public ResVo getShopCartCount(String userId) {
		ResVo resVo = new ResVo();
		resVo.setShopCartCount(iProductDao.getShopCartCount(userId));
		return resVo;
	}

	@Override
	public List<Product> findProductRecommend() {
		Date date = new Date();
		String dateStr = DateAndStringUtil.dateAndStringFormatter(date, "yyyy-MM-dd");
		String [] dateStrs = dateStr.split("-");
		List<Sales> salesList = iProductDao.findSaleOrderByDesc(dateStrs[0],dateStrs[1]);
		if(salesList != null) {
			List<Product> productList = new ArrayList<>();
			for(Sales sales : salesList) {
				Product product = iProductDao.getProduct(sales.getProductId());
				if(product != null) {
					productList.add(product);
				}
			}
			return productList;
		}
		return null;
	}

	@Override
	public List<Product> findnewProductRecommend() {
		return iProductDao.findnewProductRecommend();
	}

	@Override
	public List<ProductVo> findBestSeller() {
		List<ProductVo> productVoList = null;
		List<Sales> salesList = (List<Sales>)iProductDao.findSales();
		if(salesList != null) {
			productVoList = new ArrayList<>();
			for(Sales sales : salesList) {
				Product product = iProductDao.getProduct(sales.getProductId());
				ProductVo productVo=null;
				if(product != null) {
					productVo = new ProductVo();
					productVo.setProductId(product.getProductId());
					productVo.setProductName(product.getProductName());
					productVo.setMainPicture(product.getMainPicture());
					List<Sales> tempSalesList = iProductDao.findSale(product.getProductId());
					if(tempSalesList.size() == 0){
						productVo.setProductSaleCount(0);
					}
					else{ 	
						Integer saCount=0;
						for(Sales sal:salesList){
							saCount+=sal.getSaleCount();
						}
						productVo.setProductSaleCount(saCount);
					
					}
					List<Object[]> priceList =  iProductDao.getPriceScope(product.getProductId());
					Iterator iterator=priceList.iterator();
					while(iterator.hasNext()){
						 Object[] objects=(Object[]) iterator.next();
						 productVo.setProductMaxPrice((BigDecimal)objects[0]);
						 productVo.setProductMinPrice((BigDecimal)objects[1]); 
					}
				}
				productVoList.add(productVo);
			}
		}
		return productVoList;
	}
}
