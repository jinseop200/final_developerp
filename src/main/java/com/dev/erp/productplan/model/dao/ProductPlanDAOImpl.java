package com.dev.erp.productplan.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductPlanDAOImpl implements ProductPlanDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
}
