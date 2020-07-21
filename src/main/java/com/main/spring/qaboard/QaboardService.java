package com.main.spring.qaboard;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QaboardService {
	@Autowired
	private QaboardDAO qaboardDAO;
	public void insertQaboard(QaboardVO qaboardVO,String id) {
		String today = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());
		qaboardVO.setQa_num(qaboardDAO.getqa_num(id));
		qaboardVO.setId(id);
		qaboardVO.setQa_date(Timestamp.valueOf(today));
		qaboardVO.setAnswer("답변 대기중 입니다.");
		qaboardDAO.insertQaboard(qaboardVO);
	}
	public List qalist(String id) {
		return qaboardDAO.qalist(id);
	}
	public List ad_qalist() {
		return qaboardDAO.ad_qalist();
	}
	public QaboardVO qaread(String id , int qa_num) {
		HashMap map = new HashMap();
		map.put("qa_num",qa_num);
		map.put("id",id);
		return qaboardDAO.qaread(map);
	}
	public void updatead_update(QaboardVO qaboardVO) {
		qaboardDAO.updatead_update(qaboardVO);
	}
}
