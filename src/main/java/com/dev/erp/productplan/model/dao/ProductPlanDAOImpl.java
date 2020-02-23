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
	public int deleteOneJo(String joNo) {
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

	@Override
	public int selectJoTotalContents() {
		return sqlSession.selectOne("productplan.selectJoTotalContents");
	}

	@Override
	public Map<String, String> selectOneJo(String joNo) {
		return sqlSession.selectOne("productplan.selectOneJo", joNo);
	}

	@Override
	public int updateJobOrderEnd(Map<String, String> update) {
		return sqlSession.update("productplan.updateJobOrder",update);
	}

	@Override
	public List<Map<String, String>> eachAmountByProduct(String productNo) {
		return sqlSession.selectList("productplan.eachAmount",productNo);
	}

	@Override
	public List<Map<String, String>> selectFirstByPL() {
		return sqlSession.selectList("productplan.selectFirstByPL");
	}

	@Override
	public int selectTotalEpPlan() {
		return sqlSession.selectOne("productplan.selectTotalEpPlan");
	}

	@Override
	public int selectTotalEpResult() {
		return sqlSession.selectOne("productplan.selectTotalEpResult");
	}

	@Override
	public List<Map<String, String>> selectProduction(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("productplan.selectProduction", null, rowBounds);
	}

	@Override
	public int selectTotalContentsByP() {
		return sqlSession.selectOne("productplan.selectTotalContentsByP");
	}
}
