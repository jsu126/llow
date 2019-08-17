package com.nike.llow.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.base.Splitter;
import com.nike.llow.dao.IProductManageDao;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Standard;
import com.nike.llow.service.IProductManageService;
import com.nike.llow.util.IdUtil;
import com.nike.llow.vo.ProductAndStandardVo;
import com.nike.llow.vo.ProductInfoVo;
import com.nike.llow.vo.ProductVo;
import com.nike.llow.vo.ResVo;



@Service
@Transactional
public class ProductManageServiceImpl implements IProductManageService {

	@Autowired
	private IProductManageDao iProductManageDao;

	@Override
	public List<Product> findListProducts() {
		
		return iProductManageDao.findAllProduct();
	}

	@Override
	public ProductVo getProductVo(String pid) {
		Product product = iProductManageDao.getProduct(pid);
		ProductVo productVo = new ProductVo();
		BeanUtils.copyProperties(product, productVo);
		List<Standard> standardList = iProductManageDao.getStandard(pid);
		productVo.setStandardList(standardList);
		System.out.println(productVo+"**productVo**");
		return productVo;
	}

	@Override
	public void saveProduct(ProductInfoVo productInfoVo) {
		Product product = new Product();
		if(productInfoVo != null) {
			BeanUtils.copyProperties(productInfoVo, product);
			product.setMainPicture(productInfoVo.getSmallPicture().substring(0, productInfoVo.getSmallPicture().indexOf(",")));
			product.setProductId(IdUtil.getProductId());
			iProductManageDao.saveProduct(product);
			String [] standardNames = productInfoVo.getStandardNames();
			int [] stocks = productInfoVo.getStocks();
			double[] prices = productInfoVo.getPrices();
			for(int i = 0; i < standardNames.length; i++) {
				Standard standard = new Standard();
				standard.setProductId(product.getProductId());
				standard.setStandardName(standardNames[i]);
				standard.setStock(stocks[i]);
				standard.setPrice(new BigDecimal(prices[i]));
				iProductManageDao.saveStandard(standard);
			}
		}
	}	

	@Override
	public void updateProductStatus(Product product) {
		if(product.getStatus()==1)product.setStatus(0);
		else if(product.getStatus()==0)product.setStatus(1);
		iProductManageDao.updateProduct(product);
		
	}

	@Override
	public Product getProduct(String pid) {
		
		return iProductManageDao.getProduct(pid);
	}

	@Override
	public ResVo deleteProduct(Product product) {
		ResVo resVo = new ResVo();
		if(product.getStatus()!=2)product.setStatus(2);
		else product.setStatus(1);
		iProductManageDao.updateProduct(product);
		
		resVo.setMsg("删除商品成功");
		resVo.setOk(true);
		return resVo;
	}

	@Override
	public ProductAndStandardVo getProductInfo(String pid) {
		Product product = iProductManageDao.getProduct(pid);
		List<Standard> standardList = iProductManageDao.getStandard(pid);
		ProductAndStandardVo productAndStandardVo = new ProductAndStandardVo();
		BeanUtils.copyProperties(product, productAndStandardVo);
		String smallPicture = product.getSmallPicture();
		String details = product.getDetails();
		productAndStandardVo.setStandardList(standardList);
		productAndStandardVo.setSmallPictureList(Splitter.on(",").trimResults().splitToList(smallPicture));
		productAndStandardVo.setDetailsList(Splitter.on(",").trimResults().splitToList(details));
		return productAndStandardVo;
	}

	@Override
	public void updateProduct(ProductInfoVo productInfoVo) {
		
		
		
		Product result = iProductManageDao.getProduct(productInfoVo.getProductId());
		if(result != null) {
			iProductManageDao.deleteProduct(result);
			Product product = new Product();
			if(productInfoVo != null) {
				BeanUtils.copyProperties(productInfoVo, product);
				product.setMainPicture(productInfoVo.getSmallPicture().substring(0, productInfoVo.getSmallPicture().indexOf(",")));
				product.setProductId(productInfoVo.getProductId());
				iProductManageDao.saveProduct(product);
				String [] standardNames = productInfoVo.getStandardNames();
				int [] stocks = productInfoVo.getStocks();
				double[] prices = productInfoVo.getPrices();
				for(int i = 0; i < standardNames.length; i++) {
					Standard standard = new Standard();
					standard.setProductId(product.getProductId());
					standard.setStandardName(standardNames[i]);
					standard.setStock(stocks[i]);
					standard.setPrice(new BigDecimal(prices[i]));
					iProductManageDao.saveStandard(standard);
				}
			}
		}
		}

	@Override
	public Long countProduct() {
		return iProductManageDao.countProduct();
	}

	@Override
	public List<Long> countCommentList(String pid) {
		List<Long> countComment = new ArrayList<Long>();
		long count;
		count = iProductManageDao.countComment(pid,3);
		countComment.add(count);
		count = iProductManageDao.countComment(pid,2);
		countComment.add(count);
		count = iProductManageDao.countComment(pid,1);
		countComment.add(count);
		return countComment;
	}

	@Override
	public List<Long> countSales(String year) {
		String [] months = {"01","02","03","04","05","06","07","08","09","10","11","12"};
		List<Long> salesCount = new ArrayList<>();
		for(String month : months) {
			long count = iProductManageDao.countSales(year,month);
			salesCount.add(count);
		}
		return salesCount;
	}

	@Override
	public List<Object> findListSalesYear() {
		List<Object> tempList = iProductManageDao.findListSalesYear();
		return tempList;
	}
		
}
