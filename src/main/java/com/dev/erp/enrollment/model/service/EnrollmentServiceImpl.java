package com.dev.erp.enrollment.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.enrollment.model.dao.EnrollmentDAO;

@Service
public class EnrollmentServiceImpl implements EnrollmentService {

	@Autowired
	EnrollmentDAO enrollmentDAO;
	
	Logger logger = LoggerFactory.getLogger(EnrollmentServiceImpl.class);
	
	
}
