package com.nike.llow.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nike.llow.dao.IUserDao;
import com.nike.llow.dao.IUserManageDao;
import com.nike.llow.domain.Certification;
import com.nike.llow.domain.User;
import com.nike.llow.service.IUserManageService;
import com.nike.llow.util.Md5Util;
import com.nike.llow.vo.CertificationVo;
import com.nike.llow.vo.PageInfoVo;
import com.nike.llow.vo.ResVo;
import com.nike.llow.vo.ResponseResult;
import com.nike.llow.vo.UserVo;
import com.sun.mail.handlers.image_gif;

@Service
@Transactional
public class UserManageServiceImpl implements IUserManageService {

	@Autowired
	private IUserManageDao iUserManageDao;
	
	@Autowired
	private IUserDao iUserDao;

	@Override
	public PageInfoVo findListUsers(int pageNum, Integer count) {
		PageInfoVo pageInfoVo = new PageInfoVo();
		long total = iUserManageDao.findAllCount();

		pageInfoVo = getPage(total, pageNum, count);
		List<User> userList = iUserManageDao.findListUsers((pageNum - 1) * count, count);
		pageInfoVo.setList(userList);
		return pageInfoVo;
	}

	@Override
	public User getUser(String uid) {

		return iUserManageDao.getUser(uid);
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
		} else if (totalPage >= -1) {
			pageInfoVo.setHasNextPage(true);
			pageInfoVo.setNextpage(pageNum + 1);
		}
		return pageInfoVo;

	}

	@Override
	public ResponseResult updateUserPassword(String userId) {
		User user = iUserManageDao.getUser(userId);
		ResponseResult responseResult = new ResponseResult(null);
		if (user == null) {
			responseResult.setMsg("");
		} else {
			Random r = new Random();
			int nuber = r.nextInt(900000) + 100000;
			String password = "User" + String.valueOf(nuber);
			user.setPassword(Md5Util.getMd5EnCode(password));
			iUserManageDao.updateUser(user);
			responseResult.setMsg("《礼来我网》初始密码为：" + password);
		}
		return responseResult;
	}

	@Override
	public List<UserVo> findUserAll() {
		List<User> userList = iUserManageDao.findAll();
		List<UserVo> userVoList = new ArrayList<>();
		if (userVoList != null) {
			for (User user : userList) {
				UserVo userVo = new UserVo();
				BeanUtils.copyProperties(user, userVo);
				userVoList.add(userVo);
			}
		}
		return userVoList;
	}

	@Override
	public List<UserVo> findListByUserIds(String[] options) {
		List<UserVo> userVoList = new ArrayList<>();
		for (String option : options) {
			User user = iUserManageDao.getUser(option);
			UserVo userVo = new UserVo();
			BeanUtils.copyProperties(user, userVo);
			userVoList.add(userVo);
		}
		return userVoList;
	}

	@Override
	public List<User> findUsers() {

		return iUserManageDao.findAll();
	}

	@Override
	public ResVo deleteUser(User user) {
		ResVo resVo = new ResVo();
		if (user.getStatus() != 2) {
			user.setStatus(2);
			resVo.setMsg("删除用户成功");
		} else {
			user.setStatus(1);
			resVo.setMsg("还原用户成功");
		}

		iUserManageDao.updateUser(user);
		resVo.setOk(true);
		return resVo;

	}

	@Override
	public List<CertificationVo> findCertificationAllList() {
		List<Certification> certificationList = iUserManageDao.findCertificationAll();
		List<CertificationVo> certificationVoList = null;
		if(certificationList != null) {
			certificationVoList = new ArrayList<>();
			for(Certification certification : certificationList) {
				CertificationVo certificationVo = new CertificationVo();
				BeanUtils.copyProperties(certification, certificationVo);
				String idCard = certificationVo.getIdCard();
				String address = certificationVo.getAddress();
				certificationVo.setIdCard(idCard.substring(0, 2) + "*************" + idCard.substring(14,idCard.length()));
				certificationVo.setAddress(address.substring(0,address.lastIndexOf("县")+1) + "*************");
				User user = iUserDao.getUser(certification.getUserId());
				if(user != null) {
					certificationVo.setUsername(user.getUsername());
				}
				certificationVoList.add(certificationVo);
			}
		}
		return certificationVoList;
	}

	@Override
	public void updateCertification(Integer certificationId, Integer certificationStatus) {
		Certification certification = iUserManageDao.getCertification(certificationId);
		if(certification != null) {
			if(certificationStatus == 1) {
				certification.setStatus(certificationStatus);
				
			}else {
				iUserManageDao.deleteCertification(certification);
			}	
		}
	}

	@Override
	public List<Long> countUserRegion() {
		List<Long> regionCount = new ArrayList<>();
		String[] citys={"北京","天津","上海","重庆","河北","河南","云南","辽宁","黑龙江","湖南","安徽","山东","新疆","江苏","浙江","江西","湖北","广西","甘肃","山西","内蒙古","陕西","吉林","福建","贵州","广东","青海","西藏","四川","宁夏","海南","台湾","香港","澳门"};
		
		for(String city: citys) {
			Long count = iUserManageDao.findReionCount(city);
			regionCount.add(count);
		}
		return regionCount;
	}

	@Override
	public List<User> findSearchUsers(String searchStartTime, String searchEndTime, String searchCity) {
		
		return iUserManageDao.findSearchUsers(searchStartTime, searchEndTime, searchCity);
	}
}
