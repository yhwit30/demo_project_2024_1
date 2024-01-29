package com.example.demo.controllor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.vo.Article;

@Controller
public class UsrArticleController {
	
	@Autowired
	private ArticleService articleService;
	

	// 액션 메소드
	@RequestMapping("/usr/home/getArticle")
	@ResponseBody
	public Object getArticleAction(int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return id + "번 글은 없습니다.";
		}
		return article;
	}
	
	@RequestMapping("/usr/home/doModify")
	@ResponseBody
	public Object doModify(int id, String title, String body) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return id + "번 글은 없습니다.";
		}

		article = articleService.modifyArticle(id, title, body);
		return article;
	}

	@RequestMapping("/usr/home/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return id + "번 글은 없습니다.";
		}

		articleService.deleteArticle(id);
		return id + "번 글이 삭제되었습니다.";
	}

	@RequestMapping("/usr/home/doAdd")
	@ResponseBody
	public Article doAdd(String title, String body) {
		Article article = articleService.writeArticle(title, body);
		return article;
	}

	@RequestMapping("/usr/home/getArticles")
	@ResponseBody
	public List<Article> getArticles() {
		return articleService.articles;
	}

}
