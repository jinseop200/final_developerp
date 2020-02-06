package com.dev.erp.attend.controller;

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

import com.dev.erp.attend.model.service.AttendService;
import com.dev.erp.attend.model.vo.Attend;


@Controller
public class AttendController {
	@Autowired
	AttendService attendService;

	static final Logger logger 
	= LoggerFactory.getLogger(AttendController.class);
	
	@RequestMapping("/attend/attendList.do")
	public ModelAndView attendList(ModelAndView mav,@RequestParam String email) {
		System.out.println("fdsafdassdfas"+email);
		List<Attend> list= attendService.attendShow(email);
    	System.out.println("fdfddf"+list);
    	String content="";
    	for(Attend a:list) {
    		if(a.getAttendStart()!=null)
    			content+=",{title:'출근',start:'"+a.getAttendStartForm()+"'},{title:'"+a.getAttendStart()+"',start:'"+a.getAttendStartForm()+"'}";
    			
    	}
    	
		mav.addObject("content",content);
		mav.setViewName("gw/attendCal");
		return mav;
	}
	@RequestMapping("/attend/attendShow.do")
	@ResponseBody
	public Map<String,String> attendShow(ModelAndView mav,@RequestParam String email) {
		List<Attend> list= attendService.attendShow(email);
    	System.out.println("fdfddf"+list);
    	String content="";
    	for(Attend a:list) {
    		if(a.getAttendStart()!=null)
    			content+=",{title:'출근',start:'"+a.getAttendStartForm()+"'},{title:'"+a.getAttendStart()+"',start:'"+a.getAttendStartForm()+"'}";
    			
    	}
    	
    	
    	
    	
    	
    	System.out.println(content);
    	Map<String,String> map =new HashMap<>();
    	map.put("content",content);
    	
    	return map;
		
    	
    	
//    	   {
//		          title: 'Party',
//		          start: '2019-08-29T20:00:00'
//		        }
	}
	@RequestMapping("/attend/attendForm.do")
	public ModelAndView showAttendForm(ModelAndView mav, @RequestParam String date
										) {
		System.out.println("dddddd"+date);
//		final int numPerPage = 10;
//		
//		//1.업무로직
//		List<Board> list = boardService.selectBoardList(cPage, numPerPage);
//		logger.debug("list={}", list);
//		int totalContents = boardService.selectTotalContents();
//		
//		//2.view model처리
//		mav.addObject("list", list);
//		mav.addObject("numPerPage", numPerPage);
//		mav.addObject("cPage", cPage);
//		mav.addObject("totalContents", totalContents);
		mav.addObject("date",date);
		mav.setViewName("gw/attendForm");
		return mav;
	}
	@RequestMapping("/attend/attendant.do")
	public ModelAndView attendant(ModelAndView mav, @RequestParam String date,@RequestParam String email
			) {
System.out.println("dddddd"+date);
System.out.println("dddddd"+email);

int result=attendService.attendant(email);
String script = "self.close(); opener.location.reload(true)";
mav.addObject("script",script);
mav.addObject("msg", result>0?"출석 성공!":"출석 실패!");
mav.addObject("loc", "/attend/attendList.do?email=${memberLoggedIn.email]");
mav.setViewName("common/msg");
return mav;

}
	@RequestMapping("/attend/leave.do")
	public ModelAndView leave(ModelAndView mav, @RequestParam String date,@RequestParam String email
			) {


int result=attendService.leave(email);

mav.addObject("msg", result>0?"퇴근 성공!":"퇴근 실패!");
mav.addObject("loc", "/attend/attendForm.do");
mav.setViewName("common/msg");
return mav;

}
}
