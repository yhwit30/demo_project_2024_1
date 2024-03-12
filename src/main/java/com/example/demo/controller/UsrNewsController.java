package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrNewsController {

	@RequestMapping("/usr/news/news")
	public String showNews(Model model) {

		UsrCrawlingNews news = new UsrCrawlingNews();
		
		List<String> daumNews = news.daum();
		
		model.addAttribute("daumNews", daumNews);
		return "usr/news/news";

	}

}