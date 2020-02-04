package com.dev.erp.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.member.model.exception.MemberException;
import com.dev.erp.member.model.service.MemberService;
import com.dev.erp.member.model.vo.Member;

@SessionAttributes(value= {"memberLoggedIn"})
@Controller
public class MemberController {

	private final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("/member/memberEnrollEnd.do")
	public ModelAndView memberEnrollEnd(ModelAndView mav, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("emp_name") String emp_name,
			@RequestParam("dept_code") String dept_code, @RequestParam("job_code") String job_code,@RequestParam("ssn1") String ssn1,
			@RequestParam("ssn2") String ssn2,@RequestParam("phone") int phone
			) {
		Member member = new Member(0,emp_name,(ssn1+"-"+ssn2),email,phone,dept_code,job_code,null,null,"N",password);
		String rawPassword=member.getPassword();
		String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encryptedPassword);
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
		logger.debug("deptList={}",deptList);
		
		mav.addObject("dept",deptList);
		mav.addObject("job",jobList);
		mav.setViewName("member/memberEnroll");
		
		return mav;
	}
	@GetMapping("/member/memberEmailDuplicatedCheck/{email}")
	@ResponseBody
	public int memberEmailDuplicatedCheck(@PathVariable("email") String email) {
		List<Member> emailList = memberService.memberSelectList();
		logger.debug("emailList={}",emailList);
		logger.debug("email={}",email);
		int result =0;
		
		for(int i=0; i<emailList.size(); i++) {
			if(email.equals(emailList.get(i).getEmail())){
				result =1;
			}else {
				result=0;
			}
		}
		logger.debug("result={}",result);
		return result;
	}
	@PostMapping("/member/memberLogin.do")
	public ModelAndView memberLogin(@RequestParam String email, @RequestParam String password, ModelAndView mav, HttpSession session) {
		logger.debug("email={}",email);
		
		try {
			//1.업무로직
			Member m = memberService.selectOneMember(email);
			logger.debug("member={}",m);
			
			String msg="";
			String loc="/";
			
			//로그인분기처리
			if(m ==null) {
				msg="존재하지 않는 이메일입니다.";
				loc="/";
			}
			else {
				if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
					msg="로그인 성공!";
	//				session.setAttribute("memberLoggedIn", m);
					mav.addObject("memberLoggedIn", m);
					loc="/main/main.do";
					
				}else {
					msg="비밀번호가 틀렸습니다.";
					loc="/";
				}
			}
			
			//2.view모델처리
			mav.addObject("msg",msg);
			mav.addObject("loc",loc);
			
			//3.viewName지정
			mav.setViewName("common/msg");
			
//			if(true) throw new RuntimeException("내가 던진 로그인 오류!");
			
		}catch(Exception e) {
			logger.error("로그인 오류!", e);
			
			throw new MemberException("회원관리오류!",e);
		}
		
		return mav;
	}
	
	@RequestMapping("/member/memberLogOut.do")
	public String memberLogout(SessionStatus sessionStatus, Model model) {
		
		//setComplete 메소드 호출로 해당세션 폐기
		if(!sessionStatus.isComplete()) {
			sessionStatus.setComplete();
		}
		String msg="로그아웃되었습니다!";
		String loc="/";
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		
		return "common/msg";//  /spring 으로 리다이렉트
	}
}
