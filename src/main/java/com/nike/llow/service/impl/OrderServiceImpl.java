package com.nike.llow.service.impl;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nike.llow.dao.IAddressDao;
import com.nike.llow.dao.IOrderDao;
import com.nike.llow.dao.IProductDao;
import com.nike.llow.dao.IShopCartDao;
import com.nike.llow.dao.IUserDao;
import com.nike.llow.domain.Address;
import com.nike.llow.domain.Comment;
import com.nike.llow.domain.Order;
import com.nike.llow.domain.OrderDetail;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Sales;
import com.nike.llow.domain.ShopCart;
import com.nike.llow.domain.Standard;
import com.nike.llow.domain.User;
import com.nike.llow.service.IOrderService;
import com.nike.llow.util.BigDecimalUtil;
import com.nike.llow.util.DateAndStringUtil;
import com.nike.llow.util.IdUtil;
import com.nike.llow.util.MailUtil;
import com.nike.llow.vo.OrderInfoVo;
import com.nike.llow.vo.OrderVo;

@Service
@Transactional
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private IOrderDao iOrderDao;
	@Autowired
	private IUserDao iUserDao;
	@Autowired
	private IProductDao iProductDao;
	@Autowired
	private IAddressDao iAddressDao;

	@Autowired
	private IShopCartDao iShopCartDao;

	@Override
	public List<OrderInfoVo> findAllList() {
		List<Order> orderList = iOrderDao.findAllOrderList();
		List<OrderInfoVo> orderInfoVoList = null;
		if (orderList != null) {
			orderInfoVoList = new ArrayList<OrderInfoVo>();
			for (Order order : orderList) {
				OrderInfoVo orderInfoVo = new OrderInfoVo();
				BeanUtils.copyProperties(order, orderInfoVo);
				User user = iUserDao.getUser(order.getUserId());
				if (user != null) {
					orderInfoVo.setUsername(user.getUsername());
				}
				if (order.getOrderTime() != null) {
					orderInfoVo.setOrderTimeStr(
							DateAndStringUtil.dateAndStringFormatter(order.getOrderTime(), "yyyy-MM-dd HH:mm:ss"));
				}
				if (order.getPayTime() != null) {
					orderInfoVo.setPayTimeStr(
							DateAndStringUtil.dateAndStringFormatter(order.getPayTime(), "yyyy-MM-dd HH:mm:ss"));
				}
				if (order.getSendTime() != null) {
					orderInfoVo.setSendTimeStr(
							DateAndStringUtil.dateAndStringFormatter(order.getSendTime(), "yyyy-MM-dd HH:mm:ss"));
				}
				if (order.getFinishTime() != null) {
					orderInfoVo.setFinishTimeStr(
							DateAndStringUtil.dateAndStringFormatter(order.getFinishTime(), "yyyy-MM-dd HH:mm:ss"));
				}
				orderInfoVoList.add(orderInfoVo);
			}
		}
		return orderInfoVoList;
	}

	@Override
	public OrderInfoVo findByOrderDetail(Integer orderId) {
		Order order = iOrderDao.getOrder(orderId);
		OrderInfoVo orderInfoVo = null;
		if (order != null) {
			orderInfoVo = new OrderInfoVo();
			if (order.getAddressId() != null) {
				Address address = iAddressDao.getAddress(order.getAddressId());
				orderInfoVo.setAddress(address);
			}
			List<OrderDetail> orderDetailList = iOrderDao.findOrderDetailList(order.getOrderId());
			if (orderDetailList != null) {
				orderInfoVo.setOrderDetailList(orderDetailList);
			}
		}
		return orderInfoVo;
	}

	@Override
	public void updateOrder(Integer orderId) {
		Order order = iOrderDao.getOrder(orderId);
		order.setSendTime(new Timestamp(System.currentTimeMillis()));
		order.setStatus(2);
		Address address = iAddressDao.getAddress(order.getAddressId());
		if(address != null) {
			String phone = address.getPhone();
			String msg = "尊敬的顾客，您在《礼来我网》中购买的物品已经发货，请耐心等待，包裹正在路上。<br>订单编号：" + 
			order.getOrderNumber() + "<br>收货人：" + address.getConsingee() + "<br>手机号：" + phone.substring(0, 2) + "*****" + phone.substring(8, 11)+
			"<br>收货地址：" + address.getProvide() + address.getCity() + address.getRegion() + address.getDetailAddress();
			iOrderDao.updateOrder(order);
			User user = iUserDao.getUser(address.getUserId());
			if(user.getEmail() != null) {
				try {
					MailUtil.sendMail(user.getEmail(), msg, "订单通知");
				} catch (AddressException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public Long countOrder() {
		return iOrderDao.countOrder();
	}

	@Override
	public OrderVo saveOrder(String shopCartIds, String userId) {
		boolean flag = false;
		Random random = new Random();
		int number = random.nextInt(100) + 1;
		System.out.println(number + "================number");
		if(number / 1000.0 == 0.1) {
			flag = true;
		}
		OrderVo orderVo = null;
		List<OrderDetail> orderDetailList = new ArrayList<>();
		double total = 0.0;
		String[] shopCartIdArray = shopCartIds.split(",");
		if (shopCartIds != null && userId != null) {
			Order order = new Order();
			order.setOrderNumber(IdUtil.getOrderNumber());
			order.setOrderTime(new Timestamp(System.currentTimeMillis()));
			order.setTotalPrice(new BigDecimal(total));
			order.setUserId(userId);
			order.setStatus(0);
			iOrderDao.saveOrder(order);
			for (String tempshopCartId : shopCartIdArray) {
				Integer shopCartId = Integer.valueOf(tempshopCartId);
				System.out.println(shopCartId + "===============shopCartId1");
				orderVo = new OrderVo();
				List<OrderDetail> tempOrderDetailList = new ArrayList<>();
				ShopCart shopCart = iShopCartDao.getShopCart(shopCartId);
				if (shopCart != null) {
					System.out.println(shopCartId + "===============shopCartId2");
					Product product = iProductDao.getProduct(shopCart.getProductId());
					if (product != null) {
						System.out.println(shopCartId + "===============shopCartId3");
						OrderDetail orderDetail = new OrderDetail();
						int count = shopCart.getProductCount();
						orderDetail.setProductId(product.getProductId());
						orderDetail.setProductCount(count);
						orderDetail.setProductName(product.getProductName());
						orderDetail.setProductPicture(product.getMainPicture());
						Standard standard = iProductDao.getStandard(product.getProductId(), shopCart.getStandardName());
						if (standard != null) {
							System.out.println(shopCartId + "===============shopCartId4");
							BigDecimal price = standard.getPrice();
							orderDetail.setProductPrice(price);
							orderDetail.setStandardName(standard.getStandardName());
							int stock = standard.getStock();
							standard.setStock(stock - count);
							tempOrderDetailList.add(orderDetail);
							total += price.doubleValue() * count;
							Date date = new Date();
							String dateStr = DateAndStringUtil.dateAndStringFormatter(date, "yyyy-MM-dd");
							String[] dateStrs = dateStr.split("-");
							Sales sales = iProductDao.getSales(standard.getProductId(), dateStrs[0], dateStrs[1]);
							if (sales == null) {
								System.out.println(shopCartId + "===============shopCartId5");
								sales = new Sales();
								sales.setSaleCount(count);
								sales.setYear(dateStrs[0]);
								sales.setMonth(dateStrs[1]);
								sales.setProductId(standard.getProductId());
								iProductDao.saveSales(sales);
							} else {
								System.out.println(shopCartId + "===============shopCartId6");
								sales.setSaleCount(sales.getSaleCount() + count);
								iProductDao.updateSales(sales);
							}
							iProductDao.updateStandard(standard);
						}
					}
					System.out.println(shopCartId + "===============shopCartId7");
					iShopCartDao.deleteShopCart(shopCart);
				}
				order = iOrderDao.getOrder(order.getOrderNumber());
				if(flag) {
					order.setTotalPrice(new BigDecimal(0));
				}else {
					order.setTotalPrice(new BigDecimal(total));
				}
				iOrderDao.updateOrder(order);
				if (order != null) {
					System.out.println(shopCartId + "===============shopCartId8");
					for (OrderDetail orderDetail : tempOrderDetailList) {
						orderDetail.setOrderId(order.getOrderId());
						iOrderDao.saveOrderDetail(orderDetail);
						orderDetailList.add(orderDetail);
					}
					orderVo.setOrderDetailList(orderDetailList);
					orderVo.setOrderId(order.getOrderId());
					orderVo.setOrderNumber(order.getOrderNumber());
					orderVo.setTotalPrice(order.getTotalPrice().doubleValue());
					User user = iUserDao.getUser(userId);
					if (user != null) {
						orderVo.setUsername(user.getUsername());
					}

					List<Address> addressList = iAddressDao.listAddress(userId);
					if (addressList != null) {
						orderVo.setAddressList(addressList);
					}
				}
			}
		}
		return orderVo;

	}

	@Override
	public List<Order> listOrder(String userId) {
		System.out.println("listOrder方法service中");
		List<Order> orderList = iOrderDao.listOrder(userId);
		return orderList;
	}

	@Override
	public List<OrderInfoVo> getOrderInfoVoList(List<Order> orderList) {
		List<OrderInfoVo> orderInfoVoList = null;
		List<OrderDetail> unValuedList = new ArrayList<OrderDetail>();
		if (orderList != null) {
			orderInfoVoList = new ArrayList<OrderInfoVo>();
			for (Order ord : orderList) {

				OrderInfoVo orderInfoVo = new OrderInfoVo();
				orderInfoVo.setTotalPrice(ord.getTotalPrice());
				orderInfoVo.setOrderId(ord.getOrderId());
				orderInfoVo.setOrderNumber(ord.getOrderNumber());
				if (ord.getFinishTime() != null) {
					Date date = ord.getFinishTime();
					orderInfoVo.setFinishTimeStr(DateAndStringUtil.dateAndStringFormatter(date, "yyyy-MM-dd HH:mm:ss"));
				}
				if (ord.getOrderTime() != null) {
					Date date = ord.getOrderTime();
					orderInfoVo.setOrderTimeStr(DateAndStringUtil.dateAndStringFormatter(date, "yyyy-MM-dd HH:mm:ss"));
				}
				if (ord.getPayTime() != null) {
					Date date = ord.getPayTime();
					orderInfoVo.setPayTimeStr(DateAndStringUtil.dateAndStringFormatter(date, "yyyy-MM-dd HH:mm:ss"));
				}
				if (ord.getSendTime() != null) {
					Date date = ord.getSendTime();
					orderInfoVo.setSendTimeStr(DateAndStringUtil.dateAndStringFormatter(date, "yyyy-MM-dd HH:mm:ss"));
				}
				unValuedList = iOrderDao.findOrderDetailList(ord.getOrderId());
				if (ord.getAddressId() == null) {
					Address address = iAddressDao.getAddress(ord.getUserId());
					if (address != null) {
						orderInfoVo.setAddressId(address.getAddressId());
					}
				} else {
					orderInfoVo.setAddressId(ord.getAddressId());
				}
				orderInfoVo.setStatus(ord.getStatus());
				orderInfoVo.setOrderDetailList(unValuedList);
				orderInfoVoList.add(orderInfoVo);

			}
		}
		return orderInfoVoList;
	}

	@Override
	public void updateOrder(String orderNumber, Integer addressId) {
		Order order = iOrderDao.getOrder(orderNumber);
		if (order != null) {
			order.setPayTime(new Timestamp(System.currentTimeMillis()));
			order.setStatus(1);
			order.setAddressId(addressId);
			iOrderDao.updateOrder(order);
		}
	}

	@Override
	public List<OrderDetail> listOrderDetailList(int orderId) {
		List<OrderDetail> orderDetailList = null;
		orderDetailList = iOrderDao.findOrderDetailList(orderId);
		return orderDetailList;
	}

	@Override
	public void saveComment(String userId, Integer orderId, List<String> productIds, List<String> standardNames,
			List<Integer> commentNums, List<String> commentContents) {
		if (orderId != null) {
			Order order = iOrderDao.getOrder(orderId);
			if (order != null) {
				order.setStatus(4);
				iOrderDao.updateOrder(order);
				for (int i = 0; i < productIds.size(); i++) {
					System.out.println("saveComment------->service");
					Comment comment = new Comment();
					comment.setUserId(userId);
					comment.setProductId(productIds.get(i));
					comment.setStandardName(standardNames.get(i));
					comment.setStarCount(commentNums.get(i));
					comment.setCommentConte(commentContents.get(i));
					comment.setCommentTime(DateAndStringUtil.dateAndStringFormatter(new Date(), "yyyy-MM-dd HH:mm:ss"));
					iOrderDao.saveComment(comment);
				}
			}
		}

	}

	@Override
	public void updateOrderReceipt(int orderId) {
		Order order = iOrderDao.getOrder(orderId);
		order.setStatus(3);
		order.setFinishTime(new Timestamp(System.currentTimeMillis()));
		iOrderDao.updateOrder(order);
	}

	@Override
	public List<OrderInfoVo> findOrderSearchList(String searchStartTime, String searchEndTime, String searchOrderStatus) {
		
		List<Order> orderList = iOrderDao.findOrderSearchList(searchStartTime, searchEndTime, searchOrderStatus);
		List<OrderInfoVo> orderInfoVoList = null;
		if (orderList != null) {
			orderInfoVoList = new ArrayList<OrderInfoVo>();
			for (Order order : orderList) {
				OrderInfoVo orderInfoVo = new OrderInfoVo();
				BeanUtils.copyProperties(order, orderInfoVo);
				User user = iUserDao.getUser(order.getUserId());
				if (user != null) {
					orderInfoVo.setUsername(user.getUsername());
				}
				if (order.getOrderTime() != null) {
					orderInfoVo.setOrderTimeStr(
							DateAndStringUtil.dateAndStringFormatter(order.getOrderTime(), "yyyy-MM-dd HH:mm:ss"));
				}
				if (order.getPayTime() != null) {
					orderInfoVo.setPayTimeStr(
							DateAndStringUtil.dateAndStringFormatter(order.getPayTime(), "yyyy-MM-dd HH:mm:ss"));
				}
				if (order.getSendTime() != null) {
					orderInfoVo.setSendTimeStr(
							DateAndStringUtil.dateAndStringFormatter(order.getSendTime(), "yyyy-MM-dd HH:mm:ss"));
				}
				if (order.getFinishTime() != null) {
					orderInfoVo.setFinishTimeStr(
							DateAndStringUtil.dateAndStringFormatter(order.getFinishTime(), "yyyy-MM-dd HH:mm:ss"));
				}
				orderInfoVoList.add(orderInfoVo);
			}
		}
		return orderInfoVoList;
		
	}

	@Override
	public void updateOrderAddress(String orderNumber, Integer addressId) {
		Order order = iOrderDao.getOrder(orderNumber);
		order.setAddressId(addressId);
		iOrderDao.updateOrder(order);
	}
}
