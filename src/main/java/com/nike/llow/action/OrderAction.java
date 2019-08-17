package com.nike.llow.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;
import com.nike.llow.domain.Address;
import com.nike.llow.domain.Order;
import com.nike.llow.domain.OrderDetail;
import com.nike.llow.domain.User;
import com.nike.llow.service.IAddressService;
import com.nike.llow.service.IOrderService;
import com.nike.llow.service.IUserService;
import com.nike.llow.vo.OrderInfoVo;
import com.nike.llow.vo.ResponseResult;

import com.nike.llow.vo.UserInfoVo;

import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Controller
public class OrderAction extends ActionSupport implements SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map<String, Object> session;
	private User user = new User();
	private Order order;
	private String orderNumber;
	private Integer addressId;
	private double totalPrice;
	private OrderDetail orderDetail;

	private List<OrderDetail> orderDetailList;
	private List<OrderDetail> unValuedList;

	private Address address;

	private List<OrderInfoVo> orderInfoVoList;

	private OrderInfoVo orderInfoVo;

	private int orderId;
	private ResponseResult responseResult;
	@Autowired
	private IOrderService iOrderService;

	// private Integer orderIdC;
	private List<String> productIds;
	private List<String> standardNames;
	private List<String> commentContents;
	private List<Integer> commentNums;

	@Autowired
	private IAddressService iAddressService;
	
	@Autowired
	private IUserService iUserService;

	public String myOrder() {

		System.out.println("这个是order方法");
		UserInfoVo loginUser = (UserInfoVo) session.get("user");
		System.out.println(loginUser + "===========>loginUser");
		// 获取该用所有的order数据
		List<Order> orderList = iOrderService.listOrder(loginUser.getUserId());
		// List<OrderDetail> unValuedList=new ArrayList<OrderDetail>();
		//List<OrderDetail> detailList = new ArrayList<OrderDetail>();
		List<OrderInfoVo> orderInfoVoList = new ArrayList<OrderInfoVo>();

		orderInfoVoList = iOrderService.getOrderInfoVoList(orderList);
		System.out.println("orderInfoVoList的size" + orderInfoVoList.size());

		setOrderInfoVoList(orderInfoVoList);

		return SUCCESS;
	}

	public String commentList() {

		List<OrderDetail> unValuedList = new ArrayList<OrderDetail>();
		unValuedList = iOrderService.listOrderDetailList(orderId);
		setUnValuedList(unValuedList);
		return SUCCESS;
	}

	public String commentCommit() {
		System.out.println("这个方法----》");
		System.out.println("orderIdc" + orderId);
		System.out.println("这个产品有吗？？" + productIds);

		System.out.println("这个产品有吗？？" + standardNames);
		System.out.println("这个产品有吗？？" + commentNums);
		System.out.println("这个产品有吗？？" + commentContents);
		UserInfoVo loginUser = (UserInfoVo) session.get("user");
		System.out.println(loginUser + "===========>loginUser");
		iOrderService.saveComment(loginUser.getUserId(), orderId, productIds, standardNames, commentNums,
				commentContents);

		return SUCCESS;
	}
	
	/**
	 * 提醒发货
	 * @return
	 */
	public String remind() {
		return SUCCESS;
	}
	/**
	 * 确认收货
	 * @return
	 */
	public String receipt() {
		iOrderService.updateOrderReceipt(orderId);
		return SUCCESS;
	}

	/**
	 * 支付成功
	 * @return
	 */
	public String paySuccess() {
		UserInfoVo loginUser = (UserInfoVo)session.get("user");
		iOrderService.updateOrder(orderNumber, addressId);
		address = iAddressService.getAddress(addressId);
		if(loginUser == null) {
			loginUser = iUserService.getUser(address.getUserId());
			if(loginUser != null) {
				session.put("user", loginUser);
			}
		}
		return SUCCESS;
	}

	public void orderConfirm() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
				AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
				AlipayConfig.sign_type);
		// 设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		// 商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = orderNumber;
		// 付款金额，必填
		String total_amount = String.valueOf(totalPrice);
		// 订单名称，必填
		String subject = "礼来我网";
		// 商品描述，可空
		String body = "";
		alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
				+ "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		// 请求
		String result = null;
		try {

			iOrderService.updateOrderAddress(orderNumber, addressId);
			result = alipayClient.pageExecute(alipayRequest).getBody();
			response.setContentType("text/html;charset=" + AlipayConfig.charset);
			response.getWriter().write(result);// 直接将完整的表单html输出到页面
			response.getWriter().flush();
			response.getWriter().close();

		} catch (AlipayApiException e) {
			e.printStackTrace();
			response.getWriter().write("捕获异常出错");
			response.getWriter().flush();
			response.getWriter().close();
		}
	}

}
