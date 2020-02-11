package com.dev.erp.production.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.production.model.dao.ProductionDAO;

@Service
public class ProductionServiceImpl implements ProductionService {

	@Autowired
	ProductionDAO productionDAO;

	@Override
	public List<Map<String, String>> selectRawMaterialList() {
		return productionDAO.selectRawMaterialList();
	}

	
	
	
}
