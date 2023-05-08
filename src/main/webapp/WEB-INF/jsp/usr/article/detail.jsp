<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Detail" />
<%@ include file="../common/head.jsp" %>

	<script>
		function getReactionPoint() {
			
			$.get('../reactionPoint/getReactionPoint', {
				relId : ${article.id},
				relTypeCode : 'article'
			}, function(data){
				
				console.log(data);
				
			}, 'json');
			
		}
		
		$(function() {
			getReactionPoint();
		})
		
	</script>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<div class="table-box-type-1">
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>
					<tbody>
						<tr>
							<th>번호</th>
							<td>${article.id }</td>
						</tr>
						<tr>
							<th>작성날짜</th>
							<td>${article.regDate }</td>
						</tr>
						<tr>
							<th>수정날짜</th>
							<td>${article.updateDate }</td>
						</tr>
						<tr>
							<th>조회수</th>
							<td><span id="articleDetail_increaseHitCount">${article.hitCount }</span></td>
						</tr>
							
						<tr></tr>
						<tr>
							<th>추천</th>
							<td>
								<span>${article.sumReactionPoint }개</span>
							</td>
						</tr>
						
						<tr>
							<th>작성자</th>
							<td>${article.writerName }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${article.title }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${article.body }</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="btns flex justify-between items-end">
				<div class="mt-1">
					<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
					<c:if test="${article.actorCanChangeData }">
						<a class="btn btn-outline" href="modify?id=${article.id }">수정</a>
						<a class="btn btn-outline" href="doDelete?id=${article.id }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
					</c:if>
				</div>
				<div class="mt-1">
					<c:if test="${rq.getLoginedMemberId() != 0 }">
						<button class="btn btn-outline" onclick="">👍 ${article.goodReactionPoint }</button>
						<button class="btn btn-outline">👎 ${article.badReactionPoint * -1 }</button>
					</c:if>
				</div>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>