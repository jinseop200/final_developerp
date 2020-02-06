package com.dev.erp.enrollment.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.enrollment.model.dao.EnrollmentDAO;

@Service
public class EnrollmentServiceImpl implements EnrollmentService {

	@Autowired
	EnrollmentDAO enrollmentDAO;
	
	Logger logger = LoggerFactory.getLogger(EnrollmentServiceImpl.class);

	@Override
	public int insertVendor(Map<String, String> vendor) {
		return enrollmentDAO.insertVendor(vendor);
	}

	@Override
	public List<Map<String, String>> selectVendorList() {
		return enrollmentDAO.selectVendorList();
	}

	@Override
	public Map<String, String> selectOneVendorNo(String vendorNo) {
		return enrollmentDAO.selectOneVendorNo(vendorNo);
	}

	@Override
	public int updateVendor(Map<String, String> vendor) {
		return enrollmentDAO.updateVendor(vendor);
	}
	
	
}
