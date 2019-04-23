package com.sp.member;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.MyUtil;
import com.sp.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberService {
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private CommonDAO dao;
	
	public User readLoginInfo(String userId) {
		User user = null;
		try {
			 user = dao.selectOne("member.readLoginInfo", userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	private String mailType= "text/html; charset=utf-8";
	private String encType= "utf-8";
	private class SMTPAuthenticator extends javax.mail.Authenticator {
		@Override
		public PasswordAuthentication getPasswordAuthentication() {  
			String username =  "wayou1904"; 
			String password = "1qaz2wsx!!"; 
			return new PasswordAuthentication(username, password);  
		}  
	}

	private void makeMessage(Message msg, String any) throws MessagingException {
		msg.setText(any);
		msg.setHeader("Content-Type", mailType);
	}

	public boolean mailSend(String email, String num) {
		boolean b=false;
		String sendEmail="wayou1904@gmail.com";
		String sendName="관리자";
		String subject= "WAYOU의 인증번호 보내드립니다~";
		String content="WAYOU의 인증번호는  "+num+" 입니다";

		Properties p = new Properties();   

		p.put("mail.smtp.user", "wayou1904");   
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");   
		p.put("mail.smtp.starttls.enable", "true");   
		p.put("mail.smtp.auth", "true");   
		p.put("mail.smtp.socketFactory.port", "465");   
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
		p.put("mail.smtp.socketFactory.fallback", "false");  

		try {
			Authenticator auth = new SMTPAuthenticator();  
			Session session = Session.getDefaultInstance(p, auth);

			Message msg = new MimeMessage(session);

			msg.setFrom(new InternetAddress(sendEmail, sendName, encType));

			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

			msg.setSubject(subject);

			if(mailType.indexOf("text/html") != -1) {
				content=(myUtil.htmlSymbols(content));
			}
			makeMessage(msg, content);
			msg.setHeader("X-Mailer", sendName);

			msg.setSentDate(new Date());

			Transport.send(msg);

			b=true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}
	
	public String random () {
		Random random = new Random();
		String num="";
		for(int i=0; i<4; i++) {
			num+=random.nextInt(10);
		}
		return num;
	}
	
	
	public int idCheck(String userId) {
		int result=0;
		try {
			result=dao.selectOne("member.idCheck", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertMember(User user) {
		int result=0;
		try {
			result=dao.insertData("member.insertMember", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}


