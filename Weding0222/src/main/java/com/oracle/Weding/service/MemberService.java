package com.oracle.Weding.service;

import java.util.List;

import com.oracle.Weding.dto.Member;

public interface MemberService {
	int 			join(Member member);
	Member     		login(Member member);
	int 			memberIdConfirm(Member member);
	String     		mailConfirm(Member member);
	Member 			readMember(String id);
	int 			memberUpdate(Member member);
	int 			pwUpdate(Member member);
	int 			memberDelete(Member member);	
	int 			total();
	List			<Member> memberList(Member member);
	List<Member> 	catList(Member member);
	int 			update(Member member);
	List<Member>	changeMemberLv();
	String 			findId(Member member);
	Member 			getMemberEmail(Member member);
	int 			findPw(Member member);
	void 			tempPassword(Member member);
}
