package com.nike.llow.util;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.nike.llow.vo.WeatherVo;

public class IpInfoUtil {
	/**
	 * Mob官网注册申请即可
	 */
	private final static String APPKEY = "270c4d225bcf0";
	/**
	 * Mob全国天气预报接口
	 */
	private final static String GET_WEATHER = "http://apicloud.mob.com/v1/weather/ip?key=" + APPKEY + "&ip=";

	/**
	 * 获取客户端IP地址
	 * 
	 * @param request 请求
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
			if (ip.equals("127.0.0.1")) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				ip = inet.getHostAddress();
			}
		}
		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ip != null && ip.length() > 15) {
			if (ip.indexOf(",") > 0) {
				ip = ip.substring(0, ip.indexOf(","));
			}
		}
		return ip;
	}

	/**
	 * 获取IP返回地理天气信息
	 * 
	 * @param ip
	 *            ip地址
	 * @return
	 */
	public static String getIpInfo(String ip) {
		if (null != ip) {
			String url = GET_WEATHER + ip;
			String result = HttpUtil.sendGet(url);
			return result;
		}
		return null;
	}
	
	public static WeatherVo getWeather(String ip) {
		String resultWeather = getIpInfo(ip);
		if(resultWeather != null) {
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = jsonParser.parse(resultWeather).getAsJsonObject();
			String msg = jsonObject.get("msg").getAsString();
			if(msg.equals("success")) {
				JsonArray result = jsonObject.getAsJsonArray("result");
				JsonElement  json = result.get(0);
				JsonObject temp = json.getAsJsonObject();
				String city = temp.get("city").getAsString();
				String temperature = temp.get("temperature").getAsString();
				String humidity = temp.get("humidity").getAsString();
				String wind = temp.get("wind").getAsString();
				String airCondition = temp.get("airCondition").getAsString();
				String weather = temp.get("weather").getAsString();
				WeatherVo weatherVo = new WeatherVo();
				weatherVo.setCity(city);
				weatherVo.setTemperature(temperature);
				weatherVo.setHumidity(humidity);
				weatherVo.setWind(wind);
				weatherVo.setAirCondition(airCondition);
				weatherVo.setWeather(weather);
				System.out.println(city + "==" + temperature + "===" + airCondition + "======" + humidity + "====" + wind);
				return weatherVo;
			}
		}
		return null;
	}
}
