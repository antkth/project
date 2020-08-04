package com.main.spring.purchase;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurchaseService {
	@Autowired
	private PurchaseDAO purchaseDAO;
	public int totalCheck;

	public int pointCheck(HttpServletRequest request) {
		int check = 0;
		String id = request.getParameter("id");
		List<Integer> cart_num = new ArrayList<Integer>();
		int total = 0 ;
		for(int i = 1 ; i > 0 ; i ++) {
		if(request.getParameter("cart_num"+i)==null) {
			break;
		}
		cart_num.add(Integer.parseInt(request.getParameter("cart_num"+i)));
		}
		for(int i = 0 ; i < cart_num.size() ; i++) {
			HashMap map = new HashMap();
			map.put("id",id);
			map.put("cart_num",cart_num.get(i));
			total += purchaseDAO.soloTotalPrice(map);
		}
		if(total < purchaseDAO.userPoint(id)) { 
			check = 1;
			HashMap map = new HashMap();
			map.put("id",id);
			map.put("total",total);
			purchaseDAO.decrpoint(map);
		} 
		return check;
	}
	public void intsertPurchase(HttpServletRequest request) {
		List<Integer> cart_num = new ArrayList<Integer>();
		int total = 0 ;
		for(int i = 1 ; i > 0 ; i ++) {
		if(request.getParameter("cart_num"+i)==null) {
			break;
		}
		cart_num.add(Integer.parseInt(request.getParameter("cart_num"+i)));
		}
		for(int i = 0 ; i < cart_num.size() ; i ++) {
			HashMap map = new HashMap();
			map.put("id",(String)request.getSession().getAttribute("id"));
			map.put("cart_num",cart_num.get(i));
			HashMap mapinfo = purchaseDAO.cartinfo(map);
			PurchaseVO purchaseVO = new PurchaseVO((Integer)mapinfo.get("num"),
												   (Integer)mapinfo.get("qty"),
												   (Integer)mapinfo.get("price"),
												   (String)mapinfo.get("id"));
			purchaseVO.setPur_num(cart_num.get(i));
			purchaseVO.setPur_status(1);
			purchaseVO.setPut_date(Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime())));
			purchaseDAO.intsertPurchase(purchaseVO);	

		}
	}
	public void deletecart(HttpServletRequest request) {
		List<Integer> cart_num = new ArrayList<Integer>();
		int total = 0 ;
		for(int i = 1 ; i > 0 ; i ++) {
		if(request.getParameter("cart_num"+i)==null) {
			break;
		}
		cart_num.add(Integer.parseInt(request.getParameter("cart_num"+i)));
		}
		for(int i = 0 ; i < cart_num.size() ; i ++) {
			HashMap map = new HashMap();
			map.put("id",(String)request.getSession().getAttribute("id"));
			map.put("cart_num",cart_num.get(i));
			purchaseDAO.deletecart(map);
		}
	}
	public List getCartList(String id) {
		return purchaseDAO.getCartList(id); 
	}
	public int getTotalPrice(String id) {
		return purchaseDAO.getTotalPrice(id);	}
	public int totalCheck(String id) {
		return purchaseDAO.totalCheck(id);
	}
	public List getpur_list(String id) {
		return purchaseDAO.getpur_list(id);
	}
	public void deleteOrderList(int pur_num) {
		purchaseDAO.deleteOrderList(pur_num);
	}
	public List ad_orderList(String sort) {
		
		  if(sort.equals("1")) sort = "not like 3"; 
		  if(sort.equals("2")) sort = "like 1"; 
		  if(sort.equals("3")) sort = "like 2";
		 
		return purchaseDAO.ad_orderList(sort);
	}
}
