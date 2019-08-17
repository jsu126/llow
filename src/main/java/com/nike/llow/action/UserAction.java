package com.nike.llow.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.transaction.Synchronization;

import org.apache.logging.log4j.core.appender.rolling.SizeBasedTriggeringPolicy;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nike.llow.domain.Address;
import com.nike.llow.domain.Certification;
import com.nike.llow.domain.Collection;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Standard;
import com.nike.llow.domain.User;
import com.nike.llow.service.IFileUploadService;
import com.nike.llow.service.IUserService;

import com.nike.llow.util.MailUtil;
import com.nike.llow.util.RandomNumberUtil;
import com.nike.llow.util.SendMessagesUtil;
import com.nike.llow.vo.CProductVo;
import com.nike.llow.vo.ResponseResult;

import com.nike.llow.util.CodeUtil;
import com.nike.llow.util.RandomNumberUtil;
import com.nike.llow.vo.UserInfoVo;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ResolverUtil.NameEndsWith;

import jdk.management.resource.internal.inst.StaticInstrumentation;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class UserAction extends ActionSupport implements ModelDriven<User>, SessionAware {

	private Map<String, Object> session;
	private User tempUser = new User();
	private File image;
	private String imageContentType;
	private Product product;
	private Standard standard;
	private CProductVo cProductVo;

	private Integer usercode;
	private Integer newcode;
	private ResponseResult responseResult;

//	private List<CProductVo> cProductList;
	private List<Product> productList;
	private List<Standard> standardList;
	private String productId;

	private User user1;
    private User user2;
    private String newPhone;
    private String oneEmail;
	
	private String oldPassword;
	private String newPassword;


	private String imageFileName;
	private File idCardImagez;
	private String idCardImagezContentType;
	private String idCardImagezFileName;
	private File idCardImagef;
	private String idCardImagefContentType;
	private String idCardImagefFileName;
	private String realName;
	private String idCard;
	
	private String bindPhoneCode;
	private String bindPhone;

	private Certification certification;
	private String result;
	private String outcome;
	private InputStream inputStream;
	@Autowired
	private IUserService iUserService;
	@Autowired
	private IFileUploadService iFileUploadService;

	
	
	
	
	
	public String toBindOnePhone(){
		//User user1=new User();
		user1=iUserService.hasPhone(newPhone);
		return "success";
	}
	
	public String bindOnePhone(){
		Integer oldCode = (Integer) session.get("code");
		UserInfoVo loginUser = (UserInfoVo) session.get("user");
		System.out.println(tempUser + "========>");
		User tempUser = null;
		if (loginUser != null) {
			tempUser = new User();
			BeanUtils.copyProperties(loginUser, tempUser);
		}
		
		responseResult= iUserService.updateBindPhone(tempUser,newPhone,usercode,oldCode);
		return "success";
	}
	/**
	 * 获取旧手机验证码
	 * 
	 * @return
	 */
	public String phoneCode() {
		int code = RandomNumberUtil.code();
		session.put("code", code);
		System.out.println("code是" + code);
		System.out.println(tempUser.getPhone()+"------------------第一个手机号码");
		SendMessagesUtil.sendCode(tempUser.getPhone(), "SMS_171858892", code);
		Object object=new Object();
		responseResult=new ResponseResult<>(object);
		responseResult.setMsg("发送成功");
		/*
		 * if(SendMessagesUtil.sendCode(user.getPhone(), "SMS_171858895",
		 * code).equals("ok")){ System.out.println("发送成功");
		 * 
		 * }else{ responseResult.setMsg("验证码发送失败"); }
		 */
		return "success";
	}

	/**
	 * 获取新手机的验证码
	 * 
	 * @return
	 */
	public String newPhoneCode() {
		Integer oldCode1 = (Integer) session.get("code");
		int code = RandomNumberUtil.code();
		session.put("code", code);
		System.out.println("这个第二个验证码"+code);
		System.out.println(tempUser.getPhone()+"--------------->第二个手机号码");
		SendMessagesUtil.sendCode(tempUser.getPhone(), "SMS_171858892", code);
	    session.put("newPhoneNumber",tempUser.getPhone());
		// responseResult = iUserService.getNewPhone(user, usercode,
		// oldCode,user.getPhone());
		responseResult = iUserService.getNewPhone(tempUser, usercode, oldCode1);
		if(responseResult.getCode()==1){
			session.put("code", oldCode1);
		}
		if (responseResult.getDate() == null&&responseResult.getCode()!=1) {
			// SendMessagesUtil.sendCode(user.getPhone(), "SMS_171858895",
			// code);
		}
		return "success";
	}

	/**
	 * 更换绑定手机号
	 * 
	 * @return
	 */
	public String updateNewPhone() {
		Integer oldCode2 = (Integer) session.get("code");
	  
		System.out.println("第二个验证码为(验证是否正确)" + newcode);
		System.out.println("user的新号码" + tempUser.getPhone());
		responseResult = iUserService.updateNewPhone(tempUser, newcode, oldCode2, tempUser.getPhone());
		 UserInfoVo users=(UserInfoVo) session.get("user");
		  UserInfoVo userInfoVo=iUserService.getUser(users.getUserId());
		  session.put("user",userInfoVo);

		return "success";

	}

	public String bindPhone() {

		UserInfoVo loginUser = (UserInfoVo) session.get("user");
		System.out.println(tempUser + "========>");
		User tempUser = null;
		if (loginUser != null) {
			tempUser = new User();
			BeanUtils.copyProperties(loginUser, tempUser);
		}
		tempUser = iUserService.getByUser(tempUser);
		return "success";

	}

	public String safety() {
		UserInfoVo loginUser = (UserInfoVo) session.get("user");
		System.out.println(tempUser + "safety========>");
		User tempUser = null;
		if (loginUser != null) {
			tempUser = new User();
			BeanUtils.copyProperties(loginUser, tempUser);
		}
		tempUser = iUserService.getByUser(tempUser);

		return "success";
	}

	public String email() {
		return "success";
	}

	public String toBindOneEmail(){
//		User user2=new User();
		System.out.println("oneEmail"+oneEmail);
		user2=iUserService.hasEmail(oneEmail);
		 UserInfoVo users=(UserInfoVo) session.get("user");
		 UserInfoVo userInfoVo=iUserService.getUser(users.getUserId());
		 session.put("user",userInfoVo);
		return "success";
	}
	/**
	 * 发送邮箱验证码
	 * 
	 * @return
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public String emailCode() throws AddressException, MessagingException {

		int code = RandomNumberUtil.code();
		session.put("code", code);
		MailUtil.sendMail(tempUser.getEmail(),
				"【礼来我网】尊敬的用户：您好！您的礼来我网账户绑定的邮箱为" + tempUser.getEmail() + ",验证码：" + code + "。如非本人操作,请忽略此邮件。", "更换邮箱");
		return "success";
	}

	/**
	 * 更新绑定邮箱
	 * 
	 * @return
	 */
	public String updateNewEmail() {
		System.out.println(tempUser + "==============>user");
		System.out.println("需要验证验证码是否正确");
		Integer oldCode = (Integer) session.get("code");
		responseResult = iUserService.updateEmail(tempUser, usercode, oldCode, tempUser.getEmail());
		 UserInfoVo users=(UserInfoVo) session.get("user");
		 users.setEmail(tempUser.getEmail());
		 session.put("user",users);
		System.out.println(responseResult + "-------->");
		return "success";

	}

	/**
	 * 上传头像
	 * 
	 * @return
	 */
	public String uploadPicture() {
		ServletContext servletContext = ServletActionContext.getServletContext();
		String path = servletContext.getRealPath("/upload");
		String isSuccess = iFileUploadService.uploadFile(path, imageFileName, image);
		if (isSuccess != null) {
			UserInfoVo loginUser = (UserInfoVo) session.get("user");
			User user = new User();
			if(loginUser != null) {
				BeanUtils.copyProperties(loginUser,user);
				result = "http://image.stodger.club/images/" + isSuccess;
				iUserService.updateUserPicture(user, result);
			}
			

		} else {
			result = "No";
		}

		return "picture";
	}

	/**
	 * 上传身份证
	 * 
	 * @return
	 */
	public String uploadIdCard() {
		ServletContext servletContext = ServletActionContext.getServletContext();
		String path = servletContext.getRealPath("/upload");
		File[] idCardImage = { idCardImagez, idCardImagef };
		String[] idCardImageFileName = { idCardImagezFileName, idCardImagefFileName };
		System.out.println(idCardImagezFileName + "=============>idCardImagezFileName");
		UserInfoVo user = (UserInfoVo) session.get("user");
		// certification =
		// iUserService.saveCertification(path,idCardImage,idCardImageFileName,user.getUserId());
		certification = iUserService.saveCertification(path, idCardImage, idCardImageFileName, user.getUserId());
		return "idCard";

	}

	/**
	 * @return
	 */
	public String updateIdCardInfo() {
		UserInfoVo user = (UserInfoVo) session.get("user");
		result = iUserService.updateCertification(user.getUserId(), realName, idCard);
		return SUCCESS;
	}

	/**
	 * 更新用户
	 * 
	 * @return
	 */
	public String updateInfo() {
		UserInfoVo loginUser = (UserInfoVo) session.get("user");
		// User result = iUserService.updateUser(loginUser.getUserId(), user);
		UserInfoVo result = iUserService.updateUser(loginUser.getUserId(), tempUser);
		System.out.println(result + "=================================result");
		if (result != null) {
			session.put("user", result);
		}
		return SUCCESS;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return tempUser;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	/**
	 * 判断是否邮箱已经存在
	 * 
	 * @return
	 */
	public String emailRegisterFont() {
		int num;
        System.out.println(tempUser.getEmail()+"---------------------->");
      
        	 num = iUserService.emailRegisterFont(tempUser.getEmail());
        
		System.out.println(num+"--------------------------num");
		if (num == 0) {
			outcome = "";
			return "success";
		} else {
			outcome = "1";
			return "error";
		}
	}

	/**
	 * 保存邮箱注册的用户
	 * 
	 * @return
	 */
	public String emailRegister() {
		iUserService.saveEmaiRegister(tempUser);
		outcome = "";
		return "success";
	}

	/**
	 * 判断是否电话已经存在
	 * 
	 * @return
	 */
	public String phoneRegisterFont() {
		int num = iUserService.phoneRegisterFont(tempUser.getPhone());
		if (num == 0) {
			outcome = "";
			return "success";
		} else {
			outcome = "1";
			return "error";
		}
	}

	/**
	 * 发送验证码
	 * 
	 * @return
	 */
	public String sendCode() {
		UserInfoVo target = new UserInfoVo();
		System.out.println(tempUser.getAge());
		BeanUtils.copyProperties(tempUser, target);
		if (target.getAge() == 1) {
			System.out.println(target.getPhone() + "用户电话号码%%%%%%%%%%%%%%%%%%%%%%%%%%");
			int codeNumber = RandomNumberUtil.code();
			System.out.println(codeNumber + "随机号码%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
			session.put("codeNumber", codeNumber);
			iUserService.sendCode(target, codeNumber);
			outcome = "发送验证码成功";
			return "suceess";
		}
		outcome = "发送验证码失败";
		return "error";

	}

	/**
	 * 保存电话注册的用户
	 * 
	 * @return
	 */
	public String phoneRegister() {
		System.out.println(tempUser.getAge() + "用户输入的验证码&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
		int sessionCode = (int) session.get("codeNumber");
		System.out.println(sessionCode + "session的验证码%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
		if (tempUser.getAge() == sessionCode) {
			iUserService.savePhoneRegister(tempUser);
			outcome = "";
			return "success";
		}
		return "error";

	}

	/**
	 * 获取登录的验证码
	 * 
	 * @return
	 */
	public String getImage() {
		Map<Integer, BufferedImage> imageMap = CodeUtil.getArithmeticVerifyCode();
		Integer key = imageMap.keySet().iterator().next();
		System.out.println(key);
		session.put("code", key);
		BufferedImage bufferedImage = imageMap.get(key);
		inputStream = CodeUtil.image(bufferedImage);
		return SUCCESS;
	}
	/**
	 * 退出
	 * @return
	 */
	public String exit() {
		session.clear();
		return SUCCESS;
	}

	/**
	 * 登录
	 * 
	 * @return
	 */
	public String userLogin() {
		UserInfoVo loginUser = iUserService.checkLogin(tempUser);
		int key = (int) session.get("code");
		System.out.println(key + "===========>key");
		System.out.println(loginUser + "===========>loginUser1");
		if (loginUser != null && tempUser.getAge() == key) {
			outcome = "";
			session.put("user", loginUser);
			System.out.println(loginUser + "=================================loginUser2");
			return SUCCESS;
		} else {
			outcome = "账号或者密码错误";
			return "error";
		}
	}
	
	public String collection(){
		System.out.println("进入collection方法");
		UserInfoVo loginUser = (UserInfoVo) session.get("user");
	
		System.out.println(tempUser + "========>");
		User tempUser = null;
		if (loginUser != null) {
			tempUser = new User();
			BeanUtils.copyProperties(loginUser, tempUser);
		}
		tempUser = iUserService.getByUser(tempUser);
		List<Collection> collectionList=new ArrayList<Collection>();
		collectionList=iUserService.listCollectionByUser(tempUser);
//		List<CProductVo> cProductList=new ArrayList<CProductVo>();
		List<Product> productList=new ArrayList<Product>();
		List<Standard> standardList=new ArrayList<Standard>();
		for(Collection col:collectionList){
			Product product=new Product();
			CProductVo cProductVo=new CProductVo();
			product=iUserService.getCProduct(col.getProductId());
			Standard standard=iUserService.getStandardByProduct(product);
			productList.add(product);
			standardList.add(standard);
			
			
		}
		setProductList(productList);
		setStandardList(standardList);
		return "success";
	}
	public String toMoveCProduct(){
		System.out.println("这个tomove方法");
		System.out.println("这个productId是"+productId);
		UserInfoVo user = (UserInfoVo) session.get("user");
		Collection collection=new Collection();
		System.out.println("这个collection的信息"+collection.getUserId());
		collection=iUserService.getCollection(productId,user.getUserId());
		responseResult=iUserService.deleteCProduct(collection);
		return "success";
	}
	
	public String checkCertification() {
		UserInfoVo userInfoVo = (UserInfoVo)session.get("user");
		if(userInfoVo != null) {
			result = iUserService.checkCertification(userInfoVo.getUserId());
		}else {
			result = "no";
		}
		return SUCCESS;
		
	}

	/**
	 * 更新用戶的密碼
	 * @return
	 */
	public String updateModifyPassword() {
		UserInfoVo userInfoVo=(UserInfoVo) session.get("user");	
		Integer saveOk=iUserService.updateModifyPassword(userInfoVo,oldPassword,newPassword);
		if(saveOk==1) {
			outcome="修改当前用户的密码成功";   
			return "success";
		}else {
			outcome="error";   
			return "success";
		}	
		
	}
	
	
	public String saveBindPhone() {
		
		Integer sessionCode=(Integer) session.get("codeNumber");
		UserInfoVo userInfoVo=(UserInfoVo) session.get("user");
		System.out.println(bindPhone+"----------------bindPhone");
		System.out.println(bindPhoneCode+"----------------bindPhoneCode");
		System.out.println(sessionCode+"---------------------sessionCode");
		String newSessionCode=sessionCode+"";
		if(newSessionCode.equals(bindPhoneCode)) {
			iUserService.saveBindPhone(userInfoVo,bindPhone);
			userInfoVo.setPhone(bindPhone);
			session.put("user", userInfoVo);
			outcome="";
			return SUCCESS;
		}else {
			outcome="验证码错误";
			return SUCCESS;
			
		}

		
	}



}
