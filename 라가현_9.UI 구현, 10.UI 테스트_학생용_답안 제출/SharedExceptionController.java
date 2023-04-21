package com.earth.login;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;


import java.io.FileNotFoundException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//@ControllerAdvice("com.earth.duststorm2")		//지정한 패키지에서 발생한 예외만 처리
@ControllerAdvice		//모든 컨트롤러에서 발생하는 예외를 다 처리하게 됨(모든 패키지에 적용)
public class SharedExceptionController {
	
	@ExceptionHandler(Exception.class)
	public String catchar(Exception ex, Model m) {
		System.out.println("catchar() in SharedCatchar");
		return "error400";
	}
	
	@ExceptionHandler({ NullPointerException.class, FileNotFoundException.class })
	public String catchar2(Exception ex, Model m) {
		System.out.println("catchar2() in SharedCatchar");
		return "error500";
	}
	
	
}


	
	

