package com.oracle.Weding.controller;

import java.util.List; 

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.Weding.dto.Alarm;
import com.oracle.Weding.service.ProductService;

@Controller
public class MailController {
	
	@Autowired private ProductService ps;
	@Autowired private JavaMailSender mailSender;
	
	
	/**
	 * 관리자 - 알림 메일 전송
	 * 작성자: 조소현
	 * 
	 * 알림 신청한 소비자에게 메일 전송
	 * 
	 * @param p_num
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="mailTransport")
	public String mailTransport(String p_num, HttpServletRequest request, Model model) {
		//상품알림신청한 사람 구해오기
		List<Alarm> emailList = ps.getEmailList(p_num);
		
		System.out.println("mailSending...");
		String tomail = null;		//받는 사람 이메일 
		String setFrom = "wedingfunding@gamil.com";
		String title="[Weding]상품오픈알림입니다.";			//제목 
		for(int i=0; i<emailList.size(); i++) {
			System.out.println(i+"번째 사람"+emailList.get(i).getName()+"이메일="+emailList.get(i).getEmail());
			tomail=emailList.get(i).getEmail();
		
		try {
			// Mime 전자우편 Internet 표준 Format
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setFrom);		//보내는 사람 생략하거나 하면 정상작동을 안함 
			messageHelper.setTo(tomail);;		//받는사람 이메일 
			messageHelper.setSubject(title);	//메일제목은 생략이 가능하다 
			String content = "<h3>내일은 "+emailList.get(0).getP_name()+" 상품 오픈일입니다.</h3><hr><h3>더 많은 상품이 궁금하시다면?</h3><h1><a href='http://116.43.93.249:9000/Weding/main'>We-ding</a></h1>";
			message.setText(content, "utf-8","html"); //메일 내용
//			DataSource dataSource = new FileDataSource("/Users/zeroh0/Desktop/upload/fun.jpeg");			//첨부메일 
//			messageHelper.addAttachment(MimeUtility.encodeText("airport.png", "UTF-8", "B"), dataSource);	//첨부문자 rename 
			mailSender.send(message);
			model.addAttribute("check", 1);		//정상전달 
//			s.tempPw(u_id, tempPassword);		//db에 비밀번호를 임시비밀번호로 업데이트 	
		}catch(Exception e) {
			System.out.println(e);
			model.addAttribute("check", 2);		//메일 전달 실패 
		}
		}
		return "mailResult";
	}
	
}
