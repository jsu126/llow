package com.nike.llow.vo;

import lombok.Data;

@Data
public class WeatherVo {
	
	/**
	 * 城市
	 */
	private String city;
	/**
	 * 温度
	 */
	private String temperature;
	/**
	 * 湿度
	 */
	private String humidity;
	/**
	 * 风力
	 */
	private String wind;
	/**
	 * 空气质量
	 * 
	 */
	private String airCondition;
	/**
	 * 天气
	 */
	private String weather;
}
