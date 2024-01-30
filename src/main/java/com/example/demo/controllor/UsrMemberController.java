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
	public String doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);

		return "가입!";
	}

	@RequestMapping("/usr/member/getMember")
	@ResponseBody
	public Object getMember(String loginId) {
		Member member = memberService.getMember(loginId);

		return member;
	}

}
