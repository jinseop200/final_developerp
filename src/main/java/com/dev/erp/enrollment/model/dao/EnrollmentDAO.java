package com.dev.erp.enrollment.model.dao;

import java.util.List;
import java.util.Map;

public interface EnrollmentDAO {

	int insertVendor(Map<String, String> vendor);

	List<Map<String, String>> selectVendorList();

}
