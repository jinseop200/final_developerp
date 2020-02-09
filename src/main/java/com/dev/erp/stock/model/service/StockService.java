package com.dev.erp.stock.model.service;

import java.util.List;
import java.util.Map;

public interface StockService {

	List<Map<String, String>> selectRmStockList();

	List<Map<String, String>> selectProductStockList();

	List<Map<String, String>> selectStorageStockList();

}
