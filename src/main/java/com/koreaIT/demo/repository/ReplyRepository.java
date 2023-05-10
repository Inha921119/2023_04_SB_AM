package com.koreaIT.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.koreaIT.demo.vo.Reply;

@Mapper
public interface ReplyRepository {

	@Select("""
			SELECT R.*, M.nickName AS writerName 
				FROM reply AS R
				INNER JOIN `member` AS M
				ON R.memberId = M.id
				WHERE R.relId = #{relId}
				AND R.relTypeCode = #{relTypeCode}
				ORDER BY R.id;
			""")
	List<Reply> getReplies(int relId, String relTypeCode);

	@Insert("""
			INSERT INTO reply
				SET regDate = NOW(),
					updateDate = NOW(),
					memberId = #{loginedMemberId},
					relTypeCode = #{relTypeCode},
					relId = #{relId},
					`body` = #{body};
			""")
	public void writeReply(int loginedMemberId, int relId, String relTypeCode, String body);
	
	@Select("""
			SELECT *
				FROM reply
				WHERE id = #{id}
			""")
	public Reply getReply(int id);

	@Delete("""
			DELETE FROM reply
				WHERE id = #{id}
			""")
	public void deleteReply(int id);

	@Select("""
			SELECT LAST_INSERT_ID();
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