package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

@Controller
public class UsrArticleController {

	@Autowired
	private ArticleService articleService;

	// 액션 메소드
	@RequestMapping("/usr/article/getArticles")
	@ResponseBody
	public ResultData getArticles() {
		return ResultData.from("S-1", "게시글 목록입니다.", articleService.getArticles());
	}

	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public ResultData getArticleAction(int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시물은 존재하지 않습니다.", id));
		}
		return ResultData.from("S-1", Ut.f("%d번 게시물입니다.", id), article);
	}

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData doModify(int id, String title, String body) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 글은 없습니다.", id));
		}

		articleService.modifyArticle(id, title, body);
		return ResultData.from("S-1", Ut.f("%d번 게시글입니다.", id), article);
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData doDelete(int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 글은 없습니다.", id));
		}

		articleService.deleteArticle(id);
		return ResultData.from("S-1", Ut.f("%d번 글은 삭제되었습니다.", id));
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public ResultData doWrite(String title, String body) {
		int id = articleService.writeArticle(title, body);
		Article article = articleService.getArticle(id);
		return ResultData.from("S-1", Ut.f("%d번 글이 등록되었습니다.", id), article);
	}

}
