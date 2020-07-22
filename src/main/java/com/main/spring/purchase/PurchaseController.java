package com.main.spring.purchase;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseController {
	@Autowired
	private PurchaseService purchaseService;
	private ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "/purchase.pur", method = RequestMethod.POST)
	public ModelAndView join(@RequestParam String id,HttpServletRequest request) {
		int check = purchaseService.pointCheck(request);
		if(check==0) {
			request.setAttribute("msg","금액이 부족합니다");
			mav.setViewName("redirect:/cartList.pur");
			return mav;
		}
		purchaseService.intsertPurchase(request);
		purchaseService.deletecart(request);
		request.getSession().setAttribute("msg","구매가 완료되었습니다.");
		mav.setViewName("redirect:/cartList.pur");
		return mav;
	}
	@RequestMapping(value = "/cartList.pur", method=RequestMethod.GET)
	public ModelAndView cartList(HttpServletRequest request, 
								HttpServletResponse response) throws Exception {
		String id = (String)request.getSession().getAttribute("id");
		System.out.println(1);
		List cartList = purchaseService.getCartList(id);
		System.out.println(3);
		int total = purchaseService.getTotalPrice(id);
		System.out.println(2);
		mav.addObject("msg",(String)request.getSession().getAttribute("msg"));
		mav.addObject("cartList", cartList);
		mav.addObject("total",total);
		request.getSession().removeAttribute("msg");
		mav.setViewName("cartList");
		return mav;
	}
}
