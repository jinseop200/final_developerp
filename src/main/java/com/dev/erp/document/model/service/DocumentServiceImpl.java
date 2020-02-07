package com.dev.erp.document.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.document.model.dao.DocumentDAO;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	DocumentDAO documentDAO;
}
