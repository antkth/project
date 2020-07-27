package com.main.spring.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	@Autowired
	private ProductDAO productDAO;
	public void proinsert(ProductVO productVO) {
		productVO.setNum(productDAO.numcheck()+1);
		String check = productVO.getCategory3();
		if(check.equals("사료")||check.equals("간식")||check.equals("치약")) {
			productVO.setCategory2("Food");
		}else if(check.equals("스크래쳐")||check.equals("캣타워")||check.equals("소형장난감")) {
			productVO.setCategory2("Toys");
		}else {
			productVO.setCategory2("DailyProducts");
		}
		productVO.setInventory(0);
		productDAO.proinsert(productVO);
	}
	public List getProductList6(int number, String category1, String category3) throws DataAccessException {
		return productDAO.getProductList6(number, category1, category3);
	}
	
	public ProductVO getProductInfo(int num) {
		return productDAO.getProductInfo(num);
	}
	public List getKeyList(String search_key, String category1, String category3, int pageFirst, int pageSize) {
		HashMap map = new HashMap();
		
		map.put("search_key", search_key);
		map.put("category1", category1);
		map.put("category3", category3);
		map.put("pageFirst", pageFirst);
		map.put("pageSize", pageSize);
		return productDAO.getKeyList(map);		
	}
	public int getAllProduct(String search_key, String category1, String category3) {
		HashMap map = new HashMap();
		map.put("search_key", '%'+search_key+'%');			
		map.put("category1", category1);		
		map.put("category3", category3);		
		return productDAO.getAllProduct(map);
	}
	public HttpServletRequest lastview(HttpServletRequest request,int num,String name , String image) {
		HttpSession session = request.getSession();
		List list = new ArrayList();
		boolean check = true;
		for(int i = 1 ; i <=5 ; i ++) {
			if(session.getAttribute("lastview"+i+"_num")!=null) {
				if(num==Integer.parseInt(session.getAttribute("lastview"+i+"_num").toString())) {
					check = false;
				}
			}
		}
		if(check) {
		if(session.getAttribute("lastview4_num")!=null) {
			session.setAttribute("lastview5_num",session.getAttribute("lastview4_num"));
			session.setAttribute("lastview5_name",session.getAttribute("lastview4_name"));
			session.setAttribute("lastview5_image",session.getAttribute("lastview4_image"));
		}
		if(session.getAttribute("lastview3_num")!=null) {
			session.setAttribute("lastview4_num",session.getAttribute("lastview3_num"));
			session.setAttribute("lastview4_name",session.getAttribute("lastview3_name"));
			session.setAttribute("lastview4_image",session.getAttribute("lastview3_image"));
		}
		if(session.getAttribute("lastview2_num")!=null) {
			session.setAttribute("lastview3_num",session.getAttribute("lastview2_num"));
			session.setAttribute("lastview3_name",session.getAttribute("lastview2_name"));
			session.setAttribute("lastview3_image",session.getAttribute("lastview2_image"));
		}
		if(session.getAttribute("lastview1_num")!=null) {
			session.setAttribute("lastview2_num",session.getAttribute("lastview1_num"));
			session.setAttribute("lastview2_name",session.getAttribute("lastview1_name"));
			session.setAttribute("lastview2_image",session.getAttribute("lastview1_image"));
		}
		session.setAttribute("lastview1_num",num);
		session.setAttribute("lastview1_name",name);
		session.setAttribute("lastview1_image",image);
		}
		return request;
	}
	
	public double getScoreAVG(int num) {
		return productDAO.getScoreAVG(num);
	}
	
	public int getReviewTotal(int num) {

		return productDAO.getReviewTotal(num);
	}
	
}
