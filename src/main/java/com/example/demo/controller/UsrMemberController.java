package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;
import com.example.demo.vo.LoginContainer;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Controller
public class UsrMemberController {

	@Autowired
	private MemberService memberService;

	// 액션 메소드
//	@RequestMapping("/usr/member/doLogout")
//	@ResponseBody
//	public ResultData doLogout(String loginId, String loginPw) {
//
//		if (LoginContainer.isLogined == 1) {
//			LoginContainer.isLogined = 0;
//			return "로그아웃되었습니다.";
//		} else {
//			LoginContainer.isLogined = 0;
//			return "로그인하고 이용하세요.";
//		}
//	}
//
//	@RequestMapping("/usr/member/doLogin")
//	@ResponseBody
//	public ResultData doLogin(String loginId, String loginPw) {
//
//		Member member = memberService.getMemberByLoginId(loginId);
//		if (member.getLoginId().equals(loginId) && member.getLoginPw().equals(loginPw)) {
//			LoginContainer.isLogined = 1;
//			return member.getName() + "님 환영합니다. 로그인 완료";
//		} else {
//			return "로그인 실패";
//		}
//	}
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public ResultData doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {
		if (Ut.isNullOrEmpty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(loginPw)) {
			return ResultData.from("F-1", "비밀번호를 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(name)) {
			return ResultData.from("F-1", "이름을 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(nickname)) {
			return ResultData.from("F-1", "닉네임을 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(cellphoneNum)) {
			return ResultData.from("F-1", "전화번호를 입력해주세요.");
		}
		if (Ut.isNullOrEmpty(email)) {
			return ResultData.from("F-1", "이메일을 입력해주세요.");
		}

		int id = memberService.join(loginId, loginPw, name, nickname, cellphoneNum, email);

		if (id == -1) {
			return ResultData.from("F-1", Ut.f("이미 사용중인 아이디(%s)입니다"));
		}

		if (id == -2) {
			return ResultData.from("F-1", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email));
		}

		Member member = memberService.getMember(id);

		return ResultData.from("S-1", Ut.f("%d번 멤버가 등록되었습니다.", id), member);
	}
}