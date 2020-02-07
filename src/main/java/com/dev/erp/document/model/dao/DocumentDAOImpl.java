package com.dev.erp.document.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentDAOImpl implements DocumentDAO {

	@Autowired
	SqlSession sqlSession;
}
