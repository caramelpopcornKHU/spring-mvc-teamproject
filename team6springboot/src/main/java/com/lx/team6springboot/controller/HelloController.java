package com.lx.team6springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

	// 이러면 생성된 빈들의 목록을 다 얻을 수 있다.
	@Autowired
	ApplicationContext context;
	
	//dao만들고, auto-wired
	
	@RequestMapping(value = "/hello")
	public String hello() {
		
		return "hello";
	}
	
	@RequestMapping(value = "/hello2")
	public String hello2() {
		
		return "hello2";
	}
	
	@RequestMapping(value = "/hello3")
	public String hello3() {
		
		return "hello3";
	}
	
	@RequestMapping(value = "/hello4")
	public String hello4() {
		
		return "hello4";
	}
	
	@RequestMapping(value = "/hello5")
	public String hello5() {
		
		return "hello5";
	}
	
}
