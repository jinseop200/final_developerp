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
		
		List<Map<String, String>> releaseList  = productionService.selectReleaseList();
		
		logger.info("releaseList@Controller={}",releaseList);
		
		mav.addObject("releaseList",releaseList);
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
	
	
	@RequestMapping(value="/production/addBOM.do", method=RequestMethod.POST)
	@ResponseBody
	public Object addBOM(@RequestParam(value="pNos[]", required=false) List<String> pNoList,
						 @RequestParam(value="pCodes[]", required=false) List<String> pCodeList,
						 @RequestParam(value="pNames[]", required=false) List<String> pNameList,
					 	 @RequestParam(value="pCounts[]", required=false) List<String> pCountList,
					 	@RequestParam(value="productCode", required=false) String productCode,
										 ModelAndView mav) {
		
		System.out.println("zzz"+pCodeList.size());
		
		if(!(pCodeList.size()==0 || pCountList.size()==0)) {
			Map<String, String> map = new HashMap<>();
			map.put("productCode", productCode);
			logger.info("map@controller={}",map);
			int result = productionService.insertBOM(productCode); 
			
			int bomNo = productionService.selectBOMNobyProductCode(productCode);
			
			logger.info("bomNo@Conteroller={}",bomNo);
			
			
			logger.info("productCode@Controller={}",productCode);
			logger.info("pCodeList@Controller={}",pCodeList);
			logger.info("pNameList@Controller={}",pNameList);
			logger.info("pCountList@Controller={}",pCountList);
			
			List<Map<String, Object>> BOMList = new ArrayList<Map<String, Object>>();
	
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("productCode", productCode);
			paramMap.put("bomNo", bomNo);
			
			for(int i=0; i<pCodeList.size();i++) {
				Map<String,Object> temp = new HashMap<>();
				temp.put("pCodeList", pCodeList.get(i));
				temp.put("pCountList", pCountList.get(i));
				
				BOMList.add(temp);
			}
			paramMap.put("BOMList", BOMList);
			logger.info("1232134BOM={}",paramMap);
			int result2 = productionService.insertBOMlist(paramMap);
		}

		List<String> list = new ArrayList<>();
		list.add("성공");
		return list;
	}
	
	@RequestMapping("/production/deleteBOMByBOMNo.do")
	public ModelAndView deleteBOMByBOMNo(@RequestParam("plNo") String plNo,
										 ModelAndView mav) {
		logger.info("plNo@Controller={}",plNo);
		
		int bomNo = productionService.selectBOMNobyProductCode(plNo);
		int result = productionService.deleteBOMByBOMNo(bomNo); 
		
		logger.info("result@controller={}",result);
		
		mav.addObject("result",result);
		mav.setViewName("redirect:/production/BOMListManagement.do");
		return mav;
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
		logger.info("pCodeList@Controller={}",pCodeList);
		logger.info("pNameList@Controller={}",pNameList);
		logger.info("pCountList@Controller={}",pCountList);
		logger.info("beforeArrList@Controller={}",beforeArrList);
		logger.info("removeCodeList@Controller={}",removeCodeList);
		
		if(beforeArrList == null) {
			beforeArrList = new ArrayList<>();
		}
		
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
		
		
		//merge into
		if(pCodeList != null) {
		
			List<Map<String, Object>> BOMList = new ArrayList<Map<String, Object>>();
	
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("productCode", productCode);
			paramMap.put("bomNo", bomNo);
			logger.info("beforeArrList.size()@Controller={}",beforeArrList.size());
			if((beforeArrList.size() < pCodeList.size())) {
				int repeat = pCodeList.size() - beforeArrList.size();
				logger.info("repeat@controller={}",repeat);
				for(int i=0;i<repeat;i++) {
					beforeArrList.add("0");
				}
			}
			
			for(int i=0; i<pCodeList.size();i++) {
				Map<String,Object> temp = new HashMap<>();
				temp.put("pCodeList", pCodeList.get(i));
				temp.put("pCountList", pCountList.get(i));
				temp.put("beforeArrList", beforeArrList.get(i));
				
				BOMList.add(temp);
			}
			
			paramMap.put("BOMList", BOMList);
			logger.info("paramMap@Controller={}",paramMap);
			int result2 = productionService.updateBOMRm(paramMap);
		}
		
		//not cotains = delete
		if(pCodeList != null) {
			for(String before : beforeArrList) {
			    if(pCodeList.contains(before)) {
			        System.out.println("pCodeList 에는 "+ before + " 가 있다.");
			    }else {
			        System.out.println("pCodeList 에는 "+ before + " 가 없다. 따라서 지울것이다.");
			        List<String> removeThis = new ArrayList<>();
			        removeThis.add(before);
			        
			        List<Map<String, Object>> deleteList = new ArrayList<Map<String, Object>>();
					Map<String, Object> deleteMap = new HashMap<String, Object>();
					deleteMap.put("bomNo", bomNo);
					for(int i=0; i<removeThis.size();i++) {
						Map<String,Object> temp = new HashMap<>();
						temp.put("removeCode", removeThis.get(i));
						deleteList.add(temp);
					}
					deleteMap.put("deleteList", deleteList);
					int delete = productionService.deleteBOMRm(deleteMap);
			    }
			}
		}
		
		List<String> list = new ArrayList<>();
		list.add("성공");
		
		return list;
	}
	
	
	//==============================warehosing start======================================
//	@RequestMapping("/production/addWarehousing.do")
//	public ModelAndView addWarehousing(@RequestParam("rawMaterialDetail") String rawMaterialDetail,
//									 @RequestParam("ptNo") String ptNo,
//									 @RequestParam("vendorTypeCode") String vendorTypeCode,
//									 @RequestParam("storeNo") String storeNo,
//									 @RequestParam("quantity") String quantity,
//									 @RequestParam("quailityYN") String quailityYN,
//									 @RequestParam("insectionYN") String insectionYN,
//									 @RequestParam("measurement") String measurement,
//									 @RequestParam("regDate") String regDate,
//									 @RequestParam("rmName") String rmName,
//										 ModelAndView mav) {
//		
//		Map<String, String> warehousing = new HashMap<>();
//		warehousing.put("rawMaterialDetail", rawMaterialDetail);
//		warehousing.put("ptNo", ptNo);
//		warehousing.put("vendorTypeCode", vendorTypeCode);
//		warehousing.put("storeNo", storeNo);
//		warehousing.put("quantity", quantity);
//		warehousing.put("quailityYN", quailityYN);
//		warehousing.put("insectionYN", insectionYN);
//		warehousing.put("measurement", measurement);
//		warehousing.put("regDate", regDate);
//		warehousing.put("rmName", rmName);
//		
//		logger.info("warehousing@controller={}",warehousing);
//		
//		int result = productionService.addWarehousing(warehousing); 
//		
//		mav.addObject("warehousing", warehousing);
//		mav.setViewName("redirect:/production/warehousing.do");
//		
//		return mav;
//	}
//	
//	@RequestMapping("/production/selectWarehousingByLotNo.do")
//	@ResponseBody
//	public Map<String, Object> selectWarehousingByLotNo(@RequestParam("tdLotNo") String tdLotNo) {
//		
//		logger.info("tdLotNo@Controller={}",tdLotNo);
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("tdLotNo", tdLotNo);
//		map = productionService.selectWarehousingByLotNo(tdLotNo);
//		
//		//날짜형식 수정
//		String nDate = map.get("REC_DATE").toString().substring(0,10);
//		map.put("nDate", nDate);
//		
//		logger.info("map@Controller={}",map);
//		
//		return map;
//	}
//	
//	@RequestMapping("/production/updateWarehousing.do")
//	public ModelAndView updateWarehousing(@RequestParam("rawMaterialDetail") String rawMaterialDetail,
//									 @RequestParam("ptNo") String ptNo,
//									 @RequestParam("vendorTypeCode") String vendorTypeCode,
//									 @RequestParam("storeNo") String storeNo,
//									 @RequestParam("quantity") String quantity,
//									 @RequestParam("quailityYN") String quailityYN,
//									 @RequestParam("insectionYN") String insectionYN,
//									 @RequestParam("measurement") String measurement,
//									 @RequestParam("lotNo") String lotNo,
//									 @RequestParam("regDate") String regDate,
//										 ModelAndView mav) {
//		
//		Map<String, String> warehousing = new HashMap<>();
//		warehousing.put("rawMaterialDetail", rawMaterialDetail);
//		warehousing.put("ptNo", ptNo);
//		warehousing.put("vendorTypeCode", vendorTypeCode);
//		warehousing.put("storeNo", storeNo);
//		warehousing.put("quantity", quantity);
//		warehousing.put("quailityYN", quailityYN);
//		warehousing.put("insectionYN", insectionYN);
//		warehousing.put("measurement", measurement);
//		warehousing.put("lotNo", lotNo);
//		warehousing.put("regDate", regDate);
//		
//		logger.info("warehousing@controller={}",warehousing);
//		
//		int result = productionService.updateWarehousing(warehousing); 
//		
//		mav.addObject("warehousing", warehousing);
//		mav.setViewName("redirect:/production/warehousing.do");
//		
//		return mav;
//	}
//	
//	@RequestMapping("/production/deleteWarehousingByRmNo.do")
//	public ModelAndView deleteWarehousingByRmNo(@RequestParam("rmNo") String rmNo,
//										 ModelAndView mav) {
//		logger.info("rmNo@Controller={}",rmNo);
//		
//		Integer.parseInt(rmNo);
//		
//		int lotNo = productionService.selectRotNobyRmNo(rmNo);
//		logger.info("lotNo@Controller={}",lotNo);
//		int result = productionService.deleteWarehousingByRmNo(lotNo); 
//		
//		logger.info("result@controller={}",result);
//		
//		mav.addObject("result",result);
//		mav.setViewName("redirect:/production/BOMListManagement.do");
//		return mav;
//	}
	//end
	
	//==============================releasing start======================================
	@RequestMapping("/production/checkBOMExist")
	@ResponseBody
	public List<Map<String, String>> checkBOMExist(@RequestParam("chkBOM") String chkBOM,
											 @RequestParam("rQuantity") String rQuantity) {
		
		logger.info("chkBOM@Controller={}",chkBOM);
		
		Map<String, Object> map = new HashMap<>();
		map.put("chkBOM", chkBOM);
		map.put("rQuantity", rQuantity);
		
		List<Map<String, String>> lMap = productionService.checkBOMExist(chkBOM);
		logger.info("lMap@Controller={}",lMap);
		
		
		//값존재시 true 사용가능, 값없을시 false 사용불가
		boolean isUsable = lMap.size()==0?false:true;
		map.put("isUsable", isUsable);
		logger.info("isUsable@Controller={}",isUsable);
		
		//필요수량이 모자란것들(QUANCHK < 0) 담을 nList 생성
		List<Map<String, String>> nList = new ArrayList<>();
		System.out.println("초기 nList 사이즈="+nList.size());
		if(isUsable == true) {
			List<Map<String, String>> list = productionService.quantityCheck(map);
			logger.info("list@controller={}",list);
			
			for(int i = 0; i < list.size(); i++) {
				Map<String, String> tempMap = new HashMap<>();
				//System.out.println(Integer.parseInt(String.valueOf(list.get(i).get("QUANCHK"))));
				if((Integer.parseInt(String.valueOf(list.get(i).get("QUANCHK"))))<0) {
					tempMap.put("RM_NO", String.valueOf(list.get(i).get("RM_NO")));
					tempMap.put("QUANCHK", String.valueOf(list.get(i).get("QUANCHK")));
					tempMap.put("RM_NAME", String.valueOf(list.get(i).get("RM_NAME")));
					nList.add(tempMap);
				}
			}
			System.out.println("ifIsusable true실행후 nList 사이즈="+nList.size());
			
			if(nList.size() == 0) {
				for(int i = 0; i < list.size(); i++) {
					logger.info("마지막 release에 추가하기");
					System.out.println(list.get(i));
					Map<String, String> addMap = list.get(i);
					int result = productionService.addRelease(addMap);
					
				}
			}
			
		}
		logger.info("nList@Controller={}",nList);
		
		return nList;
	}
	
	
	
}
