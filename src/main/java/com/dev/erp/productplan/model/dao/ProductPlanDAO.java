package com.dev.erp.productplan.model.dao;

import java.util.List;
import java.util.Map;

public interface ProductPlanDAO {

	int insertJobOrder(Map<String, String> joList);

	List<Map<String, String>> selectJobOrder();

	int deleteOneJo(String joNo);

	List<Map<String, String>> selectEndProduct(int cPage, int numPerPage);

	int selectTotalContentsByEp();

	List<Map<String, String>> selectCustomer(int cPage, int numPerPage);

	int selectTotalContentsByCtmr();

	List<Map<String, String>> selectProductName(int cPage, int numPerPage);

	int selectTotalContentsByPn();

	int selectJoTotalContents();

	Map<String, String> selectOneJo(String joNo);

	int updateJobOrderEnd(Map<String, String> update);

	List<Map<String, String>> eachAmountByProduct(String productNo);

	List<Map<String, String>> selectFirstByPL();

}
