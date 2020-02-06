package com.dev.erp.stock.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StockDAOImpl implements StockDAO {

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Map<String, String>> selectRmStockList() {
		return sqlsession.selectList("stock.selectRmStockList");
	}

}
