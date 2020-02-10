package com.dev.erp.quality.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.quality.model.dao.QualityDAO;
import com.dev.erp.quality.model.vo.Quality;

@Service
public class QualityServiceImpl implements QualityService {

	@Autowired
	private QualityDAO qualityDAO;
	
	@Override
	public List<Map<String, String>> selectQualityAll() {
		
		List<Map<String, String>> list = qualityDAO.selectQaulityAll();
		
		return list;
	}

	@Override
	public Map<String, String> selectOnebyQualityNo(String quality_no) {
		
		Map<String, String> qualityContent = qualityDAO.selectOnebyQualityNo(quality_no);
		
		return qualityContent;
	}

	@Override
	public int qualityUpdateOne(Map<String, String> param) {
		return qualityDAO.qualityUpdateOne(param);
	}

	@Override
	public List<Map<String, String>> selectStoreAll(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return qualityDAO.selectStoreAll(cPage,numPerPage);
	}

	@Override
	public List<Map<String, String>> selectQualityColumn(String searchType, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return qualityDAO.selectQualityColumn(searchType, cPage, numPerPage);
	}

	@Override
	public List<Map<String, String>> selectProductTypeAll() {
		// TODO Auto-generated method stub
		return qualityDAO.selectProductTypeAll();
	}

	@Override
	public int selectAllCountByStoreNo() {
		// TODO Auto-generated method stub
		return qualityDAO.selectAllCountByStoreNo();
	}

	@Override
	public int selectAllCountForQuality() {
		// TODO Auto-generated method stub
		return qualityDAO.selectAllCountForQuality();
	}

	@Override
	public List<Map<String, String>> searchBySpecify(Map<String, String> map) {
		// TODO Auto-generated method stub
		return qualityDAO.searchBySpecify(map);
	}

	@Override
	public List<Map<String, String>> insectionWatingList(String type) {
		// TODO Auto-generated method stub
		return qualityDAO.insectionWatingList(type);
	}

	@Override
	public Map<String,String> selectInsectionOnebyLotNo(String lotNo) {
		// TODO Auto-generated method stub
		return qualityDAO.selectInsectionOnebyLotNo(lotNo);
	}

	@Override
	public int updateInsectionYNInRecieving(Map<String, String> param) {
		// TODO Auto-generated method stub
		return qualityDAO.updateInsectionYNInRecieving(param);
	}

	@Override
	public int updateInsectionYNInProduction(Map<String, String> param) {
		// TODO Auto-generated method stub
		return qualityDAO.updateInsectionYNInProduction(param);
	}

	@Override
	public int insertQualityInfo(Map<String, String> param) {
		// TODO Auto-generated method stub
		return qualityDAO.insertQualityInfo(param);
	}

	@Override
	public String selectStoreNoByStoreName(String storeName) {
		// TODO Auto-generated method stub
		return qualityDAO.selectStoreNoByStoreName(storeName);
	}



}
