package com.main.spring.product;

import java.util.HashMap;
import java.util.List;

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
	
	public double getScoreAVG(int num) {
		return productDAO.getScoreAVG(num);
	}
	
	public int getReviewTotal(int num) {

		return productDAO.getReviewTotal(num);
	}
	
}
