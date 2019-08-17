package com.nike.llow.util;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

/**
 * 短信验证码
 * @author Stodger
 * @date 2019年8月6日
 * @version
 */
public class SendMessagesUtil {
	
	
	/**
	 * @param PhoneNumbers 手机号
	 * @param TemplateCode 模板验证号
	 * @param code 验证码
	 * @return
	 */
	public static String sendCode(String PhoneNumbers, String TemplateCode, int code) {
		IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAITp1XvZhFTrmX", "SoHFY3qiXMeFJdwdZ3bCIEqZjBlsWP");
		try {
			DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", "Dysmsapi", "dysmsapi.aliyuncs.com");
		} catch (ClientException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        IAcsClient client = new DefaultAcsClient(profile);
        
        SendSmsRequest request = new SendSmsRequest();
        request.setMethod(MethodType.POST);
        request.setVersion("2017-05-25");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", PhoneNumbers);
        request.putQueryParameter("SignName", "礼来我网");
        request.putQueryParameter("TemplateCode", TemplateCode);
        request.putQueryParameter("TemplateParam", "{\"code\":\""+code+"\"}");
        try {
            SendSmsResponse response = client.getAcsResponse(request);
            if (response.getCode() != null && response.getCode().equals("OK")){
            	return "ok";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "no";
        }
        return null;
	}
}
