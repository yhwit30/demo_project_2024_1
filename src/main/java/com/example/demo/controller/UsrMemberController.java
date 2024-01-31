package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {

	@Autowired
	private MemberService memberService;

	// 액션 메소드
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public ResultData doLogout(String loginId, String loginPw, HttpSession httpSession) {

		// 로그인 상태 체크
		if (httpSession.getAttribute("loginedMember") == null) {
			return ResultData.from("F-1", "로그인하고 이용하세요.");
		}

		// 세션에 로그인 정보 없애기
		httpSession.removeAttribute("loginedMember");
		return ResultData.from("S-1", "로그아웃되었습니다");

	}

	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public ResultData doLogin(String loginId, String loginPw, HttpSession httpSession) {

		boolean isLogined = httpSession.getAttribute("loginedMember") != null;

		// 로그인 상태 체크
		if (isLogined) {
			return ResultData.from("F-9", "이미 로그인 상태입니다.");
		}

		// 빈칸 체크
		if (Ut.isEmpty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해주세요.");
		}
		if (Ut.isEmpty(loginPw)) {
			return ResultData.from("F-2", "비밀번호를 입력해주세요.");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (Ut.isEmpty(member)) {
			return ResultData.from("F-7", Ut.f("그런 아이디(%s)는 없습니다", loginId));
		}
		if (member.getLoginPw().equals(loginPw) == false) {
			return ResultData.from("F-10", "비밀번호가 틀렸습니다.");
		}

		httpSession.setAttribute("loginedMemberId", member.getId());

		return ResultData.from("S-1", Ut.f("%s님 환영합니다", member.getNickname()));
	}

	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public ResultData<Member> doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {
		if (Ut.isNullOrEmpty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return ResultData.from("F-2", "비밀번호를 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(name)) {
			return ResultData.from("F-3", "이름을 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return ResultData.from("F-4", "닉네임을 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(cellphoneNum)) {
			return ResultData.from("F-5", "전화번호를 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(email)) {
			return ResultData.from("F-6", "이메일을 입력해주세요.");
		}

		ResultData<Integer> joinRd = memberService.join(loginId, loginPw, name, nickname, cellphoneNum, email);

		if (joinRd.isFail()) {
			return (ResultData) joinRd;
		}

		// 회원가입 성공 시 member 데이터 보여주기 위해서
		Member member = memberService.getMember(joinRd.getData1());

		return ResultData.newData(joinRd, member);
	}
}