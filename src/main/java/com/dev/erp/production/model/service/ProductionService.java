package com.dev.erp.production.model.service;

import java.util.List;
import java.util.Map;

public interface ProductionService {

	List<Map<String, String>> selectRawMaterialList();


	int insertBOMlist(Map<String, Object> paramMap);


	int insertBOM(String productCode);


	int selectBOMNobyProductCode(String productCode);


	List<Map<String, String>> selectproductList();


	Map<String, String> selectBOMForm(String tdPtNo);


	List<Map<String, String>> selectBOMRmListByBOMNo(int bomNo);


	int deleteBOMRm(Map<String, Object> deleteMap);


	int updateBOMRm(Map<String, Object> paramMap);


	List<Map<String, String>> selectReceivingList();


	int addWarehousing(Map<String, String> warehousing);


	Map<String, Object> selectWarehousingByLotNo(String tdLotNo);


	int updateWarehousing(Map<String, String> warehousing);


	int deleteBOMByBOMNo(int bomNo);


	int selectRotNobyRmNo(String rmNo);


	int deleteWarehousingByRmNo(int lotNo);

}
