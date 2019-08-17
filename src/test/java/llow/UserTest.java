package llow;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.nike.llow.domain.User;
import com.nike.llow.service.IUserManageService;
import com.nike.llow.service.IUserService;
import com.nike.llow.util.DateAndStringUtil;
import com.nike.llow.util.IdUtil;
import com.nike.llow.util.Md5Util;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserTest {
	
	@Autowired
	private IUserService iUserService;
	
	@Autowired
	private IUserManageService iUserManageService;
	
	@Test
	public void saveUserTest() {
		String[] citys={"北京","天津","上海","重庆","河北","河南","云南","辽宁","黑龙江","湖南","安徽","山东","新疆","江苏","浙江","江西","湖北","广西","甘肃","山西","内蒙古","陕西","吉林","福建","贵州","广东","青海","西藏","四川","宁夏","海南","台湾","香港","澳门"};
		String [] sexs = {"男","女"};
		for(int i = 0; i < 1; i++) {
			Random r = new Random();
			int k = r.nextInt(34);
			User user = new User();
			user.setUserId(IdUtil.getId());
			user.setEmail("1@qq.com");
			user.setPassword("jsu12345");
			user.setCity(citys[k]);
			//user.setCity("黑龙江");
			user.setSex("女");
			user.setRegisterTime(DateAndStringUtil.dateAndStringFormatter(new Date(), "yyyy-MM-dd HH:mm:ss"));
			iUserService.saveEmaiRegister(user);
		}
		
		}
	@Test
	public void loginUserTest() {
		User user = new User();
		user.setUsername("djhasgdhaghfa");
		user.setPassword("12345");
		System.out.println(iUserService.checkLogin(user) +"iUserService.checkLogin(user)");
	}
	
	@Test
	public void countTest() {
		System.out.println(iUserService.countUser());
	}
	@Test
	public void regionCount() {
		List<Long> counts = iUserManageService.countUserRegion();
		for(Long count : counts) {
			System.out.println(count);
		}
	}
}
