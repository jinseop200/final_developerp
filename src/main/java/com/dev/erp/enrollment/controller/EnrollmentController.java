package com.dev.erp.enrollment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev.erp.enrollment.model.service.EnrollmentService;

@Controller
public class EnrollmentController {

	static final Logger logger = LoggerFactory.getLogger(EnrollmentController.class);
	
	@Autowired
	EnrollmentService enrollmentservice;
	
	@RequestMapping("/enrollment/productEnrollment.do")
	public void productEnrollment() {
		
	}
	
	@RequestMapping("/enrollment/warehouseEnrollment.do")
	public void warehouseEnrollment() {
		
	}
	
	@RequestMapping("/enrollment/vendorEnrollment.do")
	public void vendorEnrollment() {
		
	}
	
	
}
