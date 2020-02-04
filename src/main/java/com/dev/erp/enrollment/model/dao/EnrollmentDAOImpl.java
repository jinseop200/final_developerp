package com.dev.erp.enrollment.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EnrollmentDAOImpl implements EnrollmentDAO {

	@Autowired
	SqlSession sqlsession;
	
	
}
