package com.dev.erp.productplan.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.productplan.model.dao.ProductPlanDAO;

@Service
public class ProductPlanServiceImpl implements ProductPlanService {
	@Autowired
	ProductPlanDAO productPlanDAO;

	@Override
	public int insertJobOrder(Map<String, String> joList) {
		
		return productPlanDAO.insertJobOrder(joList);
	}

	@Override
	public List<Map<String, String>> selectJobOrder() {
		return productPlanDAO.selectJobOrder();
	}

	@Override
	public int deleteOneJo(int joNo) {
		return productPlanDAO.deleteOneJo(joNo);
	}

	@Override
	public List<Map<String, String>> selectEndProduct(int cPage, int numPerPage) {
		return productPlanDAO.selectEndProduct(cPage, numPerPage);
	}

	@Override
	public int selectTotalContentsByEp() {
		return productPlanDAO.selectTotalContentsByEp();
	}

}
