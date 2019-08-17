package com.nike.llow.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.nike.llow.domain.User;
import com.nike.llow.dao.IUserDao;
import com.nike.llow.domain.Address;
import com.nike.llow.domain.Certification;
import com.nike.llow.domain.Collection;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Standard;
import com.nike.llow.service.IFileUploadService;
import com.nike.llow.service.IUserService;

import com.nike.llow.vo.ResponseResult;

import com.nike.llow.util.IdcardUtil;
import com.nike.llow.util.DateAndStringUtil;
import com.nike.llow.util.IdUtil;
import com.nike.llow.util.Md5Util;
import com.nike.llow.util.SendMessagesUtil;
import com.nike.llow.vo.UserInfoVo;


@Service
@Transactional
public class UserServiceImpl implements IUserService {     

	@Autowired
	private IUserDao iUserDao;

	@Autowired
	private IFileUploadService iFileUploadService;

	@Override
	public int emailRegisterFont(String email) {
		return iUserDao.emailRegisterFont(email);

	}

	@Override
	public void saveEmaiRegister(User user) {
		User tempUser = new User();
		tempUser.setUserId(IdUtil.getId());
		tempUser.setUsername(IdUtil.getUsername());
		tempUser.setPassword(Md5Util.getMd5EnCode(user.getPassword()));
		tempUser.setEmail(user.getEmail());
		tempUser.setStatus(1);
		if(user.getCity() != null) {
			tempUser.setCity(user.getCity());
		}
		if(user.getSex() != null) {
			tempUser.setSex(user.getSex());
		}
		/*
		 * Date date = new Date(); SimpleDateFormat simpleDateFormat = new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 */
		tempUser.setRegisterTime(DateAndStringUtil.dateAndStringFormatter(new Date(), "yyyy-MM-dd HH:mm:ss"));
		iUserDao.saveEmaiRegister(tempUser);
	}

	@Override
	public int phoneRegisterFont(String phone) {
		return iUserDao.phoneRegisterFont(phone);
	}

	@Override
	public void savePhoneRegister(User user) {
		User tempUser = new User();
		tempUser.setUserId(IdUtil.getId());
		tempUser.setUsername(IdUtil.getUsername());
		tempUser.setPassword(Md5Util.getMd5EnCode(user.getPassword()));
		tempUser.setPhone(user.getPhone());
		tempUser.setStatus(1);
		if(user.getCity() != null) {
			tempUser.setCity(user.getCity());
		}
		if(user.getSex() != null) {
			tempUser.setSex(user.getSex());
		}
		/*
		 * Date date = new Date(); SimpleDateFormat simpleDateFormat = new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 */
		tempUser.setRegisterTime(DateAndStringUtil.dateAndStringFormatter(new Date(), "yyyy-MM-dd HH:mm:ss"));
		iUserDao.savePhoneRegister(tempUser);

	}

	@Override
	public void updateUserPicture(User user, String picture) {
		User resultUser = iUserDao.getUser(user.getUserId());
		resultUser.setPicture(picture);
		iUserDao.updateUser(resultUser);
	}

	@Override
	public void saveUser(User user) {
		iUserDao.saveUser(user);
	}

	@Override
	public void sendCode(UserInfoVo target, int codeNumber) {
		SendMessagesUtil.sendCode(target.getPhone(), "SMS_171858892", codeNumber);
	}

	@Override
	public UserInfoVo checkLogin(User user) {
		User tempUser = new User();
		tempUser.setUsername(user.getUsername());
		tempUser.setPassword(Md5Util.getMd5EnCode(user.getPassword()));
		User result = iUserDao.checkLogin(tempUser);
		UserInfoVo userInfoVo = null;
		int total = 30;
		if (result != null) {
			userInfoVo = new UserInfoVo();
			BeanUtils.copyProperties(result, userInfoVo);
			System.out.println(total + "==========total1");
			total = result.getEmail() == null ? total : total + 10;
			total = result.getPhone() == null ? total : total + 10;
			total = result.getSex() == null ? total : total + 10;
			total = result.getCity() == null ? total : total + 10;
			total = result.getPicture() == null ? total : total + 10;
			total = result.getBirthday() == null ? total : total + 10;
			System.out.println(total + "==========total2");
			Certification certification = iUserDao.findCertification(result.getUserId(),1);
			if(certification != null) {
				total += 10;
			}
			userInfoVo.setScore(total);
		}
		return userInfoVo;
	}

	@Override
	public UserInfoVo updateUser(String userId, User user) {
		User result = iUserDao.getUser(userId);
		result.setUsername(user.getUsername());
		result.setCity(user.getCity());
		result.setSex(user.getSex());
		result.setBirthday(user.getBirthday());
		iUserDao.updateUser(result);
		result = iUserDao.getUser(result.getUserId());
		UserInfoVo userInfoVo = null;
		int total = 30;
		if (result != null) {
			userInfoVo = new UserInfoVo();
			BeanUtils.copyProperties(result, userInfoVo);
			total = result.getEmail() == null ? total : total + 10;
			total = result.getPhone() == null ? total : total + 10;
			total = result.getSex() == null ? total : total + 10;
			total = result.getCity() == null ? total : total + 10;
			total = result.getPicture() == null ? total : total + 10;
			total = result.getBirthday() == null ? total : total + 10;
			Certification certification = iUserDao.findCertification(result.getUserId(),1);
			if(certification != null) {
				total += 10;
			}
			userInfoVo.setScore(total);
		}
		return userInfoVo;
	}
	@Override
	public User getByUser(User user) {
		User user1 =iUserDao.getUser(user.getUserId());
		return user1;
	}


	
	@Override
	public ResponseResult getNewPhone(User user, Integer usercode, Integer oldCode) {
		User result = null;
		ResponseResult<User> responseResult = new ResponseResult<User>(result);
		if(!usercode .equals(oldCode)){
			responseResult.setMsg("旧手机验证码错误或已失效");
			responseResult.setCode(1);
			return responseResult;
	}else{
//		这儿判断该手机号是否已经有人使用
		result=iUserDao.getNewPhone(user.getPhone());
		System.out.println("getNewPhone的result"+result);
		if(result!=null){
			responseResult.setDate(result);
			responseResult.setMsg("该手机已被人绑定");
			responseResult.setCode(1);
			return responseResult;
		}else{
			responseResult.setMsg("");
			responseResult.setCode(2);
			return responseResult;
		}
	}
	}


	@Override
	public Certification saveCertification(String path, File[] idCardImage, String[] idCardImageFileName,
			String userId) {
		String[] fileNames = new String[2];
		for (int i = 0; i < idCardImage.length; i++) {
			String fileName = iFileUploadService.uploadFile(path, idCardImageFileName[i], idCardImage[i]);
			fileNames[i] = fileName;
		}
		// String fileName = iFileUploadService.uploadFile(path, idCardImageFileName[0],
		// idCardImage);

		String orc = IdcardUtil.idcardOrc(idCardImage[0].toString());
		if (orc != null) {
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = jsonParser.parse(orc).getAsJsonObject();
			JsonObject words_result = jsonObject.getAsJsonObject("words_result");
			Certification certification = new Certification();
			certification.setUserId(userId);
			certification.setRealName(words_result.get("姓名").getAsJsonObject().get("words").getAsString());
			certification.setIdCard(words_result.get("公民身份号码").getAsJsonObject().get("words").getAsString());
			certification.setNationality(words_result.get("民族").getAsJsonObject().get("words").getAsString());
			certification.setBrithTime(words_result.get("出生").getAsJsonObject().get("words").getAsString());
			certification.setAddress(words_result.get("住址").getAsJsonObject().get("words").getAsString());
			certification.setPositive("http://image.stodger.club/images/" + fileNames[0]);
			certification.setNegative("http://image.stodger.club/images/" + fileNames[1]);
			certification.setStatus(0);
			iUserDao.saveCertification(certification);
			return certification;
		}
		return null;

	}

	@Override
	public String updateCertification(String userId, String realName, String idCard) {
		Certification certification = iUserDao.findCertification(userId,0);
		if (certification != null) {
			certification.setRealName(realName);
			certification.setIdCard(idCard);
			iUserDao.updateCertification(certification);
			return "oK";
		}
		return null;
	}



	@Override
	public ResponseResult updateNewPhone(User user, Integer usercode, Integer oldCode,String phone) {
		user=iUserDao.getUser(user.getUserId());
		User result = null;
		ResponseResult<User> responseResult = new ResponseResult<User>(result);
		if(!usercode.equals(oldCode)){
			System.out.println("这个第二个验证码不相同？");
			responseResult.setMsg("新手机验证码错误");
			responseResult.setCode(1);
			return responseResult;
	}else{
		user.setPhone(phone);
		iUserDao.updateNewPhone(user);
		
		responseResult.setMsg("");
		return responseResult;
	}
	}

	@Override
	public ResponseResult updateEmail(User user,Integer usercode,Integer oldCode,String email) {
		user=iUserDao.getUser(user.getUserId());
		System.out.println("updaEmailService中的方法=======？？？"+user);
		User result = null;
		ResponseResult<User> responseResult = new ResponseResult<User>(result);
		if(!usercode .equals(oldCode)){
			responseResult.setMsg("验证码错误");
			responseResult.setCode(1);
			return responseResult;
	}else{

		//这儿判断该邮箱是否已经有人使用
		
		result=iUserDao.getNewEmail(email);
		System.out.println(result+"result====??");
		if(result!=null){
			responseResult.setDate(result);
			responseResult.setMsg("该邮箱已被人绑定");
			responseResult.setCode(2);
			return responseResult;
		}else{
			user.setEmail(email);
			System.out.println("即将更新数据库Email");
			System.out.println(user+"------>");
			iUserDao.updateEmail(user);
			responseResult.setMsg("");
			responseResult.setCode(3);
			return responseResult;
		}
		
	}
	
	}
	
	@Override
	public List<Collection> listCollectionByUser(User user) {
		System.out.println("进入getCollectionByUser方法");
		List<Collection> collectionList=iUserDao.listCollectionByUser(user);
		return collectionList;
	}

	@Override
	public Product getCProduct(String id) {
		System.out.println("进入getCProduct方法");
		Product cProduct=iUserDao.getCProduct(id);
		return cProduct;
		
	}
	@Override
	public Long countUser() {
		return iUserDao.countUser();
	}
	@Override
	public Standard getStandardByProduct(Product product) {
		System.out.println("进入getStandardByProduct方法");
		Standard standard=iUserDao.getStandardByProductId(product.getProductId());
		return standard;
	}


	@Override
	public Collection getCollection(String productId,String userId) {
		Collection collection=iUserDao.getCollection(productId,userId);
		return collection;
	}

	@Override
	public ResponseResult deleteCProduct(Collection collection) {
		System.out.println("这个deleteCproductservice--->");
		iUserDao.deleteCollection(collection);
		Product result = null;
		ResponseResult<Product> responseResult = new ResponseResult<Product>(result);
		responseResult.setMsg("");
		return responseResult ;
		
	}

	@Override
	public List<Long> countGender() {
		List<Long> genderList = new ArrayList<Long>();
		long male = iUserDao.countMale("男");
		genderList.add(male);
		long famale = iUserDao.countMale("女");
		genderList.add(famale);
		return genderList;
	}


	@Override
	public User hasPhone(String newPhone) {
		User user=new User();
		user=iUserDao.hasPhone(newPhone);
		return user;
	}
	@Override
	public User hasEmail(String email) {
		User user=new User();
		user=iUserDao.getNewEmail(email);
		return user;
	}

	@Override
	public ResponseResult updateBindPhone(User user,String newPhone,Integer usercode, Integer oldCode) {
		
		System.out.println("Phone"+newPhone);
		User result = null;
		ResponseResult<User> responseResult = new ResponseResult<User>(result);
		if(!usercode .equals(oldCode)){
			
			responseResult.setMsg("手机验证码错误");
			
			responseResult.setCode(1);
			return responseResult;
	}
		
		user=iUserDao.getByUser(user);
		user.setPhone(newPhone);
		iUserDao.updateBindPhone(user);
		responseResult.setMsg("");
		return responseResult;
	}
	

	@Override
	public UserInfoVo getUser(String userId) {
		User user = iUserDao.getUser(userId);
		UserInfoVo userInfoVo = null;
		int total = 30;
		if (user != null) {
			userInfoVo = new UserInfoVo();
			BeanUtils.copyProperties(user, userInfoVo);
			total = user.getEmail() == null ? total : total + 10;
			total = user.getPhone() == null ? total : total + 10;
			total = user.getSex() == null ? total : total + 10;
			total = user.getCity() == null ? total : total + 10;
			total = user.getPicture() == null ? total : total + 10;
			total = user.getBirthday() == null ? total : total + 10;
			Certification certification = iUserDao.findCertification(user.getUserId(),1);
			if(certification != null) {
				total += 10;
			}
			userInfoVo.setScore(total);
		}
		return userInfoVo;
	}

	

	@Override
	public String checkCertification(String userId) {
		Certification certification = iUserDao.findCertification(userId,1);
		if(certification != null) {
			return "ok";
		}
		return "no";
	}
	@Override
	public Integer updateModifyPassword(UserInfoVo userInfoVo,String oldPassword, String newPassword) {
	  
		 if(Md5Util.getMd5EnCode(newPassword).equals(userInfoVo.getPassword())){
			 return 0;
		 }else {
			 
			 User result = iUserDao.getModifyUser(userInfoVo.getUserId(),Md5Util.getMd5EnCode(oldPassword));
			 if(result!=null) {
				   
				   User u = new User();
				   u=iUserDao.getUser(userInfoVo.getUserId());
				   u.setPassword(Md5Util.getMd5EnCode(newPassword));
				   iUserDao.updateModifyPassword(u);    
				   return 1;
			 }else {
				  return 0;
			 }
			 
		 }
		
	      
		
	}

	@Override
	public void saveBindPhone(UserInfoVo userInfoVo, String bindPhone) {
		  User u = new User();
		  u=iUserDao.getUser(userInfoVo.getUserId());
		  u.setPhone(bindPhone);
		  iUserDao.updateBindPhone(u);
		
	}
}
