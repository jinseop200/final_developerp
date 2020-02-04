package com.dev.erp.member.model.dao;

import java.util.List;
import java.util.Map;

import com.dev.erp.member.model.vo.Member;

public interface MemberDAO {

	int insertMember(Member member);

	List<Map<String, String>> selectDeptList();

	List<Map<String, String>> selectJobList();

	List<Member> memberSelectList();

	Member selectOneMember(String email);

}
