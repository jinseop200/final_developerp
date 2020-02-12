package com.dev.erp.message.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.erp.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectMessageList(String empName) {
		return sqlSession.selectList("message.selectMessageList",empName);
	}

	@Override
	public List<Message> selectMessageAllList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("message.selectMessageAllList",null,rowBounds);
	}

	@Override
	public int selectAllCountByAccountNo(String empName) {
		return sqlSession.selectOne("message.selectAllCountByAccountNo",empName);
	}

	@Override
	public int insertMessage(Message message) {
		return sqlSession.insert("message.insertMessage",message);
	}
}
