package com.dev.erp.quality.model.service;

import java.util.List;
import java.util.Map;

import com.dev.erp.quality.model.vo.Quality;

public interface QualityService {

	List<Map<String, String>> selectQualityAll();

	Quality selectOnebyQualityNo(int quality_no);

	int qualityUpdateOne(Quality quality);

	List<Map<String, String>> selectStoreAll(int cPage, int numPerPage);

	List<Map<String, String>> selectQualityColumn(String searchType,int cPage,int numPerPage);

	List<Map<String, String>> selectProductTypeAll();

	int selectAllCountByStoreNo();

	int selectAllCountForQuality();

}
