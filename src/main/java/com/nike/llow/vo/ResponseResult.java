package com.nike.llow.vo;

import lombok.Data;

/**
 * @author zero
 * @date 2019年8月6日
 * @version
 * @param <T>
 */
@Data
public class ResponseResult<T> {

	private int code;
	private String msg;
	private T date;
	private boolean ok;
	public ResponseResult(T date){
		this.date = date;
	}
	
}
