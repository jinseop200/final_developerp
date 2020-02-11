package com.dev.erp.productplan.controller;

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

import com.dev.erp.common.util.Utils;
import com.dev.erp.productplan.model.service.ProductPlanService;

@Controller
public class ProductPlanController {

	static final Logger logger = LoggerFactory.getLogger(ProductPlanController.class);
	
	@Autowired
	ProductPlanService productPlanService;
	
	//============================원재료 구매계획============================
	@RequestMapping("/productplan/purchasePlan.do")
	public ModelAndView purchasePlanView(ModelAndView mav) {
		
		mav.setViewName("productplan/purchasePlan");
		return mav;
	}
	
	@RequestMapping("/productplan/endProductList.do")
	public ModelAndView searchSpecify(ModelAndView mav) {
		
		mav.setViewName("productplan/endProductList");
		
		return mav;
	}
	@RequestMapping("/productplan/endProductListPage.do")
	@ResponseBody
	public ModelAndView selectEndProduct(ModelAndView mav,
										 @RequestParam(defaultValue="1") int cPage) {
		
		final int numPerPage = 5;
		int totalContents = 0;
		List<Map<String, String>> list = productPlanService.selectEndProduct(cPage, numPerPage);
		logger.info("listCheck={}", list);
		totalContents= productPlanService.selectTotalContentsByEp();
		
		String url = "endProductListPage.do";
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, url);
		
		mav.addObject("endProductList", list);
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("pageBar", pageBar);
		logger.info("mavCheck={}"+mav);
		return mav;
	}
	
	
	
	
	//============================작업지시서============================
	//작업지시서 조회
	@RequestMapping("/productplan/jobOrder.do")
	public ModelAndView joView(ModelAndView mav) {
		List<Map<String, String>> joList = productPlanService.selectJobOrder();
		logger.info("joList@Controller={}", joList);
		
		mav.addObject("joList", joList);
		mav.setViewName("productplan/jobOrder");
		
		return mav;
	}
	//작업지시서 등록 폼
	@RequestMapping("/productplan/insertJobOrder.do")
	public ModelAndView insertJobOrderForm(ModelAndView mav) {
		
		mav.setViewName("productplan/insertJobOrder");
		
		return mav;
	}
	//작업지시서 신규등록
	@RequestMapping("/productplan/insertJobOrderEnd.do")
	public ModelAndView insertJobOrder(@RequestParam String enrollDate,
									   @RequestParam String dueDate,
									   @RequestParam String customer,
									   @RequestParam String manager,
									   @RequestParam String productName,
									   @RequestParam String quantity,
									   ModelAndView mav) {
		
		Map<String, String> joList = new HashMap<>();
		joList.put("enrollDate", enrollDate);
		joList.put("dueDate", dueDate);
		joList.put("customer", customer);
		joList.put("manager", manager);
		joList.put("productName", productName);
		joList.put("quantity", quantity);
		
		logger.info("joList@controller={}", joList);
		int result = productPlanService.insertJobOrder(joList);
		
		mav.addObject("joList", joList);
		mav.setViewName("productplan/jobOrder");
		return mav;
		
	}
	//작업지시서 수정
	@RequestMapping("productplan/updateJobOrder.do")
	public ModelAndView updateJobOrderForm(ModelAndView mav) {
		
		mav.setViewName("productplan/updateJobOrder");
		return mav;
	}
	
	//작업지시서 삭제
	@RequestMapping("productplan/deleteOneJo.do")
	public ModelAndView deleteOneJo(@RequestParam("joNo") int joNo, 
									ModelAndView mav) {
		
		int result = productPlanService.deleteOneJo(joNo);
		mav.addObject("msg", result>0?"삭제 성공!":"삭제 실패!");
		mav.addObject("loc","/productplan/jobOrder.do");
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	
}
