package com.dev.erp.enrollment.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EnrollmentDAOImpl implements EnrollmentDAO {

	@Autowired
	SqlSession sqlsession;

	@Override
	public int insertVendor(Map<String, String> vendor) {
		return sqlsession.insert("enrollment.insertVendor", vendor);
	}

	@Override
	public List<Map<String, String>> selectVendorList() {
		return sqlsession.selectList("enrollment.selectVendorList");
	}
	
	
}
