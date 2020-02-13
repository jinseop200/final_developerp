package com.dev.erp.message.controller;

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
import com.dev.erp.message.model.service.MessageService;
import com.dev.erp.message.model.vo.Message;

@Controller
public class MessageController {

	private final static Logger logger = LoggerFactory.getLogger(MessageController.class);
	@Autowired
	MessageService messageService;
	
	@RequestMapping("/message/messageList.do")
	public ModelAndView messageList(ModelAndView mav,@RequestParam("empName") String empName) {
//		List<Map<String,Object>> msgList = new ArrayList<>();
//		msgList = messageService.selectMessageList(empName);
//		logger.debug("msgList={}",msgList);
//		mav.addObject("msgList",msgList);
		mav.setViewName("message/messageList");
		
		return mav;
	}
	@RequestMapping("/message/messageListPage.do")
	@ResponseBody
	public Map<String,Object> documentListPage(@RequestParam(defaultValue="1") int cPage,  @RequestParam("empName") String empName, HttpServletResponse rexsponse) {
		
		List<Message> list = new ArrayList<>();
		final int numPerPage = 7;
		int totalContents = 0;
		list = messageService.selectMessageAllList(cPage,numPerPage);  
		logger.debug("list={}",list);
		totalContents = messageService.selectAllCountByAccountNo(empName); 
		String url = "messageListPage.do?empName="+empName;
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, url);
		
		Map<String,Object> map = new HashMap<>();
		map.put("numPerPage",numPerPage);
		map.put("cPage",cPage);
		map.put("totalContents",totalContents);
		map.put("list",list);
		map.put("pageBar", pageBar);
		return map;
	}
	@RequestMapping("/message/insertMessageForm.do")
	public ModelAndView insertMessageForm(ModelAndView mav) {
		
		mav.setViewName("message/insertMessageForm");
		return mav;
	}
	@RequestMapping("/message/messageSelectList.do")
	public ModelAndView messageSelectList(ModelAndView mav) {
		
		mav.setViewName("message/messageSelectList");
		return mav;
	}
	@RequestMapping("/message/insertMessage.do")
	public ModelAndView insertMessage(ModelAndView mav, @RequestParam("empName") String empName, @RequestParam("insertSender") String insertSender,
									@RequestParam("meTitle") String meTitle, @RequestParam("messageContent") String messageContent){
		
		Message message = new Message(0, meTitle,empName,insertSender,messageContent,"n",null);
		int result = messageService.insertMessage(message);
		String msg="";
		String loc="/";
		if(result>0) {
			msg="전송되었습니다.";
			loc="/message/messageList.do?empName="+empName;
		}
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		return mav;
	}
}

