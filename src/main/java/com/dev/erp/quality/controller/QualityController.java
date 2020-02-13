package com.dev.erp.quality.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.common.util.Utils;
import com.dev.erp.quality.model.service.QualityService;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;

@Controller
public class QualityController {

	static final Logger logger = LoggerFactory.getLogger(QualityController.class);
	
	@Autowired
	private QualityService qualityService;

	
	@RequestMapping("/quality/qualityControll.do")
	public ModelAndView qualityControll(ModelAndView mav) {
	
		
		List<Map<String,String>> list = new ArrayList<>();
		
		list = qualityService.selectQualityAll();
//		logger.debug("selectQualityAll list={}",list);
		mav.addObject("list",list);
		
		mav.setViewName("quality/qualityControll");
	
		
		return mav;
	}
	
	@RequestMapping("/quality/qualitySearch.do")
	public ModelAndView qualitySearch(ModelAndView mav) {
		
		mav.setViewName("quality/qualitySearch");
		
		return mav;
	}
	
	@RequestMapping("/quality/updateQualityForm.do")
	public ModelAndView qualityUpdate(ModelAndView mav, @RequestParam("quality_no") String quality_no) {
		
		Map<String,String> qualityContent = qualityService.selectOnebyQualityNo(quality_no);
		
		mav.addObject("qualityContent", qualityContent);
		mav.setViewName("quality/updateQualityForm");
		
	 	
		return mav;
	}
	
	@RequestMapping(value="/quality/updateQualtyFormEnd.do", method=RequestMethod.POST )
	public ModelAndView qualityUpdateEnd(ModelAndView mav, @RequestParam("storeNo") String storeName,
			@RequestParam("lotNo") String lotNo, @RequestParam("type") String type,
			@RequestParam("qualityComment") String qualityComment, @RequestParam("qualityNo") String qualityNo,
			@RequestParam("measurement") String measurement) {
		
//		logger.debug("qualityUpdate quality={}",quality);
		String storeNo = qualityService.selectStoreNoByStoreName(storeName);
		Map<String,String> param = new HashMap<>();
		param.put("storeNo",storeNo);
		param.put("lotNo",lotNo);
		param.put("type",type);
		param.put("qualityComment",qualityComment);
		param.put("measurement",measurement);
		param.put("qualityNo",qualityNo);
		int result= qualityService.qualityUpdateOne(param);
		
		mav.addObject("msg",result>0?"등록성공":"등록실패");
		mav.addObject("loc","/quality/qualityControll.do");
		mav.setViewName("common/msg");
		return mav;
	}
	
	@RequestMapping("/quality/searchSpecify.do")
	public ModelAndView searchSpecify(ModelAndView mav, @RequestParam("searchType") String searchType) {
		
		
		mav.addObject("searchType",searchType);
		mav.setViewName("quality/searchSpecify");
		
		return mav;
	}
	
	@RequestMapping("/quality/searchSpecifyPage.do")
	@ResponseBody
	public Map<String,Object> searchSpecify(@RequestParam("searchType") String searchType, @RequestParam(defaultValue="1") int cPage, HttpServletResponse response) {
		
		List<Map<String,String>> list = new ArrayList<>();
		final int numPerPage = 5;
		int totalContents = 0;
		switch(searchType) {
		case "storeNo" : 
			list = qualityService.selectStoreAll(cPage,numPerPage);  
			totalContents = qualityService.selectAllCountByStoreNo(); 
			break;
		case "lotNo" :  
			list =  qualityService.selectQualityColumn("lot_no", cPage,numPerPage); 
			totalContents = qualityService.selectAllCountForQuality();
			break;
		case "qualityNo" : 
			list = qualityService.selectQualityColumn("quality_no", cPage,numPerPage);  
			totalContents = qualityService.selectAllCountForQuality();
			break;
		case "type" :  
			list = qualityService.selectProductTypeAll(); 
			
			break;
		}
		String url = "searchSpecifyPage.do?searchType="+searchType;
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, url);
		
		logger.debug("searchSpecify@list={}",list);
		logger.debug("!!!!!!!!!!!!!cPage={}",cPage);
		Map<String,Object> map = new HashMap<>();
		map.put("numPerPage",numPerPage);
		map.put("cPage",cPage);
		map.put("totalContents",totalContents);
		map.put("searchType",searchType);
		map.put("speclist",list);
		map.put("pageBar", pageBar);
		return map;
	}
	
	@RequestMapping("/quality/searchSpecifyEnd.do")
	public ModelAndView searchSpecifyEnd(ModelAndView mav, @RequestParam("startDate") String startDate,
											@RequestParam("endDate") String endDate, 
											@RequestParam(value="qualityNo", required=false) String qualityNo,
											@RequestParam(value="lotNo", required=false) String lotNo,
											@RequestParam(value="type", required=false) String type,
											@RequestParam(value="storeNo", required=false) String storeName) {
		
		
		Map<String,String> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("qualityNo", qualityNo);
		map.put("lotNo", lotNo);
		map.put("type", type);
		map.put("storeName", storeName);
		
		List<Map<String,String>> list = new ArrayList<>();
		list = qualityService.searchBySpecify(map);
		
		mav.addObject("list",list);
		
		mav.setViewName("quality/qualityControll");
		
		return mav;
	}
	
	@RequestMapping("/quality/qualityInsection.do")
	public ModelAndView qualityInsectionView(ModelAndView mav, @RequestParam(value="type", required=false) String type) {
		
		List<Map<String,String>> list = new ArrayList<>();
		List<Map<String,String>> typeList = new ArrayList<>();
		
		typeList = qualityService.selectProductTypeAll();
		list  = qualityService.insectionWatingList(type);
		
		mav.addObject("type",type);
		mav.addObject("list",list);
		mav.addObject("typeList",typeList);
		mav.setViewName("quality/qualityInsection");
		return mav;
	}
	
	@RequestMapping("/quality/insectionQualityForm.do")
	public ModelAndView qualityInsection(ModelAndView mav, @RequestParam("lotNo") String lotNo) {
		logger.debug("lotNo={}",lotNo);
		Map<String,String> insectionContent = qualityService.selectInsectionOnebyLotNo(lotNo);
		
		mav.addObject("insectionContent", insectionContent);
		mav.setViewName("quality/insectionQualityForm");
		
	 	
		return mav;
	}
	
	@RequestMapping("/quality/insectionQualityFormEnd.do")
	public ModelAndView qualityInsectionFormEnd(ModelAndView mav, 
												@RequestParam("lotNo") String lotNo,
												@RequestParam("qualityYN") String qualityYN,
												@RequestParam("type") String type,
												@RequestParam("measurement") String measurement,
												@RequestParam(value="qualityComment", required=false) String qualityComment,
												@RequestParam("storeNo") String storeName,
												@RequestParam("plRmNo") String plRmNo) {
		
		
		String storeNo = qualityService.selectStoreNoByStoreName(storeName);
		String plNo = "";
		String rmNo = "";
		if(type.equals("원재료")) {
			rmNo = plRmNo;
		}
		else {
			plNo = plRmNo;
		}

		Map<String, String> param = new HashMap<>();
		param.put("lotNo", lotNo);
		param.put("type", type);
		param.put("rmNo", rmNo);
		param.put("plNo", plNo);
		param.put("measurement", measurement);
		param.put("qualityYN", qualityYN);
		param.put("storeNo", storeNo);
		param.put("qualityComment",qualityComment);
		int result = 0;
		switch(type) {
		case "원재료" : result = qualityService.updateInsectionYNInRecieving(param); break;
		case "완제품" : result = qualityService.updateInsectionYNInProduction(param); break;
		}
		
		if("N".equals(qualityYN)) {
			result = qualityService.insertQualityInfo(param);
		}
		
		mav.addObject("msg",result>0?"등록완료!":"등록실패!");
		mav.addObject("loc","/quality/qualityInsection.do");
		
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	@RequestMapping("/quality/doughnutHistoGraph.do")
	public ModelAndView donutHistoGraph(ModelAndView mav, 
										@RequestParam(value="startDate", required=false) String startDate,
										@RequestParam(value="endDate", required=false) String endDate) {
		
		
		Map<String,String> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		
		List<Map<String,String>> rTotalYCount = qualityService.selectRPercentByQualityY(param);
		double yCount = 0;
		String y = "";
		for(int i=0;i<rTotalYCount.size();i++) {
//			yCount+=Double.parseDouble((((Map<String,String>)pTotalYCount.get(i)).get("y")));
			Map<String,String> rmap = new HashMap<>();
			rmap = rTotalYCount.get(i);
			yCount += Double.parseDouble(String.valueOf(rmap.get("y")));
		}
		y = String.valueOf(yCount);
		List<Map<String,String>> rTotalNCount = qualityService.selectRPercentByQualityN(param);
		Map<String,String> map = new HashMap<>();
		map.put("label", "합격");
		map.put("y", y);
		rTotalNCount.add(map);
		
		//Product
		map = new HashMap<>();
		List<Map<String,String>> pTotalYCount = qualityService.selectPPercentByQualityY(param);
		yCount = 0;
		y = "";
		for(int i=0;i<pTotalYCount.size();i++) {
//			yCount+=Double.parseDouble((((Map<String,String>)pTotalYCount.get(i)).get("y")));
			Map<String,String> pmap = new HashMap<>();
			pmap = pTotalYCount.get(i);
			yCount += Double.parseDouble(String.valueOf(pmap.get("y")));
		}
		y = String.valueOf(yCount);
		List<Map<String,String>> pTotalNCount = qualityService.selectPPercentByQualityN(param);
		map.put("label", "합격");
		map.put("y", y);
		pTotalNCount.add(map);
		
		
		String rmList = "";
		String pdList = "";
		rmList = new Gson().toJson(rTotalNCount);
		pdList = new Gson().toJson(pTotalNCount);
		mav.addObject("rmList", rmList);
		mav.addObject("pdList",pdList);
		//도넛차트 종료
		
		//컬럼차트 시작
		List<Map<String,String>> columnAll = qualityService.selectCountAllByInsectionY(param);
		List<Map<String,String>> columnOther = qualityService.selectCountQNByInsectionY(param);
		String column1 = "";
		String column2 = "";
		column1 = new Gson().toJson(columnAll);
		column2 = new Gson().toJson(columnOther);
		mav.addObject("column1",column1);
		mav.addObject("column2",column2);
		
		
		
		mav.setViewName("quality/doughnutHistoGraph");
		
		return mav;
	}
	
	@RequestMapping("/quality/xbarGraphByProduct.do")
	public ModelAndView xbarGraphByProduct(ModelAndView mav) {
		
		Calendar date = new GregorianCalendar().getInstance();
		Calendar beforeMonth  = new GregorianCalendar().getInstance();
		beforeMonth.add(Calendar.MONTH, -1);
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String today = fmt.format(date.getTime());
		String monthAgo = fmt.format(beforeMonth.getTime());
		mav.addObject("today",today);
		mav.addObject("monthAgo",monthAgo);
		
		
		List<Map<String,String>> ptType = qualityService.selectProductTypeAll();
		mav.addObject("ptType",ptType);
		mav.setViewName("quality/xbarGraphByProduct");
		return mav;
	}
	
	@RequestMapping("/quality/searchProuctNamePtNo.do")
	@ResponseBody
	public void searchProuctNamePtNo(@RequestParam("ptNo") String ptNo, HttpServletResponse response) throws JsonIOException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		
		List<Map<String,String>> pList = new ArrayList<>();
		
		pList = qualityService.searchProuctNamePtNo(ptNo);
		
		
		new Gson().toJson(pList,response.getWriter());
	}
	
	@RequestMapping("/quality/searchXBarFrmEnd.do")
	@ResponseBody
	public void searchXBarFrmEnd(@RequestParam(value="startDate", required=false) String startDate,
									@RequestParam(value="endDate", required=false) String endDate,
									@RequestParam("ptType") String ptType,
									@RequestParam("ptNo") String ptNo,
									HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Map<String,String> param = new HashMap<>();
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		param.put("ptNo", ptNo);
		Map<String,String> spec = new HashMap<>();
		List<Map<String,String>> data = new ArrayList<>();
		if(ptType.equals("1")) {
			data = qualityService.selectMeasurmentFromRM(param);
			spec = qualityService.selectSpecByRmNo(ptNo);
		}
		else {
			data = qualityService.selectMeasurmentFromPD(param);
			spec = qualityService.selectSpecByPtNo(ptNo);
		}
		
		double spec_ = Double.parseDouble(String.valueOf(spec.get("SPEC")));
		double tol_ = Double.parseDouble(String.valueOf(spec.get("TOL")));
		
		double ucl_ = spec_ + (spec_*tol_);
		double lcl_ = spec_ - (spec_*tol_);
		
		List<Map<String,String>> ucl = new ArrayList<>();
		List<Map<String,String>> lcl = new ArrayList<>();
		for(int i=0;i<data.size();i++) {
			Map<String,String> temp = new HashMap<>();
			String date = ((Map<String,String>)data.get(i)).get("x");
			temp.put("x", date);
			temp.put("y", String.valueOf(ucl_));
			ucl.add(temp);
			temp = new HashMap<>();
			temp.put("x", date);
			temp.put("y", String.valueOf(lcl_));
			lcl.add(temp);
		}
		
		
		Map <String,Object> xbarMap = new HashMap<>();
		xbarMap.put("UCL", ucl);
		xbarMap.put("LCL", lcl);
		xbarMap.put("DATA", data);
		
//		data = qualityService
		
		new Gson().toJson(xbarMap,response.getWriter());
		
	}
	
}
