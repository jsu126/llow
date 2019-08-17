package llow;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nike.llow.dao.IProductDao;
import com.nike.llow.domain.Product;
import com.nike.llow.service.IProductManageService;
import com.nike.llow.service.IProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class ProductTest {
	
	@Autowired
	private IProductService iProductService;
	
	@Autowired
	private IProductManageService iProductManageService;
	
	@Test
	public void test(){
		iProductService.findproductSearchList("手机", 1, 10);
	}
	
	@Test
	public void countTest() {
		List<Long> list = iProductManageService.countSales("2019");
		System.out.println(list + "===========test");
		for(Long l : list) {
			System.out.println(l);
		}
	}
	
	@Test
	public void yearTest() {
		List<Object> list = iProductManageService.findListSalesYear();
		for(Object str : list) {
			System.out.println(str);
		}
	}
	
	@Test
	public void salesTest() {
		List<Product> productList = iProductService.findProductRecommend();
		for(Product product : productList) {
			System.out.println(product);
		}
	}
	@Test
	public void newTest() {
		List<Product> productList = iProductService.findnewProductRecommend();
		for(Product product : productList) {
			System.out.println(product);
		}
	}
}
