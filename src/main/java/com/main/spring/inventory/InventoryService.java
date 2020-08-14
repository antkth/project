package com.main.spring.inventory;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.spring.product.ProductVO;
import com.main.spring.resale.ResaleVO;

@Service
public class InventoryService {
	
	@Autowired
	InventoryDAO inventoryDAO;

	public int getAllProducts(String searchField, String search) {
		HashMap map = new HashMap();
		map.put("searchField", searchField);
		map.put("search", '%'+search+'%');		
		return inventoryDAO.getAllProducts(map);
	}

	public List getInvList(String searchField, String search, int pageFirst, int pageSize) {
		HashMap map = new HashMap();
		map.put("searchField", searchField);
		map.put("search", '%'+search+'%');
		map.put("pageFirst", pageFirst);
		map.put("pageSize", pageSize);
		return inventoryDAO.getInvList(map);
	}

	public List getNoSearch(int pageFirst, int pageSize) {
		HashMap map = new HashMap();
		map.put("pageFirst", pageFirst);
		map.put("pageSize", pageSize);
		return inventoryDAO.getNoSearch(map);
	}

	public void getUpdateInv(int num) {	
		inventoryDAO.getUpdateInv(num);
	}
	public void getUpdateW_date(int num) {
		inventoryDAO.getUpdateW_date(num);
	}
	public void getSubInv(int num) {
		inventoryDAO.getSubInv(num);
	}
	public int getInventory(int num) {
		return inventoryDAO.getInventory(num);
	}
	public void setZero(int num) {
		inventoryDAO.setZero(num);		
	}
	public void addCalendar(ProductVO productVO) {
		inventoryDAO.addCalendar(productVO);
	}
	public void addexp_date(int num) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss",Locale.KOREA);
		Calendar time = Calendar.getInstance();
		time.add(Calendar.MONTH,6);
		String nowTime = format.format(time.getTime());
		HashMap map = new HashMap();
		map.put("exp_date",nowTime);
		map.put("num",num);
		inventoryDAO.addexp_date(map);
	}
}
