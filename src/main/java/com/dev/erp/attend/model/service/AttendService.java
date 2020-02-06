package com.dev.erp.attend.model.service;



import java.util.List;
import java.util.Map;

import com.dev.erp.attend.model.dao.AttendDAO;
import com.dev.erp.attend.model.vo.Attend;


public interface AttendService {


	int attendant(String email);

	int leave(String email);

	List<Attend> attendShow(String email);
}
