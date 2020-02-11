package com.dev.erp.facility.controller;

import java.util.ArrayList;
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

import com.dev.erp.facility.model.service.FacilityService;
import com.dev.erp.facility.model.vo.Facility;
import com.dev.erp.facility.model.vo.FacilityBook;




@Controller
public class FacilityController {
	@Autowired
	FacilityService facilityService;

	static final Logger logger 
	= LoggerFactory.getLogger(FacilityController.class);
	@RequestMapping("/facility/facilityList.do")
	public ModelAndView facilityList(ModelAndView mav) {
//		List<Map<String,String>> list = new ArrayList<>();
		List<Facility> list=new ArrayList<>();
		list=facilityService.selectAll();
		mav.addObject("list",list);
		mav.setViewName("gw/facility");
		return mav;
	}
	@RequestMapping("/facility/facilityBook.do")
	public ModelAndView facilityBook(ModelAndView mav,@RequestParam String facilityNo) {
		System.out.println("aaaaaaaaaaaaaa"+facilityNo);
		Facility facility=facilityService.selectOne(facilityNo);
		System.out.println("bbbb"+facility);
		mav.addObject("facility",facility);
		mav.setViewName("gw/facilityBook");
		return mav;
	}
	
	@RequestMapping("/facility/facilityBookInsert.do")
	public ModelAndView facilityBookInsert(ModelAndView mav,FacilityBook facilityBook) {
		System.out.println("dfdsafsd"+facilityBook);
		int result=facilityService.insertBook(facilityBook);
		mav.addObject("msg", result>0?"예약 성공!":"예약 실패!");
		mav.addObject("loc", "/facility/facilityList.do");
		mav.setViewName("common/msg");
	
	return mav;

	}
	@RequestMapping("/facility/facilityTime.do")
	@ResponseBody
	public List<FacilityBook> facilityTime(ModelAndView mav,FacilityBook facilityBook){
		System.out.println("sadfaa"+facilityBook);
//		List<Map<String,String>> list = new ArrayList<>();
		List<FacilityBook>list=facilityService.facilityTime(facilityBook);
		System.out.println(list);
		return list;
	}
	@RequestMapping("/facility/facilityBookList.do")
	public ModelAndView facilityBookList(ModelAndView mav,@RequestParam int facilityNo) {
		mav.addObject("facilityNo",facilityNo);
		mav.setViewName("gw/facilityBookList");
		return mav;
	}
	@RequestMapping("/facility/facilityBookListGet.do")
	@ResponseBody
	public List<FacilityBook> facilityBookListGet(ModelAndView mav,@RequestParam String bookDay,@RequestParam int facilityNo){
		FacilityBook facilityBook=new FacilityBook(0,facilityNo," ",bookDay," "," ");
		List<FacilityBook> list=facilityService.facilityBookListGet(facilityBook);
		mav.addObject("facilityNo",facilityNo);
		mav.setViewName("gw/facilityBookList");
		return list;
	}
	
}


//@RequestMapping("/attend/attendShow.do")
//@ResponseBody
//public Map<String,String> attendShow(ModelAndView mav,@RequestParam String email) {
//	List<Attend> list= attendService.attendShow(email);
//	String content="";
//	for(Attend a:list) {
//		if(a.getAttendStart()!=null)
//			content+=",{title:'출근',start:'"+a.getAttendStartForm()+"'},{title:'"+a.getAttendStart()+"',start:'"+a.getAttendStartForm()+"'}";
//
//	}   	
//	System.out.println(content);
//	Map<String,String> map =new HashMap<>();
//	map.put("content",content);
//
//	return map;
//
//}