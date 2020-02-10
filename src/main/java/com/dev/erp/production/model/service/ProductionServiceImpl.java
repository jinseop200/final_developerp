package com.dev.erp.production.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.production.model.dao.ProductionDAO;

@Service
public class ProductionServiceImpl implements ProductionService {

	@Autowired
	ProductionDAO productionDAO;

	
	
	
}
