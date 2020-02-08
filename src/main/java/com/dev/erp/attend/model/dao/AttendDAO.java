package com.dev.erp.attend.model.dao;

import java.util.List;
import java.util.Map;

import com.dev.erp.attend.model.vo.Attend;

public interface AttendDAO {

	int attendant(String email);

	int leave(String email);

	List<Attend> attendShow(String email);

	Attend selectAttendOne(Attend attend);

	Attend selectLeaveOne(Attend attend);

	String checkAttend(Attend attend);

}
