package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrNewsController {

	@RequestMapping("/usr/news/news")
	public String showNews(Model model) {

		return "usr/news/news";

	}

}