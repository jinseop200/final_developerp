package com.dev.erp.production.model.service;

import java.util.List;
import java.util.Map;

public interface ProductionService {

	List<Map<String, String>> selectRawMaterialList();

	int insertBOMlist(List<Map<String, Object>> BOMList);

}
