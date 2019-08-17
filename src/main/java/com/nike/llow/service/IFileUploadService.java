package com.nike.llow.service;

import java.io.File;

/**
 * 上传文件
 * 
 * @author Stodger
 * @date 2019年8月6日
 * @version
 */
public interface IFileUploadService {

	/**
	 * 上传文件
	 * @param path
	 * @param fileName
	 * @param image
	 * @return
	 */
	String uploadFile(String path, String fileName, File image);
}
