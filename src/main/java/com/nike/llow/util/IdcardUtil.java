package com.nike.llow.util;

/**
 * @ Description:身份证识别
 * @ author: Joy
 * @ date:2018年9月12日下午8:58:42
 */
 
import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
 
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
 
import com.baidu.aip.util.Base64Util;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.nike.llow.service.AuthService;
import com.nike.llow.util.FileUtil;
import com.nike.llow.util.HttpUtil;

/**
 * @author Stodger
 * @date 2019年8月7日
 * @version
 */
public class IdcardUtil {
    public static String idcardOrc(String filePath) {
        // 身份证识别url
        String idcardIdentificate = "https://aip.baidubce.com/rest/2.0/ocr/v1/idcard";
        // 本地图片路径
        //String filePath = "E:\\zm.jpg";//#####本地文件路径##### 
        try {
            byte[] imgData = FileUtil.readFileByBytes(filePath);
            String imgStr = Base64Util.encode(imgData);
            // 识别身份证正面id_card_side=front;识别身份证背面id_card_side=back;
            String params = "id_card_side=front&" + URLEncoder.encode("image", "UTF-8") + "="
                    + URLEncoder.encode(imgStr, "UTF-8");
            /**
             * 线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
             */
            String accessToken = AuthService.getAuth();//#####调用鉴权接口获取的token#####
            String result = HttpUtil.post(idcardIdentificate, accessToken, params);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static int getGray(Color pixel) {
        return (pixel.getRed()*30+pixel.getGreen()*60+pixel.getBlue()*10)/100;
    }
}
