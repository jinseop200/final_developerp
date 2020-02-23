package com.dev.erp.purchase.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO {

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Map<String, String>> selectPurchaseList() {

		return sqlsession.selectList("purchase.selectPurchaseList");
	}

	@Override
	public List<Map<String, String>> selectPurchaseInsertList() {
		
		return sqlsession.selectList("purchase.selectPurchaseInsertList");
	}

}
