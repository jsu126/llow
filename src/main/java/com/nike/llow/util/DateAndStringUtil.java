package com.nike.llow.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateAndStringUtil {
	
	/**
	 * 时间转字符串格式
	 * @param date
	 * @param patter
	 * @return
	 */
	public static String dateAndStringFormatter(Date date,String patter) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(patter);
		return simpleDateFormat.format(date);
	}
	
	/**
	 * 字符串转时间格式
	 * @param date
	 * @param patter
	 * @return
	 */
	public static Date stringAndDateFormatter(String date, String patter) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(patter);
		try {
			return simpleDateFormat.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
