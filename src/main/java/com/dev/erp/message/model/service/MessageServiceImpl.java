package com.dev.erp.message.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.message.model.dao.MessageDAO;
import com.dev.erp.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDAO messageDAO;

	@Override
	public List<Map<String, Object>> selectMessageList(String empName) {
		return messageDAO.selectMessageList(empName);
	}

	@Override
	public List<Message> selectMessageAllList(int cPage, int numPerPage) {
		return messageDAO.selectMessageAllList(cPage,numPerPage);
	}

	@Override
	public int selectAllCountByAccountNo(String empName) {
		return messageDAO.selectAllCountByAccountNo(empName);
	}

	@Override
	public int insertMessage(Message message) {
		return messageDAO.insertMessage(message);
	}
}
