package com.dev.erp.document.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.document.model.dao.DocumentDAO;
import com.dev.erp.document.model.vo.Document;
import com.dev.erp.document.model.vo.DocumentLine;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	DocumentDAO documentDAO;

	@Override
	public List<Document> selectDocList(String empName) {
		return documentDAO.selectDocList(empName);
	}

	@Override
	public List<Map<String, String>> selectDocTypeAll() {
		return documentDAO.selectDocTypeAll();
	}

	@Override
	public int insertDocument(Document document) {
		return documentDAO.insertDocument(document);
	}

	@Override
	public int insertDocumentLine(DocumentLine documentLine) {
		return documentDAO.insertDocumentLine(documentLine);
	}

}
