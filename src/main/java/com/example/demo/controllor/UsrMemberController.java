package com.example.demo.controllor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.vo.Member;

@Controller
public class UsrMemberController {

	@Autowired
	private MemberService memberService;

	// 액션 메소드
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public Object doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		if (loginId == null || loginPw == null || name == null || nickname == null || cellphoneNum == null
				|| email == null) {
			return "다시 입력하시오";
		}

		if (memberService.getMemberByLoginId(loginId).getLoginId().equals(loginId)) {
			return "해당 아이디는 이미 사용 중입니다.";
		}
		;

		int id = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);

		Member member = memberService.getMemberById(id);
		return member;
	}

	@RequestMapping("/usr/member/getMember")
	@ResponseBody
	public Object getMemberByLoginId(String loginId) {
		Member member = memberService.getMemberByLoginId(loginId);

		return member;
	}

}
