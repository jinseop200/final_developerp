package com.dev.erp.document.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dev.erp.common.util.Utils;
import com.dev.erp.document.model.service.DocumentService;
import com.dev.erp.document.model.vo.Document;
import com.dev.erp.document.model.vo.DocumentLine;
import com.dev.erp.member.controller.MemberController;

@Controller
public class DocumentController {

	private final static Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	DocumentService documentService;
	
	@RequestMapping("/document/documentView.do")
	public ModelAndView documentView(ModelAndView mav, @RequestParam("empName") String empName) {
		
		List<Document> docList = new ArrayList<>();
		docList = documentService.selectDocList(empName);
		mav.addObject("docList",docList);
		mav.setViewName("document/documentView");
		return mav;
	}
	@RequestMapping("/document/insertDocumentForm.do")
	public ModelAndView insertDocumentForm(ModelAndView mav) {
		
		List<Map<String,String>> list = new ArrayList<>();
		list=documentService.selectDocTypeAll();
		mav.addObject("docTypeList",list);
		mav.setViewName("/document/insertDocumentForm");
		
		return mav;
	}
	
	@PostMapping("/document/enrollDocument.do")
	public ModelAndView enrollDocument(ModelAndView mav, @RequestParam("documentDate")Date documentDate,
										@RequestParam("documentTitle") String documentTitle, @RequestParam("docLastapproval") String docLastapproval,
										@RequestParam("documentMiddle") String documentMiddle, @RequestParam("documentType") String documentType,
										@RequestParam("documentContent") String documentContent, @RequestParam("empName") String empName) {
		int typeNo = 0;
		if(documentType.equals("기본")) {
			typeNo=0;
		}else if(documentType.equals("휴가신청서")) {
			typeNo=1;
		}else if(documentType.equals("지출결의서")) {
			typeNo=2;
		}
		Document document = new Document(0,typeNo,documentType,documentTitle,"진행중",empName,docLastapproval,documentContent,documentDate);
		DocumentLine documentLine = new DocumentLine(0,0,typeNo,documentMiddle,docLastapproval,"N");
		String msg="";
		String loc="/";
		int result = documentService.insertDocument(document);
		int result2 = documentService.insertDocumentLine(documentLine);
		if(result>0) {
			msg="전송되었습니다.";
			loc="/document/documentView.do?empName="+empName;
			
		}
		mav.addObject("document",document);
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		return mav;
	}
	@RequestMapping("/document/documentSelectList.do")
	public ModelAndView documentSelectList(ModelAndView mav) {
		
		mav.setViewName("document/documentSelectList");
		return mav;
	}
	@RequestMapping("/document/documentListPage.do")
	@ResponseBody
	public Map<String,Object> documentListPage(@RequestParam(defaultValue="1") int cPage, HttpServletResponse rexsponse) {
		
		List<Map<String,String>> list = new ArrayList<>();
		final int numPerPage = 7;
		int totalContents = 0;
		list = documentService.selectMemberList(cPage,numPerPage);  
		totalContents = documentService.selectAllCountByAccountNo(); 
		String url = "documentListPage.do?";
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, url);
		
		Map<String,Object> map = new HashMap<>();
		map.put("numPerPage",numPerPage);
		map.put("cPage",cPage);
		map.put("totalContents",totalContents);
		map.put("list",list);
		map.put("pageBar", pageBar);
		return map;
	}
	@RequestMapping("/document/documentDetailView.do")
	public ModelAndView documentDetailView(ModelAndView mav, @RequestParam("docNo") int docNo) {
		
		Document document = new Document();
		document = documentService.documentDetailView(docNo);
		mav.addObject("list",document);
		mav.setViewName("document/documentDetailView");
		
		return mav;
	}
	@RequestMapping("/document/updateDocument.do")
	public ModelAndView updateDocumnet(ModelAndView mav, @RequestParam("docNo") int docNo, @RequestParam("empName") String empName, 
										@RequestParam("submitApprove") int submitApprove) {
		int result1=0;
		int result2=0;
		if(submitApprove ==1) {
			result1 = documentService.approveDocument(docNo);
		}else {
			result2 = documentService.refuseDocument(docNo);
		}
		String msg="";
		String loc="/document/documentView.do?empName="+empName;
		if(result1>0) {
			msg="결재가 승인되었습니다.";
			mav.addObject("msg",msg);
			mav.addObject("loc",loc);
			mav.setViewName("common/msg");
		}
		if(result2>0) {
			msg="결재가 거절되었습니다.";
			mav.addObject("msg",msg);
			mav.addObject("loc",loc);
			mav.setViewName("common/msg");
		}
		
		return mav;
	}
	
	
}
