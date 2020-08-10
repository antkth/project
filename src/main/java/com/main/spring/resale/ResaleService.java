package com.main.spring.resale;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResaleService {
	
	@Autowired
	private ResaleDAO resaleDAO;
	
	public void insertResale(ResaleVO resaleVO) {
		resaleDAO.insertResale(resaleVO);
	}
	public void checkResale() {
//		  3. 운영자가 정기구독 페이지 확인함(매일 /오늘날짜)
		List checkResaleList = resaleDAO.checkResale();
//		  4. 정기구독 리스트에서 정기구매 전송 날짜가 오늘인 신청인이 있으면 물건보냄(그 신청인 id의 포인트를 가져와서 가격비교)
//		  	for문 -> 그 아이디를 기준으로 포인트 가져옴
//		  	num / 갯수 통해서 가격 가져옴
		for(int i=0; i < checkResaleList.size(); i++) {
			ResaleVO resaleVO = (ResaleVO)checkResaleList.get(i);
			int userPoint = resaleDAO.userPoint(resaleVO.getId());
			int productPrice = Math.round(resaleDAO.getPrice(resaleVO.getNum()) * resaleVO.getQty()/100*70/100)*100;
			
			Timestamp date = resaleVO.getRe_date();
			Date d = Date.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(date));
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(d);
			calendar.add(Calendar.DATE, resaleVO.getPeriod());
			int month = calendar.get(Calendar.MONTH)+1;
			String time = calendar.get(Calendar.YEAR)+"-"+month+"-"+calendar.get(Calendar.DATE)+" 00:00:00";
			Timestamp redate = Timestamp.valueOf(time);
			
			if(userPoint >= productPrice) {
				//1. 멤버의 포인트를 깐다
				HashMap map = new HashMap();
				map.put("total", productPrice);
				map.put("id", resaleVO.getId());
				resaleDAO.decrpoint(map);
				//2. 물건을 보낸다
				map.put("num", resaleVO.getNum());
				map.put("qty", resaleVO.getQty());
				map.put("price", productPrice);
				resaleDAO.re_addCart(map);
				
				int numcheck = resaleDAO.numcheck();
				//3. 구매목록에 올림
				map.put("pur_num", numcheck);
				resaleDAO.re_intsertPurchase(map);
				//4. 카드 비우기
				map.put("cart_num", numcheck);
				resaleDAO.deletecart(map);
			}
//		  	 	 비교를 해서 결제(포인트까고) 물건 결제해주고 날짜 업뎃ㅎㅐ주고
//		 		 5. 정기구독 테이블 업데이트(주기는 오늘날짜+주기)
			HashMap map2 = new HashMap();
			map2.put("re_date", redate);
			map2.put("re_num", resaleVO.getRe_num());
			resaleDAO.updateResale(map2);
		}
	}
	public List resaleList() {
		return resaleDAO.resaleList();
	}
	public List myResaleList(String id) {
		return resaleDAO.myResaleList(id);
	}
	

}
