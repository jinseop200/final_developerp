package com.dev.erp.stock.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.stock.model.dao.StockDAO;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	StockDAO stockDAO;
	
	@Override
	public List<Map<String, String>> selectRmStockList() {
		
		return stockDAO.selectRmStockList();
	}

}
