package com.dev.erp.document.model.dao;

import java.util.List;
import java.util.Map;

import com.dev.erp.document.model.vo.Document;
import com.dev.erp.document.model.vo.DocumentLine;

public interface DocumentDAO {

	List<Document> selectDocList(String empName);

	List<Map<String, String>> selectDocTypeAll();

	int insertDocument(Document document);

	int insertDocumentLine(DocumentLine documentLine);


}
