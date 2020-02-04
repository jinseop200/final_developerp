package com.dev.erp.member.model.service;

import java.util.List;
import java.util.Map;

import com.dev.erp.member.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	List<Map<String, String>> selectDeptList();

	List<Map<String, String>> selectJobList();

}
