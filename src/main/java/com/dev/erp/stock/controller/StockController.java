package com.dev.erp.stock.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.stock.model.service.StockService;

@Controller
public class StockController {

	@Autowired
	StockService stockservice;
	
	static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
	// ========================================= 원재료 재고관리 파트 =========================================
	@RequestMapping("/stock/rm/rmView.do")
	public ModelAndView selectRmStockList(ModelAndView mav) {
		
		List<Map<String, String>> rmList = stockservice.selectRmStockList();
		
		logger.info("rmList@Controller={}", rmList);
		
		mav.addObject("rmList", rmList);
		mav.setViewName("stock/rm/rmView");
		
		return mav;
	}
	
	@RequestMapping("/stock/rm/modalRmInsert.do")
	public ModelAndView modalRmInsert(ModelAndView mav) {
		
		mav.setViewName("/stock/rm/modalRmInsert");
		
		return mav;
	}
	
	@RequestMapping("/stock/rm/modalRmSearch.do")
	public ModelAndView modalRmSearch(ModelAndView mav) {
		
		mav.setViewName("/stock/rm/modalRmSearch");
		
		return mav;
	}
	
	// ========================================= 원재료 입출고관리 파트 =========================================
	@RequestMapping("/stock/rm/rmSnrView.do")
	public ModelAndView selectRmSnrStockList(ModelAndView mav) {
		
		List<Map<String, String>> rmSnrList = stockservice.selectRmSnrStockList();
		
		logger.info("rmSnrList@Controller={}", rmSnrList);
		
		mav.addObject("rmSnrList", rmSnrList);
		mav.setViewName("stock/rm/rmSnrView");
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// ========================================= 제품입고/반품관리 =========================================
	@RequestMapping("/stock/product/productView.do")
	public ModelAndView selectProductStockList(ModelAndView mav) {
		
		List<Map<String, String>> productList = stockservice.selectProductStockList();
		
		logger.info("productList@Controller={}", productList);
		
		mav.addObject("productList",productList);
		mav.setViewName("/stock/product/productView");
		
		return mav;
		
	}
	
	@RequestMapping("/stock/product/modalProductInsert.do")
	public ModelAndView modalProductInsert(ModelAndView mav) {
		
		mav.setViewName("/stock/product/modalProductInsert");
		
		return mav;
	}
	
	@RequestMapping("/stock/rm/modalProductSearch.do")
	public ModelAndView modalProductSearch(ModelAndView mav) {
		
		mav.setViewName("/stock/rm/modalProductSearch");
		
		return mav;
	}
	
	// ========================================= 창고별 재고 관리 =========================================
	@RequestMapping("/stock/storage/storageView.do")
	public ModelAndView selectStorageStockList(ModelAndView mav) {
		
		List<Map<String, String>> storageList = stockservice.selectStorageStockList();
		
		logger.info("storageList@Controller={}", storageList);
		
		mav.addObject("storageList",storageList);
		mav.setViewName("/stock/storage/storageView");
		
		return mav;
	}
	
	@RequestMapping("/stock/storage/modalStorageInsert.do")
	public ModelAndView modalStorageInsert(ModelAndView mav) {
		
		mav.setViewName("/stock/storage/modalStorageInsert");
		
		return mav;
	}
	
	@RequestMapping("/stock/storage/modalStorageSearch.do")
	public ModelAndView modalStorageSearch(ModelAndView mav) {
		
		mav.setViewName("/stock/storage/modalStorageSearch");
		
		return mav;
	}
	
	
	
	
	
	
	
	
}
