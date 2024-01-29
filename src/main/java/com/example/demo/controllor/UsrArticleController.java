package com.example.demo.controllor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.Article;

@Controller
public class UsrArticleController {
	private int lastArticleId;
	private List<Article> articles;

	public UsrArticleController() {
		lastArticleId = 0;
		articles = new ArrayList<>();
		makeTestData();
	}

	// 서비스 메소드
	private void makeTestData() {
		for (int i = 1; i <= 10; i++) {
			String title = "제목" + i;
			String body = "내용" + i;

			writeArticle(title, body);
		}
	}

	private Article writeArticle(String title, String body) {
		int id = lastArticleId + 1;
		Article article = new Article(id, title, body);
		articles.add(article);
		lastArticleId++;

		return article;
	}

	private Article getArticle(int id) {
		for (Article article : articles) {
			if (article.getId() == id) {
				return article;
			}
		}
		return null;
	}

	private void deleteArticle(int id) {
		Article article = getArticle(id);
		articles.remove(article);
	}

	private Article modifyArticle(int id, String title, String body) {
		Article article = getArticle(id);
		article.setTitle(title);
		article.setBody(body);

		return article;
	}

	// 액션 메소드
	@RequestMapping("/usr/home/getArticle")
	@ResponseBody
	public Object getArticleAction(int id) {
		Article article = getArticle(id);

		if (article == null) {
			return id + "번 글은 없습니다.";
		}
		return article;
	}
	
	@RequestMapping("/usr/home/doModify")
	@ResponseBody
	public Object doModify(int id, String title, String body) {
		Article article = getArticle(id);

		if (article == null) {
			return id + "번 글은 없습니다.";
		}

		article = modifyArticle(id, title, body);
		return article;
	}

	@RequestMapping("/usr/home/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		Article article = getArticle(id);

		if (article == null) {
			return id + "번 글은 없습니다.";
		}

		deleteArticle(id);
		return id + "번 글이 삭제되었습니다.";
	}

	@RequestMapping("/usr/home/doAdd")
	@ResponseBody
	public Article doAdd(String title, String body) {
		Article article = writeArticle(title, body);
		return article;
	}

	@RequestMapping("/usr/home/getArticles")
	@ResponseBody
	public List<Article> getArticles() {
		return articles;
	}

}
