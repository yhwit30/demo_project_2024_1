package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestAPI {

	@RequestMapping("/usr/test/APITest")
	public String APITest() {

		return "/usr/test/APITest/";
	}

	@RequestMapping("/usr/test/APITest2")
	public String APITest2() {

		return "/usr/test/APITest2";
	}

	@RequestMapping("/usr/test/APITest3")
	public String APITest3() {

		return "/usr/test/APITest3";
	}

	@RequestMapping("/usr/test/APITest4")
	public String APITest4() {

		return "/usr/test/APITest4";
	}

	@RequestMapping("/usr/test/AddFindTest")
	public String AddFindTest() {

		return "/usr/test/AddFindTest";
	}

	@RequestMapping("/usr/test/AddFindTest2")
	public String AddFindTest2() {
		
		return "/usr/test/AddFindTest2";
	}
	
	@RequestMapping("/usr/test/weatherApiTest")
	public String weatherApiTest() {

		return "/usr/test/weatherApiTest";
	}
}