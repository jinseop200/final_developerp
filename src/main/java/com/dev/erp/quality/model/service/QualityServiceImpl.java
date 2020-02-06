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
	public Quality selectOnebyQualityNo(int quality_no) {
		
		Quality qualityContent = qualityDAO.selectOnebyQualityNo(quality_no);
		
		return qualityContent;
	}

	@Override
	public int qualityUpdateOne(Quality quality) {
		return qualityDAO.qualityUpdateOne(quality);
	}

	@Override
	public List<Map<String, String>> selectStoreAll() {
		// TODO Auto-generated method stub
		return qualityDAO.selectStoreAll();
	}

	@Override
	public List<Map<String, String>> selectQualityColumn(String searchType) {
		// TODO Auto-generated method stub
		return qualityDAO.selectQualityColumn(searchType);
	}

	@Override
	public List<Map<String, String>> selectProductTypeAll() {
		// TODO Auto-generated method stub
		return qualityDAO.selectProductTypeAll();
	}

}
