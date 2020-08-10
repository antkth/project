package com.main.spring.wearingnotice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WearingnoticeService {
	@Autowired
	private WearingnoticeDAO wearingnoticeDAO;
	public void insertwearing(WearingnoticeVO wearingnoticeVO) {
		wearingnoticeDAO.insertwearing(wearingnoticeVO);
	}
}
