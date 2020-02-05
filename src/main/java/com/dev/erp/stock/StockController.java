package com.dev.erp.stock;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.quality.controller.qualityController;

@Controller
public class StockController {

	static final Logger logger = LoggerFactory.getLogger(qualityController.class);
	
	// ============= 원재료 재고관리 파트 =============
	@RequestMapping("/stock/rm/rmView.do")
	public ModelAndView rmView(ModelAndView mav) {
		
		mav.setViewName("/stock/rm/rmView");
		
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
	
	// ============= 제품입고/반품관리 =============
	@RequestMapping("/stock/product/productView.do")
	public ModelAndView productView(ModelAndView mav) {
		
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
	
	// ============= 창고별 재고 관리 =============
	@RequestMapping("/stock/storage/storageView.do")
	public ModelAndView storageView(ModelAndView mav) {
		
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
