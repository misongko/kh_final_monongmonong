package com.kh.monong.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.monong.member.model.dto.Member;
import com.kh.monong.member.model.dto.MemberEntity;

public interface MemberService {
//-----------수진시작
	Member selectMemberById(String memberId);
	
	Member selectMemberByEmail(String email);
	
	int insertMember(Member member);
//-----------수진 끝
//-----------수아 시작
	Member findMemberId(Map<String, Object> map);

	int updateTempPw(Map<String, Object> map);
	
	
//-----------수아 끝


	

	
}
