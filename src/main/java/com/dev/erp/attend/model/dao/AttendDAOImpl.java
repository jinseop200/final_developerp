package com.dev.erp.attend.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class AttendDAOImpl implements AttendDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int attendant(String email) {
		return sqlSession.insert("attend.attendant",email);
	}
}
