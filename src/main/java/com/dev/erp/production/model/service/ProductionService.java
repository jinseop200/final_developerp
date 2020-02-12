package com.dev.erp.production.model.service;

import java.util.List;
import java.util.Map;

public interface ProductionService {

	List<Map<String, String>> selectRawMaterialList();


	int insertBOMlist(Map<String, Object> paramMap);


	int insertBOM(String productCode);


	int selectBOMNobyProductCode(String productCode);

}
