package com.dev.erp.attend.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.dev.erp.attend.model.dao.AttendDAO;


public interface AttendService {


	int attendant(String email);
}
