package com.nike.llow.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.nike.llow.service.IFileUploadService;
import com.nike.llow.util.FtpUtil;

@Service
public class FileUploadServiceImpl implements IFileUploadService {

	@Override
	public String uploadFile(String path, String fileName,File image) {
		File fileDir = new File(path);
		if(!fileDir.exists()) {
			fileDir.setWritable(true);
			fileDir.mkdirs();
		}
		String name = UUID.randomUUID().toString().replaceAll("-","");
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		File targetFile = new File(path, name + "." + suffix);
		try {
			FileUtils.copyFile(image, targetFile);
			boolean result = FtpUtil.uploadFile(Lists.newArrayList(targetFile));
			if(result) {
				return name + "." + suffix;
			}else {
				return null;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
