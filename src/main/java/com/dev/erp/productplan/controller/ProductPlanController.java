package com.dev.erp.productplan.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev.erp.productplan.model.service.ProductPlanService;

@Controller
public class ProductPlanController {

	static final Logger logger = LoggerFactory.getLogger(ProductPlanController.class);
	
	@Autowired
	ProductPlanService productPlanService;
	
	@RequestMapping("/productplan/jobOrder.do")
	public void jobOrder() {
		
	}
	
	@RequestMapping("/productplan/insertJobOrder.do")
	public void insertJobOrder() {
		
	}	
}
