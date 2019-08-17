package com.nike.llow.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;



/**
 * @author Stodger
 * @date 2019年8月6日
 * @version
 */
public class CodeUtil {
    private int w = 80;
    private int h = 35;
    private Random r = new Random();
    /**
     * {"宋体", "华文楷体", "黑体", "华文新魏", "华文隶书", "微软雅黑", "楷体_GB2312"}
     */
    private String[] fontNames = {"宋体", "华文楷体", "黑体", "微软雅黑", "楷体_GB2312"};
    /**
     * 背景色
     */
    private Color bgColor = new Color(255, 255, 255);
    /**
     * 字符串验证码上的文本
     */
    private String strText;
    /**
     * 运算符验证码上的文本
     */
    private Integer numberText;

    private static Map imageMap;


    public static Map<Integer, BufferedImage> getArithmeticVerifyCode() {
        CodeUtil codeUtil = new CodeUtil();
        return codeUtil.setArithmeticVerifyCode();
    }

    private Map<Integer, BufferedImage> setArithmeticVerifyCode() {
        //创建图片缓冲区
        BufferedImage image = createImage();
        //得到绘制环境
        Graphics2D g2 = (Graphics2D) image.getGraphics();

        //生成算式
        int number1 = r.nextInt(20);
        int number2 = r.nextInt(20);
        String operator = "+-*/";
        int index = r.nextInt(operator.length() - 1);
        char ch = operator.charAt(index);
        String s = number1 + "" + ch + "" + number2 + "=";
        float x = 0;
        //设置字体
        g2.setFont(new Font(fontNames[4], 0, 24));
        //设置随机颜色
        g2.setColor(randomColor());
        //画图
        g2.drawString(s, x, h - 5);
        //把生成的字符串赋给了this.text
        this.numberText = calculation(ch, number1, number2);
        //添加干扰线
        drawLine(image,300);
        imageMap = new HashMap<Integer,BufferedImage>(10);
        imageMap.put(numberText, image);
        return imageMap;

    }


    public static Map<String, BufferedImage> getStringVerifyCode() {
        CodeUtil codeUtil = new CodeUtil();
        return codeUtil.setStringVerifyCode();
    }

    private Map<String, BufferedImage> setStringVerifyCode() {
        //创建图片缓冲区
        BufferedImage image = createImage();
        //得到绘制环境
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        //用来装载生成的验证码文本
        StringBuilder sb = new StringBuilder();
        // 向图片中画4个字符
        //随机生成一个字母
        for (int i = 0; i < 4; i++) {
            //随机生成一个字母
            String s = randomChar() + "";
            //把字母添加到sb中
            sb.append(s);
            //设置当前字符的x轴坐标
            float x = i * 1.0F * w / 4;
            //设置随机字体
            g2.setFont(randomFont());
            //设置随机颜色
            g2.setColor(randomColor());
            //画图
            g2.drawString(s, x, h - 5);
        }
        //把生成的字符串赋给了this.text
        this.strText = sb.toString();
        //添加干扰线
        drawLine(image, 300);
        imageMap = new HashMap<String, BufferedImage>(10);
        imageMap.put(strText, image);
        return imageMap;
    }

    private int calculation(char ch, int number1, int number2) {
        switch (ch) {
            case '+':
                return number1 + number2;
            case '-':
                return number1 - number2;
            case '*':
                return number1 * number2;
            case '/':
                return number1 / number2;
            default:
                return 0;
        }
    }

    /**
     * 生成随机的颜色
     *
     * @return Color
     */
    private Color randomColor() {
        int red = r.nextInt(150);
        int green = r.nextInt(150);
        int blue = r.nextInt(150);
        return new Color(red, green, blue);
    }


    /**
     * 生成随机的字体
     *
     * @return Font
     */
    private Font randomFont() {
        int index = r.nextInt(fontNames.length);
        //生成随机的字体名称
        String fontName = fontNames[index];
        //生成随机的样式, 0(无样式), 1(粗体), 2(斜体), 3(粗体+斜体)
        int style = r.nextInt(4);
        //生成随机字号, 24 ~ 28
        int size = r.nextInt(5) + 24;
        return new Font(fontName, style, size);
    }

    /**
     * 生成干扰线
     * @param image 图片
     * @param num 干扰线条数
     */
    private void drawLine(BufferedImage image, int num) {
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        //生成两个点的坐标，即4个值
        for (int i = 0; i < num; i++) {
            int x1 = r.nextInt(w);
            int y1 = r.nextInt(h);
            int red = r.nextInt(255);
            int greed = r.nextInt(255);
            int blue = r.nextInt(255);
            //干扰线是蓝色
            g2.setColor(new Color(red, greed, blue));
            //画线
            g2.drawOval(x1, y1, 1, 0);
        }
    }

    /**
     * 随机生成一个字符
     *
     * @return int
     */
    private char randomChar() {
        String codes = "0123456789abcdefghjkmnopqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ";
        int index = r.nextInt(codes.length());
        return codes.charAt(index);
    }

    /**
     * 创建BufferedImage
     *
     * @return BufferedImage
     */
    private BufferedImage createImage() {
        BufferedImage image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        g2.setColor(this.bgColor);
        g2.fillRect(0, 0, w, h);
        return image;
    }


    public static ByteArrayInputStream image(BufferedImage bufferedImage) {
        ByteArrayInputStream byteArrayInputStream = null;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        JPEGImageEncoder jpegImageEncoder = JPEGCodec.createJPEGEncoder(byteArrayOutputStream);
        try {
            jpegImageEncoder.encode(bufferedImage);
            byte[] bytes = byteArrayOutputStream.toByteArray();
            byteArrayInputStream = new ByteArrayInputStream(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return byteArrayInputStream;
    }
}