package com.dev.erp.quality.model.service;

import java.util.List;
import java.util.Map;

import com.dev.erp.quality.model.vo.Quality;

public interface QualityService {

	List<Map<String, String>> selectQualityAll();

	Map<String, String> selectOnebyQualityNo(String quality_no);

	int qualityUpdateOne(Map<String, String> param);

	List<Map<String, String>> selectStoreAll(int cPage, int numPerPage);

	List<Map<String, String>> selectQualityColumn(String searchType,int cPage,int numPerPage);

	List<Map<String, String>> selectProductTypeAll();

	int selectAllCountByStoreNo();

	int selectAllCountForQuality();

	List<Map<String, String>> searchBySpecify(Map<String, String> map);

	List<Map<String, String>> insectionWatingList(String type);

	Map<String, String> selectInsectionOnebyLotNo(String lotNo);

	int updateInsectionYNInRecieving(Map<String, String> param);

	int updateInsectionYNInProduction(Map<String, String> param);

	int insertQualityInfo(Map<String, String> param);

	String selectStoreNoByStoreName(String storeName);


}
