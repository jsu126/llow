package com.nike.llow.dao;

import java.util.List;

import com.nike.llow.domain.Certification;
import com.nike.llow.domain.User;
import com.nike.llow.vo.ResVo;
import com.nike.llow.vo.UserVo;


/**
 * @author zero
 * @date 2019年8月6日
 * @version
 */
public interface IUserManageDao {

	/**
	 * 分页查询所有用户
	 * @param pageNum
	 * @param count
	 * @return
	 */
	List<User> findListUsers(int pageNum,Integer count);
	
	/**
	 * 搜索指定用户
	 * @param searchStartTime
	 * @param searchEndTime
	 * @param searchCity
	 * @return
	 */
	List<User> findSearchUsers(String searchStartTime,String searchEndTime,String searchCity);
	/**查询用户总数
	 * @return
	 */
	long findAllCount();
	/**根据userId查询用户
	 * @param uid
	 * @return
	 */
	User getUser(String uid);
	
	/**
	 * 更新用户
	 * @param user
	 */
	void updateUser(User  user);
	/**
	 * 查询所有用户
	 * @return
	 */
	List<User>findAll();
	/**
	 * 删除用户
	 * @param user
	 */
	void deleteUser(User user);
	
	/**
	 * 实名列表
	 * @return
	 */
	List<Certification> findCertificationAll();
	/**
	 * 获取实名信息
	 * @param certificationId
	 * @return
	 */
	Certification getCertification(Integer certificationId);
	
	/**
	 * 更新
	 * @param certification
	 */
	void updateCertification(Certification certification);
	
	/**
	 * 删除
	 * @param certification
	 */
	void deleteCertification(Certification certification);
	
	/**
	 * 用户区域发布统计
	 * @param city
	 * @return
	 */
	Long findReionCount(String city);
	
}
