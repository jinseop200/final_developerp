package com.dev.erp.message.model.dao;

import java.util.List;
import java.util.Map;

import com.dev.erp.message.model.vo.Message;

public interface MessageDAO {

	List<Map<String, Object>> selectMessageList(String empName);

	List<Message> selectMessageAllList(int cPage, int numPerPage);

	int selectAllCountByAccountNo(String empName);

	int insertMessage(Message message);

}
