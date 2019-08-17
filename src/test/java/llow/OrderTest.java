package llow;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nike.llow.domain.OrderDetail;
import com.nike.llow.service.IOrderService;
import com.nike.llow.vo.OrderInfoVo;
import com.nike.llow.vo.OrderVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class OrderTest {
	
	@Autowired
	private IOrderService iOrderService;
	
	@Test
	public void test() {
		List<OrderInfoVo> orderInfoVos = iOrderService.findAllList();
		System.out.println(orderInfoVos);
	}
	
	@Test
	public void findTest() {
		System.out.println(iOrderService.findByOrderDetail(2).getAddress().toString());
	}
	
	@Test
	public void saveOrder() {
		String shopCartIds = "145,146";
		OrderVo orderVo = iOrderService.saveOrder(shopCartIds, "llowid_9828d300");
		for(OrderDetail orderDetail : orderVo.getOrderDetailList()) {
			System.out.println(orderDetail);
		}
	}

}
