package com.dev.erp.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.common.util.Utils;
import com.dev.erp.member.model.exception.MemberException;
import com.dev.erp.member.model.service.MemberService;
import com.dev.erp.member.model.vo.Member;

@SessionAttributes(value= {"memberLoggedIn","dept_title","job_name"})
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
			@RequestParam("ssn2") String ssn2,@RequestParam("phone") String phone
			) {
		Member member = new Member(0,emp_name,(ssn1+"-"+ssn2),email,phone,dept_code,job_code,null,null,"N",password,"profile.png");
		String rawPassword=member.getPassword();
		String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encryptedPassword);
		int result =memberService.insertMember(member);
			
		String msg="";
		String loc="/main/main.do?email="+email;
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
		mav.addObject("job",jobList);
		mav.setViewName("member/memberEnroll");
		
		return mav;
	}
	@RequestMapping("/member/memberEmailDuplicatedCheck.do")
	@ResponseBody
	public Map<String,Object> memberEmailDuplicatedCheck(@RequestParam("email") String email, HttpServletResponse response) {
		logger.debug("email={}",email);
		Map<String, Object> map = new HashMap<>();
		List<Member> emailList = memberService.memberSelectList();
		int result=0;
		for(int i=0; i<emailList.size(); i++) {
			if(email.equals(emailList.get(i).getEmail())) {
				result =1;//기존의 값과 일치하는경우
			}else {
				result=0; //아닌경우
			}
		}
		map.put("email", email);
		
		boolean isUsable = memberService.selectOneMember(email)==null?true:false;//기존의 값이 없는경우 true
		map.put("isUsable", isUsable);
		map.put("result", result);
		
		return map;
	}
	@PostMapping("/member/memberLogin.do")
	public ModelAndView memberLogin(@RequestParam String email, @RequestParam String password, ModelAndView mav, HttpSession session) {
		logger.debug("email={}",email);
		
		try {
			//1.업무로직
			Member m = memberService.selectOneMember(email);
			Map<String, String> deptOne = memberService.selectOneDept(email);
			Map<String, String> jobOne = memberService.selectOneJob(email);
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
					mav.addObject("dept_title",deptOne);
					mav.addObject("job_name", jobOne);
					
					loc="/main/main.do?email="+email;
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
	@RequestMapping("/member/memberAlterPassword.do")
	public ModelAndView memberAlterPassword(ModelAndView mav) {
		
		mav.setViewName("member/memberAlterPassword");
		return mav;
	}
	@RequestMapping("/member/memberUpdateInfo.do")
	public ModelAndView memberUpdateInfo(ModelAndView mav) {
		List<Map<String,String>> deptList = memberService.selectDeptList();
		List<Map<String,String>> jobList = memberService.selectJobList();
		
		mav.addObject("dept",deptList);
		mav.addObject("job",jobList);
		mav.setViewName("member/memberUpdateInfo");
		return mav;
	}
	
	@RequestMapping("/member/memberPasswordCheck.do")
	@ResponseBody
	public Map<String,Object> memberPasswordCheck(@RequestParam("password") String password, @RequestParam("email") String email, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<>();
		Member m = memberService.selectOneMember(email);
		boolean isUsable;
		if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
			isUsable=true;
		}else {
			isUsable=false;
		}
		map.put("isUsable",isUsable);
			
		
		return map;
	}
	
	@PostMapping("/member/updatePasswordEnd.do")
	@ResponseBody
	public ModelAndView updatePasswordEnd(ModelAndView mav, @RequestParam("password_Chk") String password_Chk, @RequestParam("email") String email) {
		String encryptedPassword = bcryptPasswordEncoder.encode(password_Chk);
		Map<String, Object> param = new HashMap<>();
		param.put("email", email);
		param.put("password", encryptedPassword);
		int result = memberService.updatePassword(param);
		String msg="";
		String loc="/main/main.do";
		if(result>0) {
			msg="비밀번호 변경성공!";
		}
		mav.addObject("loc",loc);
		mav.addObject("msg",msg);
		
		mav.setViewName("common/msg");
		
		
		return mav;
	}
	@RequestMapping("/member/memberFindMypage.do")
	public ModelAndView memberFindMypage(ModelAndView mav, @RequestParam("email") String email) {
		Map<String, String> deptOne = memberService.selectOneDept(email);
		Map<String, String> jobOne = memberService.selectOneJob(email);
		
		mav.addObject("dept_title",deptOne);
		mav.addObject("job_name",jobOne);
		
		
		mav.setViewName("main/main");
		
		return mav;
	}
	@PostMapping("/member/memberUpdateInfoEnd.do")
	public ModelAndView memberUpdateInfoEnd(ModelAndView mav,@RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("emp_name") String emp_name,
			@RequestParam("dept_code") String dept_code, @RequestParam("job_code") String job_code,@RequestParam("ssn1") String ssn1,
			@RequestParam("phone") String phone) {
		Member member = new Member(0,emp_name,ssn1,email,phone,dept_code,job_code,null,null,"N",password,"profile.png");
		String rawPassword=member.getPassword();
		String encryptedPassword = bcryptPasswordEncoder.encode(rawPassword);
		member.setPassword(encryptedPassword);
		
		int result =memberService.updateMember(member);
		Map<String, String> deptOne = memberService.selectOneDept(email);
		Map<String, String> jobOne = memberService.selectOneJob(email);
			
		String msg="";
		String loc="/main/main.do";
		if(result>0) {
			msg="회원정보수정성공!";
			mav.addObject("memberLoggedIn", member);
			mav.addObject("dept_title",deptOne);
			mav.addObject("job_name", jobOne);
		}
		
		mav.addObject("loc",loc);
		mav.addObject("msg",msg);
		
		mav.setViewName("common/msg");
		
		return mav;
	}
	@RequestMapping("/member/memberProfile.do")
	public ModelAndView memberProfile(ModelAndView mav, @RequestParam("email") String email, 
									@RequestParam(value="uploadFile",required=false) MultipartFile profileImage, 
									HttpServletRequest request) {
			String saveDirectory = request.getSession()
										  .getServletContext()
										  .getRealPath("/resources/upload/member");
			Member member = new Member();
			//동적으로 directory 생성하기
			File dir = new File(saveDirectory);
			if(dir.exists() == false)
				dir.mkdir();
			//MultipartFile객체 파일업로드 처리 시작//////////////
				if(!profileImage.isEmpty()) {
					//파일명 재생성
					String originalFileName = profileImage.getOriginalFilename();
					String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
					int rndNum = (int)(Math.random()*1000);
					String renamedFileName = sdf.format(new Date())+"_"+rndNum+ext;
					
					//서버컴퓨터에 파일저장
					try {
						profileImage.transferTo(new File(saveDirectory+"/"+renamedFileName));
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					member.setEmail(email);
					member.setProfileImage(renamedFileName);
				}
			//MultipartFile객체 파일업로드 처리 끝//////////////
			//2.업무로직
			int result = memberService.updateProfileImage(member);
			member = memberService.selectOneMember(email);
			if(result>0) {
				//3. view단 처리		
				mav.addObject("memberLoggedIn",member);
				mav.setViewName("main/main");
			}
			
		return mav;
	}
}
