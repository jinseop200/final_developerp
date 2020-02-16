package com.dev.erp.production.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductionDAOImpl implements ProductionDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Map<String, String>> selectRawMaterialList() {
		return sqlSession.selectList("production.selectRawMaterialList");
	}

	@Override
	public int insertBOMlist(Map<String, Object> paramMap) {
		return sqlSession.insert("production.insertBOMlist", paramMap);
	}

	@Override
	public int insertBOM(String productCode) {
		return sqlSession.insert("production.insertBOM",productCode);
	}

	@Override
	public int selectBOMNobyProductCode(String productCode) {
		return sqlSession.selectOne("production.selectBOMNobyProductCode",productCode);
	}

	@Override
	public List<Map<String, String>> selectproductList() {
		return sqlSession.selectList("production.selectproductList");
	}

	@Override
	public Map<String, String> selectBOMForm(String tdPtNo) {
		return sqlSession.selectOne("production.selectBOMForm",tdPtNo);
	}

	@Override
	public List<Map<String, String>> selectBOMRmListByBOMNo(int bomNo) {
		return sqlSession.selectList("production.selectBOMRmListByBOMNo",bomNo);
	}

	@Override
	public int deleteBOMRm(Map<String, Object> deleteMap) {
		return sqlSession.delete("production.deleteBOMRm",deleteMap);
	}

	@Override
	public int updateBOMRm(Map<String, Object> paramMap) {
		return sqlSession.insert("production.updateBOMRm",paramMap);
	}

	@Override
	public List<Map<String, String>> selectReceivingList() {
		return sqlSession.selectList("production.selectReceivingList");
	}

	@Override
	public int addWarehousing(Map<String, String> warehousing) {
		return sqlSession.insert("production.addWarehousing",warehousing);
	}

	@Override
	public Map<String, Object> selectWarehousingByLotNo(String tdLotNo) {
		return sqlSession.selectOne("production.selectWarehousingByLotNo",tdLotNo);
	}

	@Override
	public int updateWarehousing(Map<String, String> warehousing) {
		return sqlSession.update("production.updateWarehousing",warehousing);
	}

	@Override
	public int deleteBOMByBOMNo(int bomNo) {
		return sqlSession.delete("production.deleteBOMByBOMNo",bomNo);
	}

	@Override
	public int selectRotNobyRmNo(String rmNo) {
		return sqlSession.selectOne("production.selectRotNobyRmNo",rmNo);
	}

	@Override
	public int deleteWarehousingByRmNo(int lotNo) {
		return sqlSession.delete("production.deleteWarehousingByRmNo",lotNo);
	}


	
	
}
