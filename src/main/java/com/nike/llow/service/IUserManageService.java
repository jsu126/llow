package com.nike.llow.service;

import java.util.List;

import com.nike.llow.domain.User;
import com.nike.llow.vo.CertificationVo;
import com.nike.llow.vo.PageInfoVo;
import com.nike.llow.vo.ResVo;
import com.nike.llow.vo.ResponseResult;
import com.nike.llow.vo.UserVo;


/**
 * @author zero
 * @date 2019年8月6日
 * @version
 */
public interface IUserManageService {

	/**
	 * 分页查询所有用户
	 * @param pageNum
	 * @param count
	 * @return
	 */
	PageInfoVo findListUsers(int pageNum,Integer count);
	/**
	 * 搜索指定用户
	 * @param searchStartTime
	 * @param searchEndTime
	 * @param searchCity
	 * @return
	 */
	List<User> findSearchUsers(String searchStartTime,String searchEndTime,String searchCity);
	/**
	 * 查询所有的用户
	 * @param pageNum
	 * @param count
	 * @return
	 */
	List<User> findUsers();
	/**
	 * 根据userId查询用户
	 * @param uid
	 * @return
	 */
	User getUser(String uid);
	/**
	 * 初始密码
	 * @param userId
	 * @return
	 */
	ResponseResult updateUserPassword(String userId);
	/**
	 * 查询所有用户
	 * @return
	 */
	List<UserVo>findUserAll();
	/**
	 * 查询选择的用户
	 * @param options
	 * @return
	 */
	List<UserVo>findListByUserIds(String[] options);
	
	/**
	 * 删除用户
	 * @param user
	 */
	ResVo deleteUser(User user);
	/**
	 * 实名认证
	 * @return
	 */
	List<CertificationVo> findCertificationAllList();
	/**
	 * 更新实名认证
	 * @param certificationId
	 * @param certificationStatus
	 */
	void updateCertification(Integer certificationId, Integer certificationStatus);
	
	/**
	 * 用户区域统计
	 * @return
	 */
	List<Long> countUserRegion();
}
