package com.dev.erp.stock.model.dao;

import java.util.List;
import java.util.Map;

public interface StockDAO {
	
	List<Map<String, String>> selectRmStockList();

	List<Map<String, String>> selectRmSnrStockList();

	List<Map<String, String>> selectProductStockList();

	List<Map<String, String>> selectStorageStockList();

	
	
	
	int InsertRm(Map<String, String> rawMaterial);

	int UpdateRm(Map<String, String> rawMaterial);
	
	

	List<Map<String, String>> selectRawmaterialAll(int cPage, int numPerPage);

	int selectAllRawmaterialNo();

	List<Map<String, String>> selectStorageAll(int cPage, int numPerPage);

	int selectAllCountByStorageNo();

	List<Map<String, String>> selectProductTypeAll(int cPage, int numPerPage);

	int selectAllCountByProductNo();



}
