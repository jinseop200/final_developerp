package com.dev.erp.productplan.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.productplan.model.dao.ProductPlanDAO;

@Service
public class ProductPlanServiceImpl implements ProductPlanService {
	@Autowired
	ProductPlanDAO productPlanDAO;
}
