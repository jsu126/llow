package com.nike.llow.action;

import org.springframework.stereotype.Controller;
import com.nike.llow.util.IpInfoUtil;
import com.nike.llow.vo.WeatherVo;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class SystemManageAction extends ActionSupport{
	
	private WeatherVo weatherVo;
	private String ip;
	
	public String weather() {
		/*String ip = IpInfoUtil.getIpAddr(ServletActionContext.getRequest());*/
		System.out.println(ip + "=============>ip");
		weatherVo = IpInfoUtil.getWeather(ip);
		return SUCCESS;
	}
}
