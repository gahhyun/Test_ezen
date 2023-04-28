package com.earth.gahyunra;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;

import com.earth.gahyunra.User;
import com.earth.gahyunra.UserDao;

import jakarta.validation.Valid;

@Controller
public class RegisterController {
	
	@Autowired
	UserDao userDao;
	
	final int FAIL = 0;
	
	@GetMapping("/register/singup")
	public String register() {
		return "registerForm";				//신규회원 가입 화면 
	}
	
	@PostMapping("/register/singup")
	public String save(User user, BindingResult result, Model m) throws UnsupportedEncodingException {
		//유효성 검사 -- 관심사로 분리 
//		if(!isValid(user)) {
//			String msg = URLEncoder.encode("id를 잘못입력했습니다.", "utf-8");
//			return "redirect:/register/add2?msg="+msg;
//		}
		
		System.out.println("user = " + user);
		System.out.println("result = " + result);
		
		// User 객체 검증한 결과 에러가 있으면, 에러를 보여줌
		// DB에 새회원 정보를 저장
		
		if (!result.hasErrors()) {
			int rowCnt = userDao.insertUser(user);
			if (rowCnt != FAIL) return "registerinfo";
		}
				
		return "registerForm";
	}
}
