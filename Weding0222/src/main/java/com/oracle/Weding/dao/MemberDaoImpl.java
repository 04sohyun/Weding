package com.oracle.Weding.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.Weding.dto.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired private SqlSession session;
	
	
	/**
	 * 회원가입
	 * 작성자: 임채영
	 */
	@Override
	public int join(Member member) {//가입
		int result = 0;
		System.out.println("MemberDaoImpl join start... .... ....... .");
		try {
			System.out.println(member);
			result = session.insert("memberJoin", member);
			System.out.println("insert result" + result);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl join -> " + e.getMessage());
		}
		
		return result;
	}


	/**
	 * 로그인 
	 * 작성자: 임채영
	 */
	@Override
	public Member login(Member member) {//로그인
		Member result = null;
		System.out.println("MemberDaoImpl login start... ..... ....... .");
		try {
			result = session.selectOne("memberLoginSelectOne", member);
			System.out.println("selectOne memberOut -> " + result);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl login -> " + e.getMessage());
		}
		
		return result;
	}


	/**
	 * 아이디 중복체크
	 * 작성자: 임채영
	 */
	@Override
	public int memberIdConfirm(Member member) {//아이디중복확인
		int result = 0; //
		System.out.println("MemberDaoImpl !!!! memberIdConfirm start ...................");
		System.out.println(member);
		try {
			result = session.selectOne("memberIdConfirm", member); //
			System.out.println("memberIdConfirm" + result);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl *** memberIdConfirm -> " + e.getMessage());
		}
		
		return result;
	}


	/**
	 * 이메일 인증
	 * 작성자: 임채영
	 */
	@Override
	public String mailConfirm(Member member) {//메일확인
		Member result = null;
		System.out.println("MemberDaoImpl --- mailConfirm start .. ..");
		System.out.println(member);
		
		return null;
	}

	
	/**
	 * 회원정보 조회
	 * 작성자: 조소현
	 */
	@Override
	public Member readMember(String id) {
		System.out.println("MemberDaoImpl readMember Start...");
		Member member = new Member();
		try {
			member = session.selectOne("memberSelectOne", id);
			System.out.println("MemberDaoImpl readMember member.getName()->"+member.getName());
		}catch(Exception e) {
			System.out.println("MemberDaoImpl readMember Exception->"+e.getMessage());
		}
		
		return member;
	}

	
	/**
	 * 회원정보 수정
	 * 작성자: 조소현
	 */
	@Override
	public int memberUpdate(Member member) {
		System.out.println("MemberDaoImpl memberUpdate Start...");
		int update =0;
		try {
			update = session.update("memberUpdate", member);
		}catch(Exception e) {
			System.out.println("MemberDaoImpl memberUpdate Exception->"+e.getMessage());
		}
		
		return update;
	}

	
	/**
	 * 비밀번호 수정
	 * 작성자: 조소현
	 */
	@Override
	public int pwUpdate(Member member) {
		System.out.println("MemberDaoImpl pwUpdate Start...");
		int result =0;
		try {
			result = session.update("pwUpdate", member);
		}catch(Exception e) {
			System.out.println("MemberDaoImpl pwUpdate Exception->"+e.getMessage());
		}
		
		return result;
	}
	
	
	/**
	 * 회원 탈퇴
	 * 작성자: 김태근
	 */
	@Override
	public int memberDelete(Member member) {
		System.out.println("MemberDaoImpl memberDelete Start...");
		int memberDelete = 1;
		try {
			memberDelete = session.update("memberDelete", member);
		}catch (Exception e) {
			System.out.println("MemberDaoImpl memberDelete Exception -> " + e.getMessage());
		}
		
		return memberDelete;
	}
	
	
	/**
	 * 전체 회원 수 조회
	 * 작성자: 안혜정
	 */
	@Override
	public int total() {
		int tot = 0;
		System.out.println("MemberDaoImpl total Start..");
		try {
			tot = session.selectOne("memberTotal");
			System.out.println("MemberDaoImpl total tot : "+tot);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl total Exception : "+e.getMessage());
		}
		
		return tot;
	}

	
	/**
	 * 전체 회원 조회
	 * 작성자: 안혜정
	 */
	@Override
	public List<Member> memberList(Member member) {
		List<Member> listMember = null;
		try {
			listMember = session.selectList("allMemberList",member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl listMember Exception : " + e.getMessage());
		}
		
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
		List<Member> listCat = null;
		System.out.println("MemberDaoImpl catList Start..");
		try {
			listCat = session.selectList("memberCatList",member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl catList Exception : "+e.getMessage());
		}
		
		return listCat;
	}


	/**
	 * 회원구분 전환
	 * 작성자: 안혜정
	 */
	@Override
	public int update(Member member) {
		System.out.println("MemberDaoImpl update Start..");
		int kkk = 0;
		try {
			kkk = session.update("changeMemberLv", member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl update Exception : "+e.getMessage());
		}
		
		return kkk;
	}


	/**
	 * 회원구분 전환
	 * 작성자: 안혜정
	 */
	@Override
	public List<Member> changeMemberLv() {
		List<Member> memberList = null;
		System.out.println("MemberDaoImpl changeMemberLv Start..");
		try {
			memberList = session.selectList("changeMemberLv");
		} catch (Exception e) {
			System.out.println("MemberDaoImpl changeMemberLv Exception : " + e.getMessage());
		}
		System.out.println("MemberDaoImpl changeMemberLv memberList.size() : "+memberList.size());
		
		return memberList;
	}


	/**
	 * 아이디 찾기
	 * 작성자: 안혜정
	 */
	@Override
	public String findId(Member member) {
		System.out.println("MemberDaoImpl findId Start..");
		String idResultStr = "";
		try {
			idResultStr = session.selectOne("memberIdFind",member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl findId Exception : " + e.getMessage());
		}

		return idResultStr;
	}

	
	/**
	 * 아이디, 이메일로 회원정보 가져오기
	 * 작성자: 안혜정
	 */
	@Override
	public Member getMemberEmail(Member member) {
		System.out.println("MemberDaoImpl getMemberEmail Start..");
		Member pwFindMail = new Member();
		System.out.println("MemberController pwFindAjax member.getId() : "+member.getId());
		System.out.println("MemberController pwFindAjax member.getEmail() : "+member.getEmail());
		try {
			pwFindMail = session.selectOne("getMemberEmail", member); //(mapper ID,parameter)
			System.out.println("MemberDaoImpl getMemberEmail pwFindMail.getEmail()"+pwFindMail.getEmail());
		} catch (Exception e) {
			System.out.println("MemberDaoImpl getMemberEmail Exception"+e.getMessage());

		}
		
		return pwFindMail;
	}


	/**
	 * 비밀번호 찾기
	 * 작성자: 안혜정
	 */
	@Override
	public int findPw(Member member) {
		System.out.println("MemberDaoImpl findPw Start..");
		int findPw = 0;
		try {
			findPw = session.update("updatePw",member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl findPw Exception"+e.getMessage());
		}
		
		return findPw;
	}


	/**
	 * 임시 비밀번호로 변경
	 * 작성자: 안혜정
	 */
	@Override
	public int randomPassword(Member member) {
		System.out.println("MemberDaoImpl randomPassword Start..");
		int randomPassword = 0;
		try {
			randomPassword = session.update("randomPassword", member);
		} catch (Exception e) {
			System.out.println("MemberDaoImpl randomPassword Exception"+e.getMessage());
		}
		
		return randomPassword;
	}
	
}
