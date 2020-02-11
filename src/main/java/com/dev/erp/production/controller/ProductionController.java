package com.dev.erp.production.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.enrollment.model.service.EnrollmentService;
import com.dev.erp.production.model.service.ProductionService;


@Controller
public class ProductionController {
	
	static final Logger logger = LoggerFactory.getLogger(ProductionController.class);

	@Autowired
	ProductionService productionService;
	
	@Autowired
	EnrollmentService enrollmentService;
	
	@RequestMapping("/production/BOMListManagement.do")
	public ModelAndView BOMListManagement(ModelAndView mav) {
		
		List<Map<String, String>> productList = enrollmentService.selectproductList();
		
		logger.info("vendorList@Controller={}", productList);
		
		mav.addObject("productList", productList);
		mav.setViewName("production/BOMListManagement");
		return mav;
	}
	
	@RequestMapping("/production/warehousing.do")
	public ModelAndView warehousing(ModelAndView mav) {
		
		mav.setViewName("production/warehousing");
		return mav;
	}
	
	//add
	@RequestMapping("/production/addBOMForm.do")
	public ModelAndView addBOMForm(ModelAndView mav) {
		
		mav.setViewName("production/addBOMForm");
		return mav;
	}

	
	@RequestMapping("/production/selectRawMaterialList.do")
	public ModelAndView selectRawMaterialList(ModelAndView mav) {
		
		List<Map<String, String>> rawmaterialList = productionService.selectRawMaterialList();
		
		mav.addObject("rawmaterialList",rawmaterialList);
		return mav;
	}
	
	@RequestMapping(value="/product/addBOM.do", method=RequestMethod.POST)
	@ResponseBody
	public Object addBOM(@RequestParam(value="pNames[]", required=false) List<String> pNameList,
										 ModelAndView mav) {
		logger.info("data_@Controller={}",pNameList);
		System.out.println(pNameList);
//		Map<String, String> vendor = new HashMap<>();
//		vendor.put("vendorNo", vendorNo);
//		vendor.put("vendorName", vendorName);
//		vendor.put("incharge", incharge);
//		vendor.put("vendorPhone", vendorPhone);
//		vendor.put("regDate", null);
//		
//		logger.info("vendor@controller={}",vendor);
		
		//int result = enrollmentservice.insertVendor(vendor); 
		
		//mav.addObject("vendor", vendor);
		
		return pNameList;
	}
	
	
}
