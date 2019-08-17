package com.nike.llow.util;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import freemarker.template.SimpleDate;

/**
 * 导出数据 Excel
 * @author Stodger
 * @date 2019年8月6日
 * @version
 * @param <T>
 */
public class ExportExcelUtil<T> {
	
	public void exportExcel(String title,String[] headers, Collection<T> dataset, OutputStream out) {
		exportExcel(title, headers, dataset, out, "yyyy-MM-dd");
	}
	
	
	/**
	 * 导出excel文件
	 * @param title 标题
	 * @param headers 表列明
	 * @param dataset 数据
	 * @param out 输出流
	 * @param pattern 时间格式
	 */
	private void exportExcel(String title,String[] headers, Collection<T> dataset,OutputStream out, String pattern) {
		
		//声明工作簿
		HSSFWorkbook workbook = new HSSFWorkbook();
		//生成工作表
		HSSFSheet sheet = workbook.createSheet(title);
		//设置表格宽度
		sheet.setDefaultColumnWidth((short)20);
		
		//生成表格样式
		HSSFCellStyle style = workbook.createCellStyle();
		//背景颜色
		style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		//边框
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		//水平对齐
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
		//生成字体
		HSSFFont font = workbook.createFont();
		font.setColor(HSSFColor.VIOLET.index);
        font.setFontHeightInPoints((short) 12);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        
        HSSFCellStyle style2 = workbook.createCellStyle();
        style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
        style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 生成另一个字体
        HSSFFont font2 = workbook.createFont();
        font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        // 把字体应用到当前的样式
        style2.setFont(font2);
        
        
        
        //样式设置当前样式
        style.setFont(font);
        
        //产生表格标题行
        HSSFRow row = sheet.createRow(0);
        for(short i = 0; i < headers.length; i++) {
        	HSSFCell cell = row.createCell(i);
        	cell.setCellStyle(style);
        	HSSFRichTextString text = new HSSFRichTextString(headers[i]);
        	cell.setCellValue(text);
        }
        
        //产生数据行
        Iterator<T> it = dataset.iterator();
        int index = 0;
        while(it.hasNext()) {
        	index++;
        	row = sheet.createRow(index);
        	T temp = (T)it.next();
        	//利用反射机制
        	Field[] fields = temp.getClass().getDeclaredFields();
        	for(short i = 0; i < fields.length; i++) {
        		HSSFCell cell = row.createCell(i);
        		cell.setCellStyle(style2);
        		Field field = fields[i];
        		String fieldName = field.getName();
        		String getMethodName = "get" + fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
        		Class tClass = temp.getClass();
        		try {
					Method getMethod = tClass.getMethod(getMethodName, new Class[] {});
					Object value  = getMethod.invoke(temp, new Object[] {});
					String textValue = null;
					if(value instanceof Timestamp) {
						Date date = (Date)value;
						DateFormat dateFormat = new SimpleDateFormat(pattern);
						textValue = dateFormat.format(date);
					}else {
						textValue = value.toString();
					}
					if(textValue != null) {
						//正则表达式 校验是否数字
						Pattern p = Pattern.compile("^//d+(//.//d+)?$");
                        Matcher matcher = p.matcher(textValue);
                        if(matcher.matches()) {
                        	cell.setCellValue(Double.parseDouble(textValue));
                        }else {
                        	HSSFRichTextString richTextString = new HSSFRichTextString(textValue);
                        	HSSFFont tempFont = workbook.createFont();
                        	font.setColor(HSSFColor.BLUE.index);
                        	richTextString.applyFont(tempFont);
                        	cell.setCellValue(richTextString);
                        }
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					
				}
        		
        	}
        }
        try {
			workbook.write(out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
