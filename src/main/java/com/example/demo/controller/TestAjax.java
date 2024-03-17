package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestAjax {

	@RequestMapping("/usr/test/plus")
	public String showTestPage() {
		return "/usr/test/AjaxTest";
	}

	@RequestMapping("/usr/test/doPlus")
	@ResponseBody
	public String doPlus(int num1, int num2) {
		String msg = "더하기 성공!";

		int rs = num1 + num2;
		return rs + "/" + msg + "/S-1";
	}

	@RequestMapping("/usr/test/doPlusJson")
	@ResponseBody
	public Map doPlusJson(int num1, int num2) {
		Map rs = new HashMap<String, Object>();

		rs.put("rs", num1 + num2);
		rs.put("msg", "더하기 성공");
		rs.put("code", "S-1");

		return rs;
	}

	@RequestMapping("/usr/test/input")
	public String showInputPage() {
		return "/usr/test/AjaxTest";
	}
}