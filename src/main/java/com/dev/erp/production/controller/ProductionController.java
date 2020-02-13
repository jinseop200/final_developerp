package com.dev.erp.production.controller;

import java.util.ArrayList;
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
		
		List<Map<String, String>> productList = productionService.selectproductList();
		
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

	//add
	@RequestMapping("/production/updateBOMForm.do")
	public ModelAndView updateBOMForm(@RequestParam("tdPtNo") String tdPtNo, ModelAndView mav) {
		
		logger.info("tdPtNo@Controller={}",tdPtNo);
		int bomNo = productionService.selectBOMNobyProductCode(tdPtNo);
		logger.info("bomNo@Controller={}",bomNo);
		
		List<Map<String, String>> BOMrmList = productionService.selectBOMRmListByBOMNo(bomNo);
		
		logger.info("BOMrmList@Controller={}", BOMrmList);
		
		mav.addObject("BOMrmList", BOMrmList);
		mav.setViewName("production/updateBOMForm");
		return mav;
	}
	
	@RequestMapping("/production/selectRawMaterialList.do")
	public ModelAndView selectRawMaterialList(ModelAndView mav) {
		
		List<Map<String, String>> rawmaterialList = productionService.selectRawMaterialList();
		
		mav.addObject("rawmaterialList",rawmaterialList);
		return mav;
	}
	
	
//	@RequestMapping("/enrollment/addVendor.do")
//	public ModelAndView insertVendor(@RequestParam String vendorNo,
//										 @RequestParam String vendorName,
//										 @RequestParam String incharge,
//										 @RequestParam String vendorPhone,
//										 ModelAndView mav) {
//		logger.info("vendorName@Controller={}",vendorName);
//		
//		Map<String, String> vendor = new HashMap<>();
//		vendor.put("vendorNo", vendorNo);
//		vendor.put("vendorName", vendorName);
//		vendor.put("incharge", incharge);
//		vendor.put("vendorPhone", vendorPhone);
//		vendor.put("regDate", null);
//		
//		logger.info("vendor@controller={}",vendor);
//		
//		int result = enrollmentservice.insertVendor(vendor); 
//		
//		mav.addObject("vendor", vendor);
//		mav.setViewName("redirect:/enrollment/vendorEnrollment.do");
//		
//		return mav;
//	}
	
	@RequestMapping(value="/production/addBOM.do", method=RequestMethod.POST)
	@ResponseBody
	public Object addBOM(@RequestParam(value="pNos[]", required=false) List<String> pNoList,
						 @RequestParam(value="pCodes[]", required=false) List<String> pCodeList,
						 @RequestParam(value="pNames[]", required=false) List<String> pNameList,
					 	 @RequestParam(value="pCounts[]", required=false) List<String> pCountList,
					 	@RequestParam(value="productCode", required=false) String productCode,
										 ModelAndView mav) {
		
		
		Map<String, String> map = new HashMap<>();
		map.put("productCode", productCode);
		logger.info("map@controller={}",map);
		int result = productionService.insertBOM(productCode); 
		
		int bomNo = productionService.selectBOMNobyProductCode(productCode);
		
		logger.info("bomNo@Conteroller={}",bomNo);
		
		
		logger.info("productCode@Controller={}",productCode);
		logger.info("pNoList@Controller={}",pNoList);
		logger.info("pCodeList@Controller={}",pCodeList);
		logger.info("pNameList@Controller={}",pNameList);
		logger.info("pCountList@Controller={}",pCountList);
		logger.info("pNoListSize@Controller={}",pNoList.get(0));
		logger.info("pNoListSize@Controller={}",pNoList.get(1));
		int toTalSize = pNoList.size();
		
		List<Map<String, Object>> BOMList = new ArrayList<Map<String, Object>>();

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("productCode", productCode);
		paramMap.put("bomNo", bomNo);
		
		for(int i=0; i<pCodeList.size();i++) {
			Map<String,Object> temp = new HashMap<>();
			temp.put("pCodeList", pCodeList.get(i));
			temp.put("pNoList", pNoList.get(i));
			temp.put("pCountList", pCountList.get(i));
			
			BOMList.add(temp);
		}
		paramMap.put("BOMList", BOMList);
		logger.info("1232134BOM={}",paramMap);
		int result2 = productionService.insertBOMlist(paramMap);
		

		
		return paramMap;
	}
	
	@RequestMapping("/production/selectBOMForm.do")
	@ResponseBody
	public Map<String, Object> selectBOMForm(@RequestParam("tdPtNo") String tdPtNo) {
		
		logger.info("productNo@Controller={}",tdPtNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tdPtNo", tdPtNo);
		
		boolean isUsable = productionService.selectBOMForm(tdPtNo)==null?true:false;
		map.put("isUsable", isUsable);
		
		logger.info("isUsable@Controller={}",isUsable);

		return map;
	}
	
	
	@RequestMapping(value="/production/updateBOM.do", method=RequestMethod.POST)
	@ResponseBody
	public Object updateBOM(@RequestParam(value="pNos[]", required=false) List<String> pNoList,
						 @RequestParam(value="pCodes[]", required=false) List<String> pCodeList,
						 @RequestParam(value="pNames[]", required=false) List<String> pNameList,
					 	 @RequestParam(value="pCounts[]", required=false) List<String> pCountList,
					 	 @RequestParam(value="productCode", required=false) String productCode,
					 	 @RequestParam(value="beforeArr[]", required=false) List<String> beforeArrList,
					 	 @RequestParam(value="removeCode[]", required=false) List<String> removeCodeList,
										 ModelAndView mav) {
		logger.info("productCode@Controller={}",productCode);
		logger.info("pNoList@Controller={}",pNoList);
		logger.info("pCodeList@Controller={}",pCodeList);
		logger.info("pNameList@Controller={}",pNameList);
		logger.info("pCountList@Controller={}",pCountList);
		logger.info("beforeArrList@Controller={}",beforeArrList);
		logger.info("removeCodeList@Controller={}",removeCodeList);
		
		
		//제품코드로 BOM NO 가져오기
		Map<String, String> map = new HashMap<>();
		map.put("productCode", productCode);
		logger.info("map@controller={}",map);
		int bomNo = productionService.selectBOMNobyProductCode(productCode);
		logger.info("bomNo@Conteroller={}",bomNo);
		
		//delete
		if(removeCodeList != null) {
			logger.info("delete started");
			List<Map<String, Object>> deleteList = new ArrayList<Map<String, Object>>();
			Map<String, Object> deleteMap = new HashMap<String, Object>();
			deleteMap.put("bomNo", bomNo);
			for(int i=0; i<removeCodeList.size();i++) {
				Map<String,Object> temp = new HashMap<>();
				temp.put("removeCode", removeCodeList.get(i));
				deleteList.add(temp);
			}
			deleteMap.put("deleteList", deleteList);
			int delete = productionService.deleteBOMRm(deleteMap);
		}
		
		
		List<Map<String, Object>> BOMList = new ArrayList<Map<String, Object>>();

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("productCode", productCode);
		paramMap.put("bomNo", bomNo);
		
		if(beforeArrList.size() < pCodeList.size()) {
			int repeat = pCodeList.size() - beforeArrList.size();
			logger.info("repeat@controller={}",repeat);
			for(int i=0;i<repeat;i++) {
				beforeArrList.add("0");
			}
		}
		
		for(int i=0; i<pCodeList.size();i++) {
			Map<String,Object> temp = new HashMap<>();
			temp.put("pCodeList", pCodeList.get(i));
			temp.put("pNoList", pNoList.get(i));
			temp.put("pCountList", pCountList.get(i));
			temp.put("beforeArrList", beforeArrList.get(i));
			
			BOMList.add(temp);
		}
		
//		for(int i=0; i<beforeArrList.size();i++) {
//			temp.put("beforeArrList", beforeArrList.get(i));
//			
//			BOMList.add(temp);
//		}
		
		paramMap.put("BOMList", BOMList);
		logger.info("paramMap@Controller={}",paramMap);
		int result2 = productionService.updateBOMRm(paramMap);
		

		
		return paramMap;
	}
	
}
