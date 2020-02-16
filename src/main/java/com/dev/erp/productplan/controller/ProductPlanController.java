package com.dev.erp.productplan.controller;

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
import com.dev.erp.productplan.model.service.ProductPlanService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ProductPlanController {

	static final Logger logger = LoggerFactory.getLogger(ProductPlanController.class);
	
	@Autowired
	ProductPlanService productPlanService;
	
	// list<map> 을 json 형태로 변형.
	@SuppressWarnings({ "unchecked" })
	public static JSONArray convertListToJson(List<Map<String, String>> firstPL) {
		JSONArray jsonArray = new JSONArray();
		for (Map<String, String> map : firstPL) {
			jsonArray.add(convertMapToJson(map));
		}
		return jsonArray;
	}

	// map 을 json 형태로 변형
	@SuppressWarnings({ "unchecked" })
	public static JSONObject convertMapToJson(Map<String, String> map) {

		JSONObject json = new JSONObject();
		for (Map.Entry<String, String> entry : map.entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			// json.addProperty(key, value);
			json.put(key, value);
		}
		return json;
	}


	
	//============================월별생산 계획============================
	@RequestMapping("/productplan/productionPlan.do")
	public ModelAndView productionPlan(ModelAndView mav) {
		
		
		mav.setViewName("productplan/monthlyPlan");
		
		return mav;
	}
	
	//============================원재료 구매계획============================
	//헤더 ->
	@RequestMapping("/productplan/purchasePlan.do")
	public ModelAndView purchasePlanView(ModelAndView mav) {
		
		
		List<Map<String, String>> firstPL = productPlanService.selectFirstByPL();
		JSONArray JfirstPL = convertListToJson(firstPL);
		mav.addObject("firstPL", JfirstPL);
		mav.addObject("beforeSearch","1");
		logger.info("민병준={}", firstPL);
		mav.setViewName("productplan/purchasePlan");
		
		return mav;
	}
	
	@RequestMapping("/productplan/endProductList.do")
	public ModelAndView searchSpecify(ModelAndView mav) {
		
		mav.setViewName("productplan/endProductList");
		
		return mav;
	}
	@RequestMapping(value="/productplan/endProductListPage.do")
	@ResponseBody
	public ModelAndView selectEndProduct(ModelAndView mav,
										 @RequestParam(defaultValue="1") int cPage, HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");

		final int numPerPage = 5;
		int totalContents = 0;
		List<Map<String, String>> list = productPlanService.selectEndProduct(cPage, numPerPage);
		logger.info("listCheck={}", list);
		totalContents= productPlanService.selectTotalContentsByEp();
		
		String url = "endProductListPage.do?";
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, url);
		
		mav.addObject("endProductList", list);
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("pageBar", pageBar);
		mav.addObject("AfterSearch","2");
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//제품명에 따른 그래프 ajax
	@RequestMapping("/productplan/showChartByProduct.do")
	@ResponseBody
	public ModelAndView showChartByProduct(ModelAndView mav,
										   @RequestParam String productNo,
										   HttpServletResponse response) {
		
		response.setContentType("text/html;charset=UTF-8");
		logger.info("민병준={}", productNo);
		List<Map<String, String>> graphData = productPlanService.eachAmountByProduct(productNo);
		mav.addObject("graphData", graphData);
		logger.info("graphData@@={}",graphData);
		mav.setViewName("jsonView");
		
		
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
	//작업지시서 등록 전체 폼
	@RequestMapping("/productplan/insertJobOrder.do")
	public ModelAndView insertJobOrderForm(ModelAndView mav) {
		
		mav.setViewName("productplan/insertJobOrder");
		
		return mav;
	}
	//작업지시서 등록 입력폼 - 세부사항 검색
	@RequestMapping("/productplan/searchDetails.do")
	public ModelAndView searchDetails(@RequestParam String searchType,
									  ModelAndView mav) {
		
		mav.addObject("searchType", searchType);
		mav.setViewName("productplan/searchDetails");
		
		return mav;
	}
	
	//작업지시서 등록 입력폼 - 세부사항 검색 - modal바디
	@RequestMapping("/productplan/searchDetailsPage.do")
	@ResponseBody
	public ModelAndView searchDetailsPage(ModelAndView mav,
										  @RequestParam String searchType,
										  @RequestParam(defaultValue="1") int cPage,
										  HttpServletResponse response) {
		response.setContentType("text/html;charset=UTF-8");
		final int numPerPage = 5;
		int totalContents = 0;
		List<Map<String, String>> list  = new ArrayList<>();
		switch(searchType) {
		case "customer":
			list = productPlanService.selectCustomer(cPage,numPerPage);
			totalContents = productPlanService.selectTotalContentsByCtmr();
			break;
			
		case "productName":
			list = productPlanService.selectProductName(cPage,numPerPage);
			totalContents = productPlanService.selectTotalContentsByPn();
			break;
		}
		
		logger.info("searchType={}", searchType);
		String url = "searchDetailsPage.do?searchType="+searchType;
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, url);
		
		mav.addObject("detailsList", list);
		mav.addObject("cPage", cPage);
		mav.addObject("pageBar", pageBar);
		mav.setViewName("jsonView");
		
			
		
		return mav;
	}
	
	//작업지시서 신규등록
	@RequestMapping("/productplan/insertJobOrderEnd.do")
	public ModelAndView insertJobOrder(@RequestParam(value="enrollDate") String enrollDate,
									   @RequestParam String dueDate,
									   @RequestParam String customer,
									   @RequestParam String manager,
									   @RequestParam String productName,
									   @RequestParam String quantity,
									   @RequestParam String orderContent,
									   ModelAndView mav) {
		
		int joTotalContents = 0;
		joTotalContents = productPlanService.selectJoTotalContents();
		//작업지시번호 포맷변경
		String str = String.join("", enrollDate.split("-"));
		Map<String, String> joList = new HashMap<>();
		joList.put("joNo", str+"-"+(joTotalContents+1));
		joList.put("dueDate", dueDate);
		joList.put("customer", customer);
		joList.put("manager", manager);
		joList.put("productName", productName);
		joList.put("quantity", quantity);
		joList.put("orderContent", orderContent);
		
		logger.info("joList@controller={}", joList);
		
		int result = productPlanService.insertJobOrder(joList);
		mav.addObject("msg",result>0?"작업지시서 신규등록 성공!":"작업지시서 신규등록 실패!");
		mav.addObject("loc","/productplan/jobOrder.do");
		mav.setViewName("common/msg");
		
		return mav;
		
	}
	//작업지시서 수정 폼
	@RequestMapping("/productplan/updateJobOrder.do")
	public ModelAndView updateJobOrder(ModelAndView mav,
										   @RequestParam(value="joNo") String joNo) {
		
		Map<String, String> load = productPlanService.selectOneJo(joNo);
		String str = load.get("joNo");
		String year = str.substring(0,4);
		String month = str.substring(4,6);
		String date = str.substring(6,8);
		String str2 = String.format("%s-%s-%s",year,month,date);
		
		mav.addObject("enrollDate", str2);
		mav.addObject("load", load);
		mav.addObject("joNo",joNo);
		mav.setViewName("productplan/updateJobOrder");
		return mav;
	}
	//작업 지시서 수정완료
	@RequestMapping("/productplan/updateJobOrderEnd.do")
	public ModelAndView updateJobOrderEnd(ModelAndView mav,
										  @RequestParam (value="joNo") String joNo,
										  @RequestParam String dueDate,
										  @RequestParam String customer,
										  @RequestParam String manager,
										  @RequestParam String productName,
										  @RequestParam String quantity,
										  @RequestParam String orderContent
										  ) {
		Map<String, String> update = new HashMap<>();
		update.put("joNo", joNo);
		update.put("dueDate", dueDate);
		update.put("customer", customer);
		update.put("manager", manager);
		update.put("productName", productName);
		update.put("quantity", quantity);
		update.put("orderContent", orderContent);
		logger.info("update@@="+update);
		int result = productPlanService.updateJobOrderEnd(update);
		mav.addObject("msg", result>0?"작업지시서 수정 성공!":"작업지서서 수정 실패!");
		mav.addObject("loc", "/productplan/jobOrder.do");
		mav.setViewName("common/msg");
		return mav;
	}
	
	//작업지시서 삭제
	@RequestMapping("/productplan/deleteOneJo.do")
	public ModelAndView deleteOneJo(@RequestParam(value="joNo") String joNo,
									ModelAndView mav) {
		int result = productPlanService.deleteOneJo(joNo);
		logger.info("result={}", result);
		mav.addObject("msg", result>0?"삭제 성공!":"삭제 실패!");
		mav.addObject("loc","/productplan/jobOrder.do");
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	
}
