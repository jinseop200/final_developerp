package com.dev.erp.attend.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.erp.attend.model.vo.Attend;

@Repository
public class AttendDAOImpl implements AttendDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int attendant(String email) {
		return sqlSession.insert("attend.attendant",email);
	}

	@Override
	public int leave(String email) {
		return sqlSession.insert("attend.leave",email);
	}

	@Override
	public List<Attend> attendShow(String email) {
		return sqlSession.selectList("attend.attendShow",email);
	}
}
