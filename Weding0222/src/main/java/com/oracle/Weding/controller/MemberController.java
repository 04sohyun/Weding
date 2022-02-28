package com.oracle.Weding.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.Weding.dto.Member;
import com.oracle.Weding.service.MemberService;
import com.oracle.Weding.service.Paging;

@Controller
public class MemberController {
	
	@Autowired private MemberService ms;
	@Autowired private JavaMailSender mailSender;
	
	
	/**
	 * 회원가입 폼으로 이동
	 * 작성자: 임채영
	 * 
	 * @return
	 */
	@RequestMapping(value="joinForm")
	public String joinForm() {
		System.out.println("MemberController Start joinForm.. ......");
		
		return "/member/joinForm";
	}
	
	
	/**
	 * 회원가입 처리
	 * 작성자: 임채영
	 * 
	 * @param member
	 * @return
	 */
	@PostMapping(value="join")
	public String join(Member member) {
		System.out.println("MemberController Start Join .");
		int result = ms.join(member);
		
		if(result>0) {
			return "redirect:main"; //값이 0보다 클 때(회원가입성공), 1반하면 메인페이지로(가입완료)
		} else {
			return "redirect:joinForm"; //값>0 이 아닌 경우, joinForm으로 리턴(가입실패)
		}
		
	}
	
	
	/**
	 * 로그인 폼으로 이동
	 * 작성자: 임채영
	 * 
	 * @return
	 */
	@RequestMapping(value="/loginForm") //로그인폼으로 이동
	public String loginForm() {
		System.out.println("MemberController Start loginForm .... ....... ....");
		
		return "/member/loginForm";
	}
	
	
	/**
	 * 로그인 처리
	 * 작성자: 임채영
	 * 
	 * @param member
	 * @param session
	 * @return
	 */
	@RequestMapping(value="login") //로그인 
	public String login(Member member, HttpSession session) { 
		System.out.println("MemberController Start Login.......");
		Member result = ms.login(member);
		
		if(result != null) {
			session.setAttribute("member", result);
			return "redirect:main";
		} else {
			return "redirect:loginForm"; 
		}
		
	}
	
	
	/**
	 * 로그아웃
	 * 작성자: 임채영
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="logout") //로그아웃
	public String logout(HttpSession session) {
		System.out.println("Membercontroller start logout....");
		session.invalidate(); //세션 초기화
		
		return "redirect:main";
	}
	
	
	/**
	 * 아이디 중복체크
	 * 작성자: 임채영
	 * 
	 * @param member
	 * @return
	 */
	@ResponseBody 
	@RequestMapping(value="memberIdConfirm")
	public int memberIdConfirm(Member member) {
		System.out.println("MemberController start memberIdConfirm........");
		System.out.println(member.getId());
		int result = ms.memberIdConfirm(member);
		System.out.println("****** 컨트롤러 result :  " + result);
		
		return result;
	}
	
	
	/**
	 * 이메일 인증
	 * 작성자: 임채영
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="mailConfirm")
	public String mailConfirm(HttpServletRequest request, Model model) {
		System.out.println("mailSending...");
		String tomail = request.getParameter("email");   // 받는 사람 이메일
		System.out.println("tomail " + tomail);
		String setfrom = "wedingfunding@gmail.com";
		String title = "mailConfirm 입니다";                 // 제목
		String tempPassword = "";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);    
			messageHelper.setTo(tomail);       // 받는사람 이메일
			messageHelper.setSubject(title);   
			tempPassword = (int) (Math.random() * 999999) + 1 + "";
			messageHelper.setText("임시 비밀번호입니다 : " + tempPassword);
			System.out.println("임시 비밀번호입니다 : " + tempPassword);
			mailSender.send(message);
			
			model.addAttribute("check", 1);   // 정상 전달
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("check", 2);  // 메일 전달 실패
		}
		
		return tempPassword;
	}
	
	
	/**
	 * 회원정보 수정 폼으 이동 
	 * 작성자: 조소현
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping(value="memberUpdateForm")
	public String memberUpdateForm(HttpSession session, Model model) {
		System.out.println("MemberController memberUpdateForm Start...");
		
		//세션 객체 안에 있는 ID정보 저장 
		Member m1 = (Member) session.getAttribute("member");
		System.out.println("MemberController 회원의 id->"+m1.getId());
		
		Member member = ms.readMember(m1.getId());
		model.addAttribute("member", member);
		
		return "mypage/memberUpdateForm";
	}


	/**
	 * 회원정보 수정 처리
	 * 작성자: 조소현
	 * 
	 * @param session
	 * @param member
	 * @param model
	 * @return
	 */
	@PostMapping(value="memberUpdate")
	public String memberUpdate(HttpSession session, Member member, Model model) {
		System.out.println("MemberController memberUpdate Start…");
		//세션 객체 안에 있는 ID정보 저장 
		Member m1 = (Member) session.getAttribute("member");
		member.setId(m1.getId());
		member.setEmail(member.getEmail1()+"@"+member.getEmail2());
		System.out.println("이메일합치기 -> "+member.getEmail());
		int update = ms.memberUpdate(member);
		if(update>0) {
			model.addAttribute("msg", "회원 수정되었습니다.");
		}else {
			model.addAttribute("msg", "회원 수정에 실패했습니다.");
		}
		
	
		
		return "redirect:main";
	}
	
	
	/**
	 * 비밀번호 변경 폼으로 이동 
	 * 작성자: 조소현
	 * 
	 * @return
	 */
	@RequestMapping(value="pwChangeForm")
	public String pwChangeForm() {
		System.out.println("MemberController pwChangeForm Start…");
		
		return "mypage/pwchangeForm";
	}
	
	
	/**
	 * 비밀번호 변경 처리
	 * 작성자: 조소현
	 * 
	 * @param member
	 * @param session
	 * @return
	 */
	@PostMapping(value="pwUpdate")
	public String pwUpdate(Member member, HttpSession session) {
		System.out.println("MemberController pwChange Start…");
		Member m1 = (Member) session.getAttribute("member");
		member.setId(m1.getId());
		int result = ms.pwUpdate(member);
		
		return "redirect:main";
	}
	
	
	/**
	 * 회원 탈퇴
	 * 작성자: 김태근
	 * 
	 * @param member
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "memberDelete")
	public String memberDelete(Member member, Model model, HttpSession session) {
		System.out.println("MemberController memberDelete Start...");
		int memberDelete = ms.memberDelete(member);
		System.out.println("MemberController memberDelete => " + memberDelete);
		session.invalidate(); //세션 초기화
		
		return "redirect:main";
	}
	

	/**
	 * 소비자 -> 판매자 전환시 멤버 리스트, 총 인원 출력
	 * 작성자: 안혜정
	 * 
	 * @param member
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping(value="allMemberList")
	public String allMemberList(Member member,String currentPage, Model model) {
		System.out.println("MemberController Start allMemberList..");
		int total = ms.total(); //총 회원 수
		System.out.println("MemberController total : "+total);
		
		System.out.println("currentPage : "+currentPage);
		Paging pg = new Paging(total, currentPage);
		member.setStart(pg.getStart()); //시작시 1
		member.setEnd(pg.getEnd()); //시작시 10
		
		List<Member> memberList = ms.memberList(member); //회원 리스트
		List<Member> catList = ms.catList(member); //회원 카테고리(소비자/판매자/관리자)
		for(Member catList01 : catList ) {
			System.out.println("catList01.getMini_cat()->"+catList01.getMini_cat());
			System.out.println("catList01.getMini_content()->"+catList01.getMini_content());
		}
		System.out.println("MemberController list memberList.size() : " + memberList.size());
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("pg",pg);
		model.addAttribute("total",total);
		model.addAttribute("catList",catList);
		
		return "admin/allMemberList";
	}
	
	
	/**
	 * 소비자 -> 판매자 전환
	 * 작성자: 안혜정
	 * 
	 * @param member
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "updateMember")
	public String update(Member member, Model model) {
		System.out.println("MemberController update Start..");
		System.out.println("MemberController update member.getMini_cat()->"+member.getMini_cat());
		System.out.println("MemberController update member.getId()->"+member.getId());
		int uptCnt = ms.update(member);
		System.out.println("ms.update(member) Count : "+uptCnt);
		model.addAttribute("uptCnt",uptCnt);
		
		return "forward:allMemberList";
	}
	
	
	/**
	 * 아이디/비밀번호 찾기 폼으로 이동
	 * 작성자: 안혜정
	 * 
	 * @return
	 */
	@RequestMapping(value="idpwFindForm")
	public String idFindForm() {
		System.out.println("MemberController idpwFindForm Start..");
		return "member/idpwFindForm";
	}
	
	
	/**
	 * 아이디 찾기
	 * 작성자: 안혜정
	 * 
	 * @param member
	 * @return
	 */
	@RequestMapping(value="/member/idFindAjax", method = RequestMethod.POST)
	@ResponseBody
	public String idFindAjax(Member member) {
		System.out.println("MemberController idFindAjax Start..");
		System.out.println("MemberController idFindAjax member.getName() : "+member.getName());
		System.out.println("MemberController idFindAjax member.getPhone() : "+member.getPhone());
		
		String id = ms.findId(member);
		System.out.println("MemberController idFind id : "+id);
		
		return id;
		
	}
	
	
	/**
	 * 비밀번호 찾기
	 * 작성자: 안혜정
	 * 
	 * 임시 비밀번호 메일 전송, 임시 비밀번호 저장
	 * 
	 * @param member
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/member/pwFindAjax", method = RequestMethod.POST)
	@ResponseBody
	public String pwFindAjax(Member member,HttpServletRequest request, Model model) {
		System.out.println("MemberController pwFindAjax Start..");
		System.out.println("MemberController pwFindAjax member.getId() : "+member.getId());
		System.out.println("MemberController pwFindAjax member.getEmail() : "+member.getEmail());
		
		Member getMemberEmail = ms.getMemberEmail(member);
		System.out.println( " getMemberEmail.getEmail()"+getMemberEmail.getEmail());

		String getId = member.getId();
		
		System.out.println("MemberController 비밀번호 찾기 메일 전송..");
		
		String tomail = getMemberEmail.getEmail(); //받는사람 이메일
		String setfrom = "boccioni1900@gmail.com"; //보내는 사람 이메일
		String title = "[We_ding] 임시 비밀번호입니다."; //제목
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			messageHelper.setFrom(setfrom); //보내는 사람 생략하면 정상작동 안함
			messageHelper.setTo(tomail); //받는 사람 이메일
			messageHelper.setSubject(title); //메일제목 생략 가능
			String tempPassword = (int)(Math.random() * 999999)+1+"";
			String content = "<h3>We_ding 임시 비밀번호입니다.<h3><hr><br>"
					+ "<p>회원님의 임시 비밀번호는 "+tempPassword+"입니다.<p><br>"
					+ "<p>마이페이지에서 비밀번호 변경 후 이용 바랍니다.<p><br>";
			message.setText(content, "utf-8","html"); //메일 내용
			System.out.println("임시 비밀번호 : " + tempPassword);
			mailSender.send(message);
			model.addAttribute("check",1); //정상 전달
			member.setTempPassword(tempPassword);
			ms.tempPassword(member); //db에 비밀번호를 임시 비밀번호로 업데이트
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("check",2); //정상 전달 실패
		}
	
		return "member/idpwFindForm";
	}
	
}
