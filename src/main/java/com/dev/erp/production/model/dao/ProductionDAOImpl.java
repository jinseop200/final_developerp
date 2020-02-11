package com.dev.erp.production.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductionDAOImpl implements ProductionDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Map<String, String>> selectRawMaterialList() {
		return sqlSession.selectList("production.selectRawMaterialList");
	}
	
	
}
