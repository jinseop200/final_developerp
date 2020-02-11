package com.dev.erp.productplan.model.dao;

import java.util.List;
import java.util.Map;

public interface ProductPlanDAO {

	int insertJobOrder(Map<String, String> joList);

	List<Map<String, String>> selectJobOrder();

	int deleteOneJo(int joNo);

	List<Map<String, String>> selectEndProduct(int cPage, int numPerPage);

	int selectTotalContentsByEp();

}
