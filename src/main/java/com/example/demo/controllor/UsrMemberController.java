package com.example.demo.controllor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.vo.LoginContainer;
import com.example.demo.vo.Member;

@Controller
public class UsrMemberController {

	@Autowired
	private MemberService memberService;

	// 액션 메소드
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public Object doLogout(String loginId, String loginPw) {
		
		if(LoginContainer.isLogined == 1) {
			return "로그아웃되었습니다.";
		} else {
			LoginContainer.isLogined = 0;
			return "로그인하고 이용하세요.";
		}
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public Object doLogin(String loginId, String loginPw) {
		
		Member member = memberService.getMemberByLoginId(loginId);
		if(member.getLoginId().equals(loginId) && member.getLoginPw().equals(loginPw)) {
			LoginContainer.isLogined = 1;
			return member.getName() + "님 환영합니다. 로그인 완료";
		} else {
			return "로그인 실패";
		}
	}
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public Object doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		if (loginId == null || loginPw == null || name == null || nickname == null || cellphoneNum == null
				|| email == null) {
			return "빈칸 없이 다시 입력하시오";
		}
		
		Member member = memberService.getMemberByLoginId(loginId);

		if(member == null) {
			int id = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
			member = memberService.getMemberById(id);
			return member;
		} else {
			if (member.getLoginId().equals(loginId)) {
				return loginId + " 해당 아이디는 이미 사용 중입니다.";
		}
		}
		return null;
	}

	@RequestMapping("/usr/member/getMember")
	@ResponseBody
	public Object getMemberByLoginId(String loginId) {
		Member member = memberService.getMemberByLoginId(loginId);

		return member;
	}

}
