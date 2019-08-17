package com.nike.llow.util;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;
import java.util.UUID;


/**
 * @author Stodger
 * @date 2019年8月6日
 * @version
 */
public class IdUtil {

    private static final String ID_PREFIX = "llowid_";
    private static final String USERNAME_PREFIX = "user_";

    /**
     * 用户Id
     * @return
     */
    public static String getId(){
        Random random = new Random();
        String str = UUID.randomUUID().toString().replaceAll("-", "");
        int start = random.nextInt(str.length() / 2);
        return ID_PREFIX + str.substring(start, start + 8);
    }
    
    /**
     * 用户名
     * @return
     */
    public static String getUsername() {
    	Random random = new Random();
        String str = UUID.randomUUID().toString().replaceAll("-", "");
        int start = random.nextInt(str.length() / 2);
        return USERNAME_PREFIX + str.substring(start, start + 8);
    }
    
    /**
     * 商品Id
     * @return
     */
    public static String getProductId() {
    	Long number = System.currentTimeMillis();
    	return "P" + number;
    }
    
    /**
     * 订单编号
     * @return
     */
    public static String getOrderNumber() {
    	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    	Date date = timestamp;
    	String dateStr = date.toString().replaceAll("-", "").replaceAll(" ", "").replaceAll(":", "").replaceAll("\\.", "");
    	Random random = new Random();
    	int number = random.nextInt(10000);
    	return dateStr + number;
    }
}
