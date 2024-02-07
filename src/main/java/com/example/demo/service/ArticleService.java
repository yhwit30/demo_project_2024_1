package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

@Service
public class ArticleService {

	@Autowired
	private ArticleRepository articleRepository;

	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	// 서비스 메서드
	public ResultData<Integer> writeArticle(String title, String body, int loginedMemberId) {
		articleRepository.writeArticle(loginedMemberId, body, title);
		int id = articleRepository.getLastInsertId();
		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}

	public void deleteArticle(int id) {
		articleRepository.deleteArticle(id);
	}

	public void modifyArticle(int id, String title, String body) {
		articleRepository.modifyArticle(id, title, body);
	}

	public Article getArticle(int id) {
		return articleRepository.getArticle(id);
	}

	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}

	// 게시판 번호로 가져오기 및 페이지네이션
	public List<Article> getForPrintArticles(Integer boardId, int itemsInAPage, int page, String searchKeywordTypeCode, String searchKeyword) {
		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;

		return articleRepository.getForPrintArticles(boardId, limitFrom, limitTake, searchKeywordTypeCode, searchKeyword);
	}

	// 게시글 전체 개수 구하기
	public int getArticlesCount(Integer boardId, String searchKeywordTypeCode, String searchKeyword) {
		return articleRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
	}

	// 게시글 가져와서 아이디 권한체크 메소드 실행
	public Article getForPrintArticle(int loginedMemberId, int id) {
		Article article = articleRepository.getForPrintArticle(id);

		controlForPrintArticle(loginedMemberId, article);

		return article;
	}

	// ArticleVO에다가 참,거짓값 심어주기 -> jsp 수정,삭제 버튼 권한체크용
	private void controlForPrintArticle(int loginedMemberId, Article article) {
		if (article == null) {
			return;
		}
		ResultData userCanModifyRd = userCanModify(loginedMemberId, article);
		article.setUserCanModify(userCanModifyRd.isSuccess());

		ResultData userCanDeleteRd = userCanDelete(loginedMemberId, article);
		article.setUserCanDelete(userCanDeleteRd.isSuccess());
	}

	// 가져온 게시글 번호와 로그인 중인 아이디 권한체크
	public ResultData userCanModify(int loginedMemberId, Article article) {

		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 수정 권한이 없습니다", article.getId()));
		}
		return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다", article.getId()));
	}

	public ResultData userCanDelete(int loginedMemberId, Article article) {

		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 삭제 권한이 없습니다", article.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 글이 삭제 되었습니다", article.getId()));
	}

	public void hit(int id) {
		articleRepository.hit(id);
	}

}