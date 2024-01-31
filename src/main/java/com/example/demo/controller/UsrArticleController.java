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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrArticleController {

	@Autowired
	private ArticleService articleService;

	// 액션 메소드
	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public ResultData<Article> getArticleAction(Integer id) { //null 체크하려고 Integer로 바꿨다.

		//그냥 getArticle 들어오는 경우 체크
		if (id == null) {
			return ResultData.from("F-1", "게시글 번호를 입력하세요");
		}

		Article article = articleService.getArticle(id);
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시물은 존재하지 않습니다.", id));
		}
		return ResultData.from("S-1", Ut.f("%d번 게시물입니다.", id), "article",article);
	}

	@RequestMapping("/usr/article/getArticles")
	@ResponseBody
	public ResultData<List<Article>> getArticles() {
		List<Article> articles = articleService.getArticles();
		return ResultData.from("S-1", "게시글 목록입니다.", "List<Article>",articles);
	}

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData<Integer> doModify(int id, String title, String body, HttpSession httpSession) {
		// 로그인 상태 체크
		boolean isLogined = false;
		int loginedMemberId = 0;

		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
		}
		if (!isLogined) {
			return ResultData.from("F-A", "로그인하고 이용하세요");
		}

		Article article = articleService.getArticle(id); // 해당 게시글 가져오기

		// 게시글 존재여부 체크
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 글은 없습니다.", id), "id", id);
		}

		// 로그인 중인 아이디인지 확인(서비스에 요청)
		ResultData loginedMemberCanModifyRd = articleService.loginedMemberCanModifyRd(loginedMemberId, article);

		// 글 수정 작업
		articleService.modifyArticle(id, title, body);
		return ResultData.from(loginedMemberCanModifyRd.getResultCode(), loginedMemberCanModifyRd.getMsg(), "id", id);
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData<Integer> doDelete(int id, HttpSession httpSession) {
		// 로그인 상태 체크
		boolean isLogined = false;
		int loginedMemberId = 0;

		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
		}
		if (!isLogined) {
			return ResultData.from("F-A", "로그인하고 이용하세요");
		}

		// 게시글 존재여부 체크
		Article article = articleService.getArticle(id);
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 글은 없습니다.", id), "id", id);
		}

		// 로그인 중인 아이디인지 확인
		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 권한이 없습니다", id),"id", id);
		}

		// 글 삭제 작업
		articleService.deleteArticle(id);
		return ResultData.from("S-1", Ut.f("%d번 글은 삭제되었습니다.", id), "id", id);
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public ResultData<Article> doWrite(String title, String body, HttpSession httpSession) {
		// 로그인 상태 체크
		boolean isLogined = false;
		int loginedMemberId = 0;

		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId");
		}
		if (!isLogined) {
			return ResultData.from("F-A", "로그인하고 이용하세요");
		}

		// 제목 내용 빈 칸 확인
		if (Ut.isNullOrEmpty(title)) {
			return ResultData.from("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return ResultData.from("F-2", "내용을 입력해주세요");
		}

		// 게시글 작성 작업
		ResultData<Integer> writeArticleRd = articleService.writeArticle(title, body, loginedMemberId);

		int id = (int) writeArticleRd.getData1();

		// 결과 출력 시 해당 article도 나오게
		Article article = articleService.getArticle(id);
		return ResultData.newData(writeArticleRd, "article", article);
	}

}
