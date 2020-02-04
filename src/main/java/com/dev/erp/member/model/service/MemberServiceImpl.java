package com.dev.erp.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.erp.member.model.dao.MemberDAO;
import com.dev.erp.member.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}

	@Override
	public List<Map<String, String>> selectDeptList() {
		return memberDAO.selectDeptList();
	}

	@Override
	public List<Map<String, String>> selectJobList() {
		return memberDAO.selectJobList();
	}
}

