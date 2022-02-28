package com.oracle.Weding.dao;

import java.util.List;

import com.oracle.Weding.dto.Member;

public interface MemberDao {
	int 			join(Member member);
	Member      	login(Member member);
	int 			memberIdConfirm(Member member);
	String      	mailConfirm(Member member);
	Member 			readMember(String id);
	int 			memberUpdate(Member member);
	int 			pwUpdate(Member member);
	int 			memberDelete(Member member);
	int 			total();
	List<Member> 	memberList(Member member);
	List<Member> 	catList(Member member);
	int 			update(Member member);
	List<Member> 	changeMemberLv();
	List<Member>	findId(Member member);
	Member			getMemberEmail(Member member);
	int 			findPw(Member member);
	int				randomPassword(Member member);
	List<Member> getSearchMember(String keyword);
}
