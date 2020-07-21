package com.main.spring.product;

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
	
}
