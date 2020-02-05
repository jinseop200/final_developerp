package com.dev.erp.attend.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dev.erp.attend.model.dao.AttendDAO;


public class AttendServiceImpl implements AttendService {
	static final Logger logger = LoggerFactory.getLogger(AttendServiceImpl.class);

	@Autowired
	AttendDAO attendDAO;
	@Override
	public int attendant(String email) {
		return attendDAO.attendant(email);
	}

}
