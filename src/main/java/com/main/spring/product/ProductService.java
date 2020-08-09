package com.main.spring.product;

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
		if(productVO.getCategory1().equals("고양이")) {
		if(check.equals("사료")||check.equals("간식")||check.equals("치약")) {
			productVO.setCategory2("Food");
		}else if(check.equals("스크래쳐")||check.equals("캣타워")||check.equals("소형장난감")) {
			productVO.setCategory2("Toys");
		}else {
			productVO.setCategory2("DailyProducts");
		}
		}else {
			if(check.equals("수제간식")||check.equals("사료")) {
				productVO.setCategory2("식품");
			}else if(check.equals("노즈워크매트")||check.equals("봉제장난감")||check.equals("라텍스")) {
				productVO.setCategory2("장난감");
			}else {
				productVO.setCategory2("생활용품");
			}
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
		HttpSession session = request.getSession();	//세션 영역 생성
		boolean check = true;	//중복 체크 도구 
		for(int i = 1 ; i <=5 ; i ++) {	//세션영역 1 ~ 5 중복 , 현제들어있는지 체크
			if(session.getAttribute("lastview"+i+"_num")!=null) {	//길이체크
				if(num==Integer.parseInt(session.getAttribute("lastview"+i+"_num").toString())) { //중복체크
					check = false;
				}
			}
		}
		if(check) {
		if(session.getAttribute("lastview4_num")!=null) {	//4 > 5
			session.setAttribute("lastview5_num",session.getAttribute("lastview4_num"));
			session.setAttribute("lastview5_name",session.getAttribute("lastview4_name"));
			session.setAttribute("lastview5_image",session.getAttribute("lastview4_image"));
		}
		if(session.getAttribute("lastview3_num")!=null) {	//3 > 4
			session.setAttribute("lastview4_num",session.getAttribute("lastview3_num"));
			session.setAttribute("lastview4_name",session.getAttribute("lastview3_name"));
			session.setAttribute("lastview4_image",session.getAttribute("lastview3_image"));
		}
		if(session.getAttribute("lastview2_num")!=null) {	//2 > 3
			session.setAttribute("lastview3_num",session.getAttribute("lastview2_num"));
			session.setAttribute("lastview3_name",session.getAttribute("lastview2_name"));
			session.setAttribute("lastview3_image",session.getAttribute("lastview2_image"));
		}
		if(session.getAttribute("lastview1_num")!=null) {	//1 > 2
			session.setAttribute("lastview2_num",session.getAttribute("lastview1_num"));
			session.setAttribute("lastview2_name",session.getAttribute("lastview1_name"));
			session.setAttribute("lastview2_image",session.getAttribute("lastview1_image"));
		}
		session.setAttribute("lastview1_num",num);	//1자리에 등록
		session.setAttribute("lastview1_name",name);
		session.setAttribute("lastview1_image",image);
		}
		return request;	//리퀘스트 반환
	}
	
	public double getScoreAVG(int num) {
		return productDAO.getScoreAVG(num);
	}
	
	public int getReviewTotal(int num) {

		return productDAO.getReviewTotal(num);
	}
	public int wishCheck(int num , String id) {
		HashMap map = new HashMap();
		map.put("num",num);
		map.put("id",id);
		return productDAO.wishCheck(map);
	}
	public void addwishlist(int num , String id) {
		HashMap map = new HashMap();
		map.put("num",num);
		map.put("id",id);
		productDAO.addwishlist(map);
	}
	public List wishlist(String id) {
		return productDAO.wishlist(id);
	}
	public void deletewish(String id , int num) {
		HashMap map = new HashMap();
		map.put("id",id);
		map.put("num",num);
		productDAO.deletewish(map);
	}
	
	public List worstProductList() {
		return productDAO.worstProductList();
	}
	
	public List bestProductList() {
		return productDAO.bestProductList();
	}
	
	public List searchList(String key) {
		HashMap map = new HashMap();
		map.put("key",'%'+key+'%'); 
		return productDAO.searchList(map);
	} 
	 

	
}
