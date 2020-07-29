package com.main.spring.cart;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
 
	public void addCart(CartVO cartVO) {
		cartVO.setCart_num(cartDAO.numcheck()+1);
		
		cartDAO.addCart(cartVO);
	}

	public List getCartList(String id) throws DataAccessException {

		return cartDAO.getCartList(id); 
	}
	
	public int getTotalPrice(String id) throws DataAccessException{
		
		return cartDAO.getTotalPrice(id);
	}

	public int totalCheck(String id) {
		return cartDAO.totalCheck(id);
	}
	public void deletecart(String id , int cart_num) {
		HashMap map = new HashMap();
		map.put("id",id);
		map.put("cart_num",cart_num);
		cartDAO.deletecart(map);
	}
}
