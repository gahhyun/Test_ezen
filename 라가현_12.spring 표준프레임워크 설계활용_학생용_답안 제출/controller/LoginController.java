package com.earth.gahyun.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.earth.gahyun.dao.UserDao;
import com.earth.gahyun.dto.User;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	UserDao userDao;
	
	@GetMapping("/login")
	public String loginForm() {
		return "loginForm";
	}
	
	@PostMapping("/login")
	public String login(String id, String pwd, String toURL, boolean rememberId, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		//1번
		if(!loginCheck(id,pwd)) {
			String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다","utf-8");
		return "redirect:/login/login?msg="+msg;
		}
	
		//2번
		if(rememberId) {
			Cookie cookie = new Cookie("id",id);
			response.addCookie(cookie);	//아이디저장이 true이면 쿠키생성
		}
		else {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(0);		//아이디저장이 false이면 setMaxAge(쿠키를 얼마나 저장하는지)를 0으로해서 저장이 안되게 함
			response.addCookie(cookie);
		}
		
		
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		
		//toURL이 없거나 빈값이라면 "/"로 이동하고 존재한다면 저장된 toURL로 이동
		toURL = toURL==null || toURL.equals("") ? "/" : toURL;
		
		return "redirect:" + toURL;		
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";	//메인화면으로
	}
	
	
	
	

	//아이디 체크하는 메서드
	private boolean loginCheck(String id, String pwd) {
		User user = userDao.selectUser(id);
		if(user==null)
			return false;
		return user.getPwd().equals(pwd);
	}
	

}
