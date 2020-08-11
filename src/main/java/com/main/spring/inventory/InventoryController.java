package com.main.spring.inventory;



import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class InventoryController {
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	InventoryService inventoryService;
	
	
	
	@RequestMapping(value = "/admin/inventorylist.inv", method = RequestMethod.GET)
	public ModelAndView inventorylist(	@RequestParam(defaultValue = "none") String searchField,
										@RequestParam(defaultValue = "none") String search,
										@RequestParam(defaultValue = "1") int nowPage,
										HttpServletRequest request) {
		
		int total = inventoryService.getAllProducts(searchField, search);
			
		int pageSize = 10;
		int pageFirst = (nowPage -1) * pageSize;
		int totalPage = total/pageSize + (total%pageSize==0?0:1);
		int blockSize = 5;
		int blockFirst = (nowPage/blockSize-(nowPage%blockSize==0?1:0))*blockSize + 1;
		int blockLast = blockFirst + blockSize -1;		
		if(blockLast>totalPage) blockLast=totalPage;
		List inventoryList = null;		
		
		if(!search.equals("none")) {
			inventoryList = inventoryService.getInvList(searchField, search, pageFirst, pageSize);
		} else {
			inventoryList = inventoryService.getNoSearch(pageFirst, pageSize);
		}
				
		HashMap i_map = new HashMap();
		i_map.put("pageSize", pageSize);
		i_map.put("pageFirst", pageFirst);
		i_map.put("totalPage", totalPage);
		i_map.put("blockSize", blockSize);
		i_map.put("blockFirst", blockFirst);
		i_map.put("blockLast", blockLast);
		i_map.put("nowPage", nowPage);
		
		
		mav.addObject("inventoryList", inventoryList);
		mav.addObject("searchField", searchField);
		mav.addObject("search", search);
		mav.addObject("i_map", i_map);
		mav.setViewName("admin/ad_inventory");
		return mav;
	}
	@RequestMapping(value = "/admin/addInventory.inv", method = RequestMethod.GET)
	public ModelAndView addInventory (@RequestParam int num,
									  HttpServletRequest request) {	
		inventoryService.getUpdateInv(num);
		inventoryService.getWearingList(num);
		inventoryService.getUpdateW_date(num);
		mav.setViewName("redirect:/admin/inventorylist.inv");
		return mav;
	}
	@RequestMapping(value = "/admin/subInventory.inv", method = RequestMethod.GET)
	public ModelAndView subInventory (  @RequestParam int num,
										HttpServletRequest request) {	
						
		int inventory = inventoryService.getInventory(num);
				
		if(inventory>=10) {
			inventoryService.getSubInv(num);
		}else {
			inventoryService.setZero(num);		
		}
		mav.setViewName("redirect:/admin/inventorylist.inv");
		return mav;
}
	

}
