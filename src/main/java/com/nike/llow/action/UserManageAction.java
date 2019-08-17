package com.nike.llow.action;



import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.boot.jaxb.hbm.spi.PluralAttributeInfoPrimitiveArrayAdapter;
import org.hibernate.procedure.internal.Util.ResultClassesResolutionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nike.llow.domain.User;
import com.nike.llow.service.IUserManageService;
import com.nike.llow.service.IUserService;
import com.nike.llow.util.CodeUtil;
import com.nike.llow.util.ExportExcelUtil;
import com.nike.llow.util.MailUtil;
import com.nike.llow.vo.CertificationVo;
import com.nike.llow.vo.PageInfoVo;
import com.nike.llow.vo.ResVo;
import com.nike.llow.vo.ResponseResult;
import com.nike.llow.vo.UserInfoVo;
import com.nike.llow.vo.UserVo;
import com.opensymphony.xwork2.ActionSupport;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class UserManageAction extends ActionSupport implements SessionAware{
	
	private Map<String, Object> session;
	private PageInfoVo pageInfoVo;
	private Integer pageNum;
	private User user;
	private String uid;
	private String email;
	private ResponseResult responseResult;
	private ResVo resVo;
	private String option;
	private String fileName;
	private ByteArrayInputStream excelStream;

	private InputStream inputStream;
	private String adminName;
	private String password;
	private String charCode;
	private String outcome;
	
	private Integer certificationId;
	private Integer certificationStatus;
	
	private Long result;
	
	private String searchStartTime;
	private String searchEndTime;
	private String searchCity;
	

    List<User> userLists = new ArrayList<>();
    
    List<Long> genderList = new ArrayList<>();
    List<Long> userGegionList = new ArrayList<>();
    
    List<CertificationVo> certificationVoList;
	

			
	@Autowired
	public IUserManageService iUserManageService;
	@Autowired
	public IUserService iUserService;
	
	
	/**
	 * 显示所有用户
	 * @return
	 */
	public String userList(){
		userLists = iUserManageService.findUsers();
		//session.put("userLists", userLists);
		for(User us:userLists){
			System.out.println(us);
		}
		return SUCCESS;
	}
	
	public String userSearch(){
		System.out.println(searchStartTime+"开始时间"+searchEndTime+"结束时间"+searchCity+"城市");
		userLists = iUserManageService.findSearchUsers(searchStartTime, searchEndTime, searchCity);
		return SUCCESS;
	}

	/**
	 * 用户信息
	 * @return
	 */
	public String userInfo(){
		user = iUserManageService.getUser(uid);
		System.out.println(user);
		return SUCCESS;
	}
	/**
	 * 删除用户
	 * @return
	 */
	public String deleteUser(){
		user = iUserManageService.getUser(uid);
		
		resVo=iUserManageService.deleteUser(user);	
		return SUCCESS;
	}
	/**
	 * 初始化密码
	 * @return
	 * @throws AddressException
	 * @throws MessagingException
	 */
	public String initialPassword() throws AddressException, MessagingException{
		responseResult = iUserManageService.updateUserPassword(uid);
		if(!"".equals(responseResult.getMsg())){
			MailUtil.sendMail(email, responseResult.getMsg(),"初始密码");
		}
		return SUCCESS;
	}
	
	/**
	 * 导出数据
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String exportData() throws UnsupportedEncodingException{
		ExportExcelUtil<UserVo> ex = new ExportExcelUtil<>();
		String [] headers = {"用户ID","用户名","性别","生日","注册时间","手机号","邮箱","年龄","地址"};
		List<UserVo>userVoList = null;
		if(option==null){
			userVoList = iUserManageService.findUserAll();
		}else{
			String[] options = option.split(",");
			userVoList = iUserManageService.findListByUserIds(options);
			option =null;
		}
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String title="用户数据"+dateFormat.format(date);
		ex.exportExcel("用户数据",headers,userVoList,out);
		fileName = new String (title.getBytes("utf-8"),"ISO8859-1")+".xls";
		excelStream = new ByteArrayInputStream(out.toByteArray());

		return "exportExcel";
	}
	
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
		
	}
	
	/**
	 * 获取到管理员登录的验证码
	 * @return
	 */
	public String charCheck() {
	
			Map<String, BufferedImage> imageMap = CodeUtil.getStringVerifyCode();
			String key = imageMap.keySet().iterator().next();
			System.out.println(key);
			session.put("charCode", key);
			BufferedImage bufferedImage = imageMap.get(key);
			inputStream = CodeUtil.image(bufferedImage);
	     	return "success";

	}

	/**
	 * 管理员登录
	 * @return
	 */
	public String adminLogin() {
         System.out.println(adminName+"adminName--------------------------------");
         System.out.println(charCode+"charCode--------------------------------");
         System.out.println(password+"password--------------------------------");
        if(adminName.equals("admin@qq.com")) {
        	 User users=new User();
        	 users.setUsername(adminName);
        	 users.setPassword(password);
        	 UserInfoVo loginUser = iUserService.checkLogin(users);
     		String key=(String) session.get("charCode");
     		String keys=key.toLowerCase();
     		System.out.println(loginUser+"---------------------------->adminUserLogin");
     		System.out.println(keys+"   sessionkey________________________");
     		System.out.println(charCode+"  code++++++++++++++++++++++++++++++");
     		if (loginUser != null && charCode.equals(keys)) {
     			System.out.println("haveUser&&&&&&&&&&&&&&&&&&&&&&&&&&&7");
     			session.put("user", loginUser);
     			outcome="";
     			return SUCCESS;
     		} else {
     			outcome = "账号或者密码错误";
     			return "error";
     		}

        }else {
        	outcome = "账号或者密码错误";
        	return "error";
        }
      
	}
	public String certificationList() {
		certificationVoList = iUserManageService.findCertificationAllList();
		return SUCCESS;
	}
	public String review() {
		iUserManageService.updateCertification(certificationId,certificationStatus);
		result = 1L;
		return SUCCESS;
	}
	
	/**
	 * 用户总数量
	 * @return
	 */
	public String userCount() {
		result = iUserService.countUser();
		return SUCCESS;
	}
	
	public String genderCount() {
		genderList = iUserService.countGender();
		return SUCCESS;
	}
	
	public String exit() {
		session.clear();
		return SUCCESS;
	}
	
	public String userRegionCount() {
		userGegionList = iUserManageService.countUserRegion();
		return "userRegion";
	}

}
