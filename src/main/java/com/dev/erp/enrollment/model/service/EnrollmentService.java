package com.dev.erp.enrollment.model.service;

import java.util.List;
import java.util.Map;

public interface EnrollmentService {

	int insertVendor(Map<String, String> vendor);

	List<Map<String, String>> selectVendorList();

	Map<String, String> selectOneVendorNo(String vendorNo);

	int updateVendor(Map<String, String> vendor);

}
