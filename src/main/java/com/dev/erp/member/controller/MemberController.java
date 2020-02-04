package com.dev.erp.member.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.member.model.service.MemberService;
import com.dev.erp.member.vo.Member;

@Controller
public class MemberController {

	private final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@PostMapping("/member/memberEnrollEnd.do")
	public ModelAndView memberEnrollEnd(ModelAndView mav, Member member) {
		
		int result =memberService.insertMember(member);
			
		String msg="";
		String loc="/";
		if(result>0) {
			msg="회원추가성공!";
		}
		mav.addObject("loc",loc);
		mav.addObject("msg",msg);
		
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	@RequestMapping("/member/memberEnroll.do")
	public ModelAndView memberEnroll(ModelAndView mav) {
		
		List<Map<String,String>> deptList = memberService.selectDeptList();
		List<Map<String,String>> jobList = memberService.selectJobList();
		
		mav.addObject("dept",deptList);
		
		mav.setViewName("member/memberEnroll");
		
		return mav;
		
	}
}
