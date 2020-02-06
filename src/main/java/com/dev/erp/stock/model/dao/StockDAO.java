package com.dev.erp.stock.model.dao;

import java.util.List;
import java.util.Map;

public interface StockDAO {
	
	List<Map<String, String>> selectRmStockList();

}
