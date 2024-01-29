package com.example.demo.controllor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;

@Controller
public class UsrHomeController {

	private int count = 0;
	private List<Article> articles;
	private int lastId = 0;

	public UsrHomeController() {
		count = 0;
		articles = new ArrayList<>();
	}




	@RequestMapping("/usr/home/getBoolean")
	@ResponseBody
	public boolean getBoolean() {
		return false;
	}

	@RequestMapping("/usr/home/getInt")
	@ResponseBody
	public int getInt() {
		return 12;
	}

	@RequestMapping("/usr/home/getString")
	@ResponseBody
	public String getString() {
		return "string data";
	}

	@RequestMapping("/usr/home/getDouble")
	@ResponseBody
	public double getDouble() {
		return 3.14;
	}

	@RequestMapping("/usr/home/getMap")
	@ResponseBody
	public Map<String, Object> getMap() {
		Map<String, Object> map = new HashMap<>();
		map.put("first", new Article());
		map.put("second", 12);
		return map;
	}

	@RequestMapping("/usr/home/getArticle")
	@ResponseBody
	public Article getArticle() {
		return new Article(1, "giving automatic?! constructor", "amazing~");
	}

	@RequestMapping("/usr/home/getList")
	@ResponseBody
	public List<String> getList() {
		List<String> list = new ArrayList<>();
		list.add("list data1");
		list.add("list data2");
		return list;
	}

	@RequestMapping("/usr/home/setCount")
	@ResponseBody
	public String setCount(int count) {
		this.count = count;
		return "count의 값이" + count + "(으)로 초기화되었습니다.";
	}

	@RequestMapping("/usr/home/getCount")
	@ResponseBody
	public int getCount() {
		return count++;
	}

	@RequestMapping("/usr/home/main")
	@ResponseBody
	public String showMain() {
		return "Don Quixote";
	}

}
