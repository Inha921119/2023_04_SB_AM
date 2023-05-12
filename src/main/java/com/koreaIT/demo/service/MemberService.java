package com.koreaIT.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.MemberRepository;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Article;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.ResultData;

@Service
public class MemberService {
	
	private MemberRepository memberRepository;
	
	@Autowired
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public ResultData<Integer> doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email) {

		Member existsMember = getMemberByLoginId(loginId);
		
		if (existsMember != null) {
			return ResultData.from("F-7", Util.f("이미 사용중인 아이디(%s) 입니다", loginId));
		}
		
		existsMember = getMemberByNickname(nickname);
		
		if (existsMember != null) {
			return ResultData.from("F-8", Util.f("이미 사용중인 닉네임(%s) 입니다", nickname));
		}
		
		existsMember = getMemberByNameAndEmail(name, email);
		
		if (existsMember != null) {
			return ResultData.from("F-9", Util.f("이미 사용중인 이름(%s)과 이메일(%s) 입니다", name, email));
		}
		
		memberRepository.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);
		
		return ResultData.from("S-1", Util.f("%s회원님이 가입되었습니다", loginId), "id", memberRepository.getLastInsertId());
	}
	
	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	private Member getMemberByNickname(String nickname) {
		return memberRepository.getMemberByNickname(nickname);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}
	
	public ResultData actorCanMD(int loginedMemberId, Member member) {
		if(member == null) {
			return ResultData.from("F-1", "해당 회원은 존재하지 않습니다");
		}
		
		if (loginedMemberId != member.getId()) {
			return ResultData.from("F-B", "해당 회원에 대한 권한이 없습니다");	
		}
		
		return ResultData.from("S-1", "가능");
	}
	
	public void actorCanChangeData(int loginedMemberId, Member member) {
		
		ResultData actorCanChangeDataRd = actorCanMD(loginedMemberId, member);
		
		member.setActorCanChangeData(actorCanChangeDataRd.isSuccess());
		
	}

	public void modifyMember(int loginedMemberId, String nickname, String cellphoneNum, String email) {
		memberRepository.modifyMember(loginedMemberId, nickname, cellphoneNum, email);
	}

	public void doPasswordModify(int loginedMemberId, String loginPw) {
		memberRepository.doPasswordModify(loginedMemberId, loginPw);
	}
	
}