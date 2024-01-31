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

import jakarta.servlet.http.HttpSession;

@Controller
public class UsrArticleController {

	@Autowired
	private ArticleService articleService;

	// 액션 메소드
	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public ResultData<Article> getArticleAction(int id) {
		Article article = articleService.getArticle(id);
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시물은 존재하지 않습니다.", id));
		}
		return ResultData.from("S-1", Ut.f("%d번 게시물입니다.", id), article);
	}

	@RequestMapping("/usr/article/getArticles")
	@ResponseBody
	public ResultData<List<Article>> getArticles() {
		List<Article> articles = articleService.getArticles();
		return ResultData.from("S-1", "게시글 목록입니다.", articles);
	}

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData<Integer> doModify(int id, String title, String body, HttpSession httpSession) {
		// 로그인 상태 체크
		boolean isLogined = false;

		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}
		if (!isLogined) {
			return ResultData.from("F-A", "로그인하고 이용하세요");
		}
		
		Article article = articleService.getArticle(id); //해당 게시글 가져오기
		
		// 게시글 존재여부 체크
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 글은 없습니다.", id), id);
		}

		// 로그인 중인 아이디인지 확인
		int loginedMemberId = (int) httpSession.getAttribute("loginedMemberId"); // 현재 로그인 중인 번호
		
		if(article.getMemberId() != loginedMemberId	) {
			return ResultData.from("F-B", "해당 게시글에 권한 없음");
		}

		// 글 수정 작업
		articleService.modifyArticle(id, title, body);
		return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다.", id), id);
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData<Integer> doDelete(int id, HttpSession httpSession) {
		// 로그인 상태 체크
		boolean isLogined = false;

		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}
		if (!isLogined) {
			return ResultData.from("F-A", "로그인하고 이용하세요");
		}

		// 게시글 존재여부 체크
		Article article = articleService.getArticle(id);
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 글은 없습니다.", id), id);
		}

		// 로그인 중인 아이디인지 확인
		int loginedMemberId = (int) httpSession.getAttribute("loginedMemberId"); // 현재 로그인 중인 번호
		
		if(article.getMemberId() != loginedMemberId	) {
			return ResultData.from("F-B", "해당 게시글에 권한 없음");
		}
		
		// 글 삭제 작업
		articleService.deleteArticle(id);
		return ResultData.from("S-1", Ut.f("%d번 글은 삭제되었습니다.", id), id);
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public ResultData<Article> doWrite(String title, String body, HttpSession httpSession) {
		// 로그인 상태 체크
		boolean isLogined = false;

		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
		}
		if (!isLogined) {
			return ResultData.from("F-A", "로그인하고 이용하세요");
		}

		// 제목 내용 작성
		if (Ut.isNullOrEmpty(title)) {
			return ResultData.from("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return ResultData.from("F-2", "내용을 입력해주세요");
		}

		int loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");

		ResultData<Integer> writeArticleRd = articleService.writeArticle(title, body, loginedMemberId);

		int id = (int) writeArticleRd.getData1();

		// 결과 출력 시 해당 article도 나오게
		Article article = articleService.getArticle(id);

		return ResultData.newData(writeArticleRd, article);
	}

}
