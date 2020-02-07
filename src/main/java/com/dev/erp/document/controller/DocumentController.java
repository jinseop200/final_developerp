package com.dev.erp.document.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev.erp.document.model.service.DocumentService;

@Controller
public class DocumentController {

	@Autowired
	DocumentService documentService;
	
	@RequestMapping("/document/documentView.do")
	public void documentView() {
		
	}
}
