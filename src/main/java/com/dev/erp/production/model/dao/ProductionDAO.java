package com.dev.erp.production.model.dao;

import java.util.List;
import java.util.Map;

public interface ProductionDAO {

	List<Map<String, String>> selectRawMaterialList();

	int insertBOMlist(Map<String, Object> paramMap);

	int insertBOM(String productCode);

	int selectBOMNobyProductCode(String productCode);


}
