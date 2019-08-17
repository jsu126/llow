package com.nike.llow.vo;

import lombok.Data;

/**
 * @author zero
 * @date 2019年8月6日
 * @version
 */
@Data
public class PageInfoVo<T> {

	//总页数
	private long totalPage;
	//是否有上一页
	private boolean hasPrePage;
	//上一页
	private long prePage;
	//是否有下一页
	private boolean hasNextPage;
	//下一页
	private long nextpage;
	
	//数据
	private T list;
}
