package com.koreaIT.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.repository.ReplyRepository;
import com.koreaIT.demo.vo.Reply;
import com.koreaIT.demo.vo.ResultData;

@Service
public class ReplyService {
	
	private ReplyRepository replyRepository;

	@Autowired
	public ReplyService(ReplyRepository replyRepository) {
		this.replyRepository = replyRepository;
	}

	public List<Reply> getReplies(int relId, String relTypeCode) {
		return replyRepository.getReplies(relId, relTypeCode);
	}
	
	public Reply getReply(int loginedMemberId, int relId, String relTypeCode) {
		return replyRepository.getReply(loginedMemberId, relId, relTypeCode);
	}

	public ResultData<Integer> writeReply(int loginedMemberId, int relId, String relTypeCode, String body) {
		replyRepository.writeReply(loginedMemberId, relId, relTypeCode, body);		
		
		int id = replyRepository.getLastInsertId();
		
		return ResultData.from("S-1", "댓글 작성이 완료되었습니다.", "id", id);
	}
	
}