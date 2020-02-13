package com.dev.erp.productplan.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductPlanDAOImpl implements ProductPlanDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertJobOrder(Map<String, String> joList) {
		return sqlSession.insert("productplan.insertJobOrder", joList);
	}

	@Override
	public List<Map<String, String>> selectJobOrder() {
		return sqlSession.selectList("productplan.selectJobOrder");
	}

	@Override
	public int deleteOneJo(int joNo) {
		return sqlSession.delete("productplan.deleteOneJo", joNo);
	}

	@Override
	public List<Map<String, String>> selectEndProduct(int cPage, int numPerPage) {

		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("productplan.selectEndProduct", null, rowBounds);
	}

	@Override
	public int selectTotalContentsByEp() {
		return sqlSession.selectOne("productplan.selectTotalContentByEp");
	}

	@Override
	public List<Map<String, String>> selectCustomer(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("productplan.selectCustomer", null, rowBounds);
	}

	@Override
	public int selectTotalContentsByCtmr() {
		return sqlSession.selectOne("productplan.selectTotalContentByCtmr");
	}

	@Override
	public List<Map<String, String>> selectProductName(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("productplan.selectProductName", null, rowBounds);
	}

	@Override
	public int selectTotalContentsByPn() {
		return sqlSession.selectOne("productplan.selectTotalContentByPn");
	}
}
