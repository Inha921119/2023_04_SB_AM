package com.koreaIT.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.ReplyService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrReplyController {

	private ReplyService replyService;
	private Rq rq;

	@Autowired
	public UsrReplyController(ReplyService replyService, Rq rq) {
		this.replyService = replyService;
		this.rq = rq;
	}
	
	@RequestMapping("/usr/reply/doWrite")
	@ResponseBody
	public String doWrite(int relId, String relTypeCode, String body) {
		
		ResultData<Integer> replyWriteRd = replyService.writeReply(rq.getLoginedMemberId(), relId, relTypeCode, body);
		
		return Util.jsReplace(replyWriteRd.getMsg(), Util.f("../article/detail?id=%d", relId));
	}
	
	@RequestMapping("/usr/reply/doDelete")
	@ResponseBody
	public String doDelete(int relId, int id) {
		
		ResultData<Integer> replyDeleteRd = replyService.deleteReply(rq.getLoginedMemberId(), relId, id);
		
		return Util.jsReplace(replyDeleteRd.getMsg(), Util.f("../article/detail?id=%d", relId));
	}
}