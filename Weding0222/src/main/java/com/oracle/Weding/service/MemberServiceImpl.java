package com.oracle.Weding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.Weding.dao.MemberDao;
import com.oracle.Weding.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired private MemberDao md;
	
	
	/**
	 * 회원가입
	 * 작성자: 임채영
	 */
	@Override
	public int join(Member member) {
		int result = md.join(member);
		
		return result;
	}

	
	/**
	 * 로그인 
	 * 작성자: 임채영
	 */
	@Override
	public Member login(Member member) {
		System.out.println("MemberServiceImpl login Start...");
		Member result = md.login(member);
		System.out.println("MemberServiceImpl login result ->" + result);
		
		return result;
	}


	/**
	 * 아이디 중복체크
	 * 작성자: 임채영
	 */
	@Override
	public int memberIdConfirm(Member member) {
		int result = md.memberIdConfirm(member);
		System.out.println("****** 서비스임플 result :  " + result);
		
		return result;
	}


	/**
	 * 이메일 인증
	 * 작성자: 임채영
	 */
	@Override
	public String mailConfirm(Member member) {
		String result = md.mailConfirm(member);
		
		return null;
	}
	

	/**
	 * 회원정보 조회
	 * 작성자: 조소현
	 */
	@Override
	public Member readMember(String id) {
		System.out.println("MemberServiceImpl readMember Start...");
		Member member = md.readMember(id);
		
		return member;
	}

	
	/**
	 * 회원정보 수정
	 * 작성자: 조소현
	 */
	@Override
	public int memberUpdate(Member member) {
		System.out.println("MemberServiceImpl memberUpdate Start...");
		int update = 0;
		update = md.memberUpdate(member);
		
		return update;
	}

	
	/**
	 * 비밀번호 수정
	 * 작성자: 조소현
	 */
	@Override
	public int pwUpdate(Member member) {
		System.out.println("MemberServiceImpl pwUpdate Start...");
		int result = 0;
		result = md.pwUpdate(member);
		
		return result;
	}
	
	
	/**
	 * 회원 탈퇴
	 * 작성자: 김태근
	 */
	@Override
	public int memberDelete(Member member) {
		int memberDelete;
		memberDelete = md.memberDelete(member);
		
		return memberDelete;
	}
	
	
	/**
	 * 전체 회원 수 조회
	 * 작성자: 안혜정
	 */
	@Override
	public int total() {
		System.out.println("MemberServiceImpl total Start..");
		int totCnt = md.total();
		System.out.println("MemberServiceImpl total totCnt : "+totCnt);
		
		return totCnt;
	}

	
	/**
	 * 전체 회원 조회
	 * 작성자: 안혜정
	 */
	@Override
	public List<Member> memberList(Member member) {
		System.out.println("MemberServiceImpl memberList Start..");
		List<Member> listMember = md.memberList(member);
		System.out.println("MemberServiceImpl memberList listMember.size() : "+listMember.size());
		
		return listMember;
	}

	
	/**
	 * 회원구분 조회
	 * 작성자: 안혜정
	 * 
	 * 소비자, 판매자, 관리자
	 */
	@Override
	public List<Member> catList(Member member) {
		System.out.println("MemberServiceImpl catList Start..");
		List<Member> catList = md.catList(member);
		System.out.println("MemberServiceImpl catList catList size() : "+catList.size());
		
		return catList;
	}


	/**
	 * 회원구분 전환
	 * 작성자: 안혜정
	 */
	@Override
	public int update(Member member) {
		System.out.println("MemberServiceImpl update..");
		int kkk = md.update(member);
		
		return kkk;
	}

	
	/**
	 * 회원구분 전환
	 * 작성자: 안혜정
	 */
	@Override
	public List<Member> changeMemberLv() {
		System.out.println("MemberServiceImpl changeMemberLv Start..");
		List<Member> memberList = md.changeMemberLv();
		System.out.println("MemberServiceImpl changeMemberLv memberList.size() : "+memberList.size());
		
		return memberList;
	}

	
	/**
	 * 아이디 찾기
	 * 작성자: 안혜정
	 */
	@Override
	public String findId(Member member) {
		System.out.println("MemberServiceImpl findId Start.."); 
		String idResult = md.findId(member);
		
		return idResult;
	}


	/**
	 * 아이디, 이메일로 회원정보 가져오기
	 * 작성자: 안혜정
	 */
	@Override
	public Member getMemberEmail(Member member) {
		System.out.println("MemberServiceImpl getMemberEmail Start..");
		Member pwFindMail = md.getMemberEmail(member);
		
		return pwFindMail;
	}

	
	/**
	 * 비밀번호 찾기
	 * 작성자: 안혜정
	 */
	@Override
	public int findPw(Member member) {
		System.out.println("MemberServiceImpl findPw Start..");
		int findPw = md.findPw(member);
		
		return findPw;
	}

	
	/**
	 * 임시 비밀번호로 변경
	 * 작성자: 안혜정
	 */
	@Override
	public void tempPassword(Member member) {
		System.out.println("MemberServiceImpl tempPassword Start..");
		int randomPassword = md.randomPassword(member);		
	}
	
}
