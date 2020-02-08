package com.dev.erp.enrollment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.enrollment.model.service.EnrollmentService;
import com.google.gson.Gson;

@Controller
public class EnrollmentController {

	static final Logger logger = LoggerFactory.getLogger(EnrollmentController.class);
	
	@Autowired
	EnrollmentService enrollmentservice;
	
	@RequestMapping("/enrollment/productEnrollment.do")
	public void productEnrollment() {
		
	}
	
	//===============================거래처등록 start===============================
	@RequestMapping("/enrollment/vendorEnrollment.do")
	public ModelAndView selectVendorList(ModelAndView mav) {
		
		List<Map<String, String>> vendorList = enrollmentservice.selectVendorList();
		
		logger.info("vendorList@Controller={}", vendorList);
		
		mav.addObject("vendorList", vendorList);
		mav.setViewName("enrollment/vendorEnrollment");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/addVendor.do")
	public ModelAndView insertVendor(@RequestParam String vendorNo,
										 @RequestParam String vendorName,
										 @RequestParam String incharge,
										 @RequestParam String vendorPhone,
										 ModelAndView mav) {
		logger.info("vendorName@Controller={}",vendorName);
		
		Map<String, String> vendor = new HashMap<>();
		vendor.put("vendorNo", vendorNo);
		vendor.put("vendorName", vendorName);
		vendor.put("incharge", incharge);
		vendor.put("vendorPhone", vendorPhone);
		vendor.put("regDate", null);
		
		logger.info("vendor@controller={}",vendor);
		
		int result = enrollmentservice.insertVendor(vendor); 
		
		mav.addObject("vendor", vendor);
		mav.setViewName("redirect:/enrollment/vendorEnrollment.do");
		
		return mav;
	}
	
	
	@RequestMapping("/enrollment/vendorNoDuplicatedCheck.do")
	@ResponseBody
	public Map<String, Object> vendorNoDuplicatedCheck(@RequestParam("vendorNo") String vendorNo) {
		
		logger.info("vendorNo@Controller={}",vendorNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("vendorNo", vendorNo);
		
		boolean isUsable = enrollmentservice.selectOneVendorNo(vendorNo)==null?true:false;
		map.put("isUsable", isUsable);
		
		logger.info("isUsable@Controller={}",isUsable);

		return map;
	}
	
	@RequestMapping("/enrollment/updateVendor.do")
	public ModelAndView updateVendor(@RequestParam("vendorNo") String vendorNo,
									 @RequestParam("vendorName") String vendorName,
							 		 @RequestParam("incharge") String incharge,
						 		 	 @RequestParam("vendorPhone") String vendorPhone,
										 ModelAndView mav) {
		logger.info("vendorName@Controller={}",vendorName);
		
		Map<String, String> vendor = new HashMap<>();
		vendor.put("vendorNo", vendorNo);
		vendor.put("vendorName", vendorName);
		vendor.put("incharge", incharge);
		vendor.put("vendorPhone", vendorPhone);
		vendor.put("regDate", null);
		
		logger.info("vendor@controller={}",vendor);
		
		int result = enrollmentservice.updateVendor(vendor); 
		
		logger.info("result@Controller={}",result);
		
		mav.setViewName("redirect:/enrollment/vendorEnrollment.do");
		
		return mav;
	}
	
	
	@RequestMapping("/enrollment/updateVendorNo.do")
	public ModelAndView updateVendorNo(@RequestParam String vendorNoCur,
										 @RequestParam String vendorNoCha,
										 ModelAndView mav) {
		logger.info("vendorNoCur@Controller={}",vendorNoCur);
		logger.info("vendorNoCha@Controller={}",vendorNoCha);
		
		Map<String, String> vendorNo = new HashMap<>();
		vendorNo.put("vendorNoCur", vendorNoCur);
		vendorNo.put("vendorNoCha", vendorNoCha);
		
		logger.info("vendor@controller={}",vendorNo);
		
		int result = enrollmentservice.updateVendorNo(vendorNo); 
		
		logger.info("result@Controller={}",result);
		
		mav.setViewName("redirect:/enrollment/vendorEnrollment.do");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/updateVendorNo2.do")
	public ModelAndView updateVendorNo2(@RequestParam String vendorNoCur,
										 @RequestParam String vendorNoCha,
										 ModelAndView mav) {
		logger.info("vendorNoCur@Controller={}",vendorNoCur);
		logger.info("vendorNoCha@Controller={}",vendorNoCha);
		
		Map<String, String> vendorNo = new HashMap<>();
		vendorNo.put("vendorNoCur", vendorNoCur);
		vendorNo.put("vendorNoCha", vendorNoCha);
		
		logger.info("vendor@controller={}",vendorNo);
		
		int result = enrollmentservice.updateVendorNo(vendorNo); 
		
		logger.info("result@Controller={}",result);
		
		mav.setViewName("redirect:/enrollment/vendorEnrollment.do");
		
		return mav;
	}
	
	//===============================거래처등록 end===============================
	
	
	
	//===============================창고등록 start===============================
	@RequestMapping("/enrollment/warehouseEnrollment.do")
	public ModelAndView storageEnrollment(ModelAndView mav) {
		List<Map<String, String>> storageList = enrollmentservice.selectStorageList();
		
		logger.info("warehouseList@Controller={}", storageList);
		
		mav.addObject("storageList", storageList);
		mav.setViewName("enrollment/warehouseEnrollment");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/addStorage.do")
	public ModelAndView insertStorage(@RequestParam String storageNo,
										 @RequestParam String storageName,
										 ModelAndView mav) {
		
		Map<String, String> storage = new HashMap<>();
		storage.put("storageNo", storageNo);
		storage.put("storageName", storageName);
		storage.put("regDate", null);
		
		logger.info("storage@controller={}",storage);
		
		int result = enrollmentservice.insertStorage(storage); 
		
		mav.addObject("storage", storage);
		mav.setViewName("redirect:/enrollment/warehouseEnrollment.do");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/storageNoDuplicatedCheck.do")
	@ResponseBody
	public Map<String, Object> storageNoDuplicatedCheck(@RequestParam("storageNo") String storageNo) {
		
		logger.info("storageNo@Controller={}",storageNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("storageNo", storageNo);
		
		boolean isUsable = enrollmentservice.selectOneStorageNo(storageNo)==null?true:false;
		map.put("isUsable", isUsable);
		
		logger.info("isUsable@Controller={}",isUsable);

		return map;
	}
	
	@RequestMapping("/enrollment/updateStorage.do")
	public ModelAndView updateStorage(@RequestParam("storageNo") String storageNo,
									 @RequestParam("storageName") String storageName,
										 ModelAndView mav) {

		Map<String, String> storage = new HashMap<>();
		storage.put("storageNo", storageNo);
		storage.put("storageName", storageName);
		
		logger.info("storage@controller={}",storage);
		
		int result = enrollmentservice.updateStorage(storage); 
		
		logger.info("result@Controller={}",result);
		
		mav.setViewName("redirect:/enrollment/warehouseEnrollment.do");
		
		return mav;
	}
	
}
