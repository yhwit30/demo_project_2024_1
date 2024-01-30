package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.vo.Member;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public int doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);

		return memberRepository.getLastInsertId();

	}
	public Member getMemberByLoginId(String loginId) {
		Member member = memberRepository.getMemberByLoginId(loginId);
		return member;
	}

	public Member getMemberById(int id) {
		Member member = memberRepository.getMemberById(id);
		return member;
	}

}
