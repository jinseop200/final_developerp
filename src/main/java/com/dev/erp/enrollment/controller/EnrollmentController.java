package com.dev.erp.enrollment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.common.util.Utils;
import com.dev.erp.enrollment.model.service.EnrollmentService;
import com.google.gson.Gson;

@Controller
public class EnrollmentController {

	static final Logger logger = LoggerFactory.getLogger(EnrollmentController.class);
	
	@Autowired
	EnrollmentService enrollmentservice;
	
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
	
	//===============================창고등록 end===============================
	
	
	
	//===============================품목등록 start===============================
	
	@RequestMapping("/enrollment/productEnrollment.do")
	public ModelAndView productEnrollment(ModelAndView mav) {
		
		List<Map<String, String>> productList = enrollmentservice.selectproductList();
		
		logger.info("vendorList@Controller={}", productList);
		
		mav.addObject("productList", productList);
		mav.setViewName("enrollment/productEnrollment");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/insertProduct.do")
	public ModelAndView insertProduct(@RequestParam String productNo,
										 @RequestParam String accountNo,
										 @RequestParam String ptNo,
										 @RequestParam String productName,
										 @RequestParam String inPrice,
										 @RequestParam String outPrice,
										 @RequestParam String spec,
										 @RequestParam String tol,
										 ModelAndView mav) {
		
		Map<String, String> product = new HashMap<>();
		product.put("productNo", productNo);
		product.put("accountNo", accountNo);
		product.put("ptNo", ptNo);
		product.put("productName", productName);
		product.put("inPrice", inPrice);
		product.put("outPrice", outPrice);
		product.put("spec", spec);
		product.put("tol", tol);
		product.put("regDate", null);
		
		logger.info("product@controller={}",product);
		
		int result = enrollmentservice.insertProduct(product); 
		
		mav.addObject("product", product);
		mav.setViewName("redirect:/enrollment/productEnrollment.do");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/productNoDuplicatedCheck.do")
	@ResponseBody
	public Map<String, Object> productNoDuplicatedCheck(@RequestParam("productNo") String productNo) {
		
		logger.info("productNo@Controller={}",productNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("productNo", productNo);
		
		boolean isUsable = enrollmentservice.selectOneProductNo(productNo)==null?true:false;
		map.put("isUsable", isUsable);
		
		logger.info("isUsable@Controller={}",isUsable);

		return map;
	}
	
	@RequestMapping("/enrollment/searchSpecify.do")
	public ModelAndView searchSpecify(ModelAndView mav, @RequestParam("searchType") String searchType) {
		
		mav.addObject("searchType",searchType);
		mav.setViewName("enrollment/searchSpecify");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/searchSpecifyPage.do")
	@ResponseBody
	public Map<String,Object> searchSpecify(@RequestParam("searchType") String searchType, @RequestParam(defaultValue="1") int cPage, HttpServletResponse rexsponse) {
		
		List<Map<String,String>> list = new ArrayList<>();
		final int numPerPage = 5;
		int totalContents = 0;
		switch(searchType) {
		case "accountNo" : 
			list = enrollmentservice.selectAccountAll(cPage,numPerPage);  
			totalContents = enrollmentservice.selectAllCountByAccountNo(); 
			break;
		case "ptNo" :  
			list =  enrollmentservice.selectProductTypeAll(cPage,numPerPage); 
			totalContents = enrollmentservice.selectAllCountByProductNo();
			break;
		case "rawMaterial" :  
			list =  enrollmentservice.selectRawmaterialAll(cPage,numPerPage); 
			totalContents = enrollmentservice.selectAllRawmaterial();
			break;
//		case "qualityNo" : 
//			list = enrollmentservice.selectQualityColumn("quality_no", cPage,numPerPage);  
//			totalContents = enrollmentservice.selectAllCountForQuality();
//			break;
//		case "type" :  
//			list = enrollmentservice.selectProductTypeAll(); 
			
//			break;
		}
		String url = "searchSpecifyPage.do?searchType="+searchType;
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, url);
		
		Map<String,Object> map = new HashMap<>();
		map.put("numPerPage",numPerPage);
		map.put("cPage",cPage);
		map.put("totalContents",totalContents);
		map.put("searchType",searchType);
		map.put("speclist",list);
		map.put("pageBar", pageBar);
		return map;
	}
	
	//Form 연결
	@RequestMapping("/enrollment/addProductForm.do")
	public ModelAndView addProductForm(ModelAndView mav) {
		
		mav.setViewName("enrollment/addProductForm");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/addSemiProductForm.do")
	public ModelAndView addSemiProductForm(ModelAndView mav) {
		
		mav.setViewName("enrollment/addSemiProductForm");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/addRawMeterialForm.do")
	public ModelAndView addRawMeterialForm(ModelAndView mav) {
		
		mav.setViewName("enrollment/addRawMeterialForm");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/updateRawMeterialForm.do")
	public ModelAndView updateRawMeterialForm(ModelAndView mav) {
		
		mav.setViewName("enrollment/updateRawMeterialForm");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/updateSemiProductForm.do")
	public ModelAndView updateSemiProductForm(ModelAndView mav) {
		
		mav.setViewName("enrollment/updateSemiProductForm");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/updateProductForm.do")
	public ModelAndView updateProductForm(ModelAndView mav) {
		
		mav.setViewName("enrollment/updateProductForm");
		
		return mav;
	}
	
	//Form연결 끝
	
	@RequestMapping("/enrollment/productNoDuplicatedCheckForRawMaterial.do")
	@ResponseBody
	public Map<String, Object> productNoDuplicatedCheckForRawMaterial(@RequestParam("productNo") String productNo) {
		
		logger.info("productNo@Controller={}",productNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("productNo", productNo);
		
		boolean isUsable = enrollmentservice.selectOneProductNoForRawMaterial(productNo)==null?true:false;
		map.put("isUsable", isUsable);
		
		logger.info("isUsable@Controller={}",isUsable);

		return map;
	}
	
	@RequestMapping("/enrollment/insertRawMaterial.do")
	public ModelAndView insertRawMaterial(@RequestParam String productNo,
										 @RequestParam String accountNo,
										 @RequestParam String ptNo,
										 @RequestParam String delivery,
										 @RequestParam String productName,
										 @RequestParam String inPrice,
										 @RequestParam String outPrice,
										 @RequestParam String spec,
										 @RequestParam String tol,
										 ModelAndView mav) {
		
		Map<String, String> rawMaterial = new HashMap<>();
		rawMaterial.put("productNo", productNo);
		rawMaterial.put("accountNo", accountNo);
		rawMaterial.put("ptNo", ptNo);
		rawMaterial.put("delivery", delivery);
		rawMaterial.put("productName", productName);
		rawMaterial.put("inPrice", inPrice);
		rawMaterial.put("outPrice", outPrice);
		rawMaterial.put("spec", spec);
		rawMaterial.put("tol", tol);
		rawMaterial.put("regDate", null);
		
		logger.info("rawMaterial@controller={}",rawMaterial);
		
		int result = enrollmentservice.insertRawMaterial(rawMaterial); 
		
		mav.addObject("rawMaterial", rawMaterial);
		mav.setViewName("redirect:/enrollment/productEnrollment.do");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/updateProductNo.do")
	public ModelAndView updateProductNo(@RequestParam String productNoCur,
										 @RequestParam String productNoCha,
										 ModelAndView mav) {
		logger.info("productNoCur@Controller={}",productNoCur);
		logger.info("productNoCha@Controller={}",productNoCha);
		
		Map<String, String> productNo = new HashMap<>();
		productNo.put("productNoCur", productNoCur);
		productNo.put("productNoCha", productNoCha);
		
		logger.info("productNo@controller={}",productNo);
		
		int result = enrollmentservice.updateProductNo(productNo); 
		
		logger.info("result@Controller={}",result);
		
		mav.setViewName("redirect:/enrollment/productEnrollment.do");
		
		return mav;
	}

	@RequestMapping("/enrollment/updateRawMaterial.do")
	public ModelAndView updateRawMaterial(@RequestParam("productNo") String productNo,
									 @RequestParam("accountNo") String accountNo,
							 		 @RequestParam("ptNo") String ptNo,
						 		 	 @RequestParam("delivery") String delivery,
						 		 	 @RequestParam("productName") String productName,
						 		 	 @RequestParam("inPrice") String inPrice,
						 		 	 @RequestParam("outPrice") String outPrice,
						 		 	 @RequestParam("spec") String spec,
						 		 	 @RequestParam("tol") String tol,
										 ModelAndView mav) {
		
		Map<String, String> rawMaterial = new HashMap<>();
		rawMaterial.put("productNo", productNo);
		rawMaterial.put("accountNo", accountNo);
		rawMaterial.put("ptNo", ptNo);
		rawMaterial.put("delivery", delivery);
		rawMaterial.put("productName", productName);
		rawMaterial.put("inPrice", inPrice);
		rawMaterial.put("outPrice", outPrice);
		rawMaterial.put("spec", spec);
		rawMaterial.put("tol", tol);
		
		logger.info("rawMaterial@controller={}",rawMaterial);
		
		int result = enrollmentservice.updateRawMaterial(rawMaterial); 
		
		logger.info("result@Controller={}",result);
		
		mav.setViewName("redirect:/enrollment/productEnrollment.do");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/updateProduct.do")
	public ModelAndView updateProduct(@RequestParam("productNo") String productNo,
									 @RequestParam("accountNo") String accountNo,
							 		 @RequestParam("ptNo") String ptNo,
						 		 	 @RequestParam("productName") String productName,
						 		 	 @RequestParam("inPrice") String inPrice,
						 		 	 @RequestParam("outPrice") String outPrice,
						 		 	 @RequestParam("spec") String spec,
						 		 	 @RequestParam("tol") String tol,
										 ModelAndView mav) {
		
		Map<String, String> product = new HashMap<>();
		product.put("productNo", productNo);
		product.put("accountNo", accountNo);
		product.put("ptNo", ptNo);
		product.put("productName", productName);
		product.put("inPrice", inPrice);
		product.put("outPrice", outPrice);
		product.put("spec", spec);
		product.put("tol", tol);
		
		logger.info("product@controller={}",product);
		
		int result = enrollmentservice.updateProduct(product); 
		
		logger.info("result@Controller={}",result);
		
		mav.setViewName("redirect:/enrollment/productEnrollment.do");
		
		return mav;
	}
	
	@RequestMapping("/enrollment/updateProductNoForProductList.do")
	public ModelAndView updateProductNoForProductList(@RequestParam String productNoCur,
										 @RequestParam String productNoCha,
										 ModelAndView mav) {
		logger.info("productNoCur@Controller={}",productNoCur);
		logger.info("productNoCha@Controller={}",productNoCha);
		
		Map<String, String> productNo = new HashMap<>();
		productNo.put("productNoCur", productNoCur);
		productNo.put("productNoCha", productNoCha);
		
		logger.info("productNo@controller={}",productNo);
		
		int result = enrollmentservice.updateProductNoForProductList(productNo); 
		
		logger.info("result@Controller={}",result);
		
		mav.setViewName("redirect:/enrollment/productEnrollment.do");
		
		return mav;
	}
	
	
	//===============================품목등록 end===============================	
	
}
