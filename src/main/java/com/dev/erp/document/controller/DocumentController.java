package com.dev.erp.document.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
}
