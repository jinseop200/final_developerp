package com.dev.erp.document.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.erp.document.model.vo.Document;
import com.dev.erp.document.model.vo.DocumentLine;

@Repository
public class DocumentDAOImpl implements DocumentDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Document> selectDocList(String empName) {
		return sqlSession.selectList("document.selectDocList",empName);
	}

	@Override
	public List<Map<String, String>> selectDocTypeAll() {
		return sqlSession.selectList("document.selectDocTypeAll");
	}

	@Override
	public int insertDocument(Document document) {
		return sqlSession.insert("document.insertDocument",document);
	}

	@Override
	public int insertDocumentLine(DocumentLine documentLine) {
		return sqlSession.insert("document.insertDocumentLine",documentLine);
	}

}
