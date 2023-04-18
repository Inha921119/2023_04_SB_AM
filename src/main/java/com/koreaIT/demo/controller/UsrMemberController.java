package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Member;

@Controller
public class UsrMemberController {
	
	private MemberService memberService;
	
	@Autowired
	public UsrMemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	// 액션 메서드
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public Object doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		
		if (Util.empty(loginId)) { 
			return "아이디를 입력해주세요";
		}
		if (Util.empty(loginPw)) { 
			return "비밀번호를 입력해주세요";
		}
		if (Util.empty(name)) { 
			return "이름을 입력해주세요";
		}
		if (Util.empty(nickname)) { 
			return "닉네임을 입력해주세요";
		}
		if (Util.empty(cellphoneNum)) { 
			return "전화번호를 입력해주세요";
		}
		if (Util.empty(email)) { 
			return "이메일을 입력해주세요";
		}
		
		int id = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
		
		if (id == -1) {
			return "이미 사용중인 아이디입니다.";
		}
		
		if (id == -2) {
			return "이미 사용중인 닉네임입니다.";
		}
		
		if (id == -3) {
			return "이미 가입한 회원입니다.";
		}
		
		return memberService.getMemberById(id);
	}
	
	@RequestMapping("/usr/member/getMember")
	@ResponseBody
	public Object getMember(int id) {
		
		Member member = memberService.getMemberById(id);
		
		if(member == null) {
			return id + "번 회원은 존재하지 않습니다.";
		}
		
		return member;
	}
}