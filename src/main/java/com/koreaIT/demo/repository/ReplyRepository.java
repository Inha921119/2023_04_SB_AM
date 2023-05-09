package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.koreaIT.demo.vo.Reply;

@Mapper
public interface ReplyRepository {

	@Select("""
			SELECT *
				FROM `comment`
				WHERE relId = #{relId}
				AND relTypeCode = #{relTypeCode}
			""")
	List<Reply> getReplys(int relId, String relTypeCode);
	
	@Select("""
			SELECT *
				FROM `comment`
				WHERE memberId = #{loginedMemberId}
				AND relId = #{relId}
				AND relTypeCode = #{relTypeCode}
			""")
	Reply getReply(int loginedMemberId, int relId, String relTypeCode);

	@Insert("""
			INSERT INTO `comment`
				SET regDate = NOW(),
					updateDate = NOW(),
					memberId = #{loginedMemberId},
					relTypeCode = #{relTypeCode},
					relId = #{relId},
					`body` = #{body}
			""")
	public void writeReply(int loginedMemberId, int relId, String relTypeCode, String body);

	@Select("""
			SELECT LAST_INSERT_ID()
			""")
	public int getLastInsertId();
	
//	@Delete("""
//			DELETE FROM reactionPoint
//				WHERE memberId = #{loginedMemberId}
//				AND relTypeCode = #{relTypeCode}
//				AND relId = #{relId};
//			""")
//	void doDeleteReactionPoint(int loginedMemberId, int relId, String relTypeCode);
//	
}