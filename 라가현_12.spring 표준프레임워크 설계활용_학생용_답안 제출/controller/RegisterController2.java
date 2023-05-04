package com.earth.gahyun.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import com.earth.gahyun.dto.User;

@Controller
public class RegisterController2 {
	
	//@RequestMapping(value = "/register/add2")  value 생략가능
	//@RequestMapping(value="/register/add2", method = {RequestMethod.GET, RequestMethod.POST)
	@GetMapping("/register/add")
	public String register() {
		return "registerForm";		//신규회원 가입 화면
	}
	
	//@RequestMapping(value = "/register/save2")
	@PostMapping("/register/save")
	public String save(User user , Model m) throws UnsupportedEncodingException {
		//유효성 검사
		if(!isValid(user)) {	//isVaid는 ()개체에 대한 일부 유효성 검사를 수행하고 개체가 유효한지 여부를 나타내는 부울 값을 반환합니다.
			String msg = URLEncoder.encode("id를 잘못입력했습니다", "UTF-8");
			return "redirect:/register/add?msg="+msg;			 //다시 입력받는 화면으로
		}
		else {
			return "registerinfo";
		}
		
	}

	private boolean isValid(User user) {
		

		return false; 
		/*  return false 하면 페이지 안넘어감 */
	}

}
