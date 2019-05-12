/**
 *
 */
package com.ssafy.model.service;

import java.util.Random;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.model.dto.User;
import com.ssafy.model.repository.UserRepository;

/**
 * @author itsme
 * @Date : 2019. 4. 14.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	private UserRepository userRepo;
	
	@Autowired
	public UserServiceImpl(UserRepository repo) {
		userRepo = repo;
	}

	@Override
	public int insertUser(User user) {
		int result = userRepo.insertUser(user);
		return result;
	}

	@Override
	public User login(String id, String pw) {
		User account = userRepo.selectUser(id);
		logger.trace("login : {}", account);
		if(account != null && account.getPw().equals(pw)) {
			return account;
		}else return null;
	}

	@Override
	public User selectUser(String id) {
		return userRepo.selectUser(id);
	}

	@Override
	public int updateUser(User user) {
		return userRepo.updateUser(user);
	}

	@Override
	public int deleteUser(String userId) {
		System.out.println("userId :: "+userId);
		userRepo.deleteUserEat(userId);
		return userRepo.deleteUser(userId);
	}

	@Override
	public User findPw(User user) {
		User selUser = userRepo.findPw(user);
		
		//가입에 사용한 이메일이 아니면
		if(selUser!=null &&!user.getEmail().equals(selUser.getEmail())) {
			return null;
		}else {
			//임시 비밀번호 생성
			String yimsiPw = "";
			Random rd = new Random();
			for(int i = 0; i < 8; i++) {
				yimsiPw += rd.nextInt(10);
			}
			
			//비밀번호변경
			selUser.setPw(yimsiPw); 
			userRepo.updatePw(selUser);
			//비밀번호 변경 메일 발송
			sendEmail(selUser);
			
			return selUser;
		}
	}
	
	@Override
	public User findId(User user) {
		User selUser = userRepo.findId(user);
		if(selUser!=null &&!user.getEmail().equals(selUser.getEmail())) {
			return null;
		}else return selUser;
	}

	@Override
	public int updatePw(User user) {
		return userRepo.updatePw(user);
	}
	
	@Override
	public void sendEmail(User user) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";  //SMTP서버 설정
		String hostSMTPid = "safefoodby@gmail.com";
		String hostSMTPpwd = "by741852";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = user.getEmail();
		String fromName = "Safe Food";
		String subject = "";
		String msg = "";
		
		subject = "Safe Food 홈페이지 임시 비밀번호 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += user.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		msg += "<p>임시 비밀번호 : ";
		msg += user.getPw() + "</p></div>";
	
		// 받는 사람 E-Mail 주소
		String mail = user.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
}
