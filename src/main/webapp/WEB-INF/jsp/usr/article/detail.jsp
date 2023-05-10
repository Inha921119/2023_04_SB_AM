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
				if (data.data1.sumReactionPoint > 0) {
					let goodBtn = $('#goodBtn');
					goodBtn.removeClass( 'btn-outline' );
					goodBtn.prop('href', "../reactionPoint/doDeleteReactionPoint?relId=${article.id }&relTypeCode=article&point=1"); 
				} else if (data.data1.sumReactionPoint < 0) {
					let badBtn = $('#badBtn');
					badBtn.removeClass( 'btn-outline' );
					badBtn.prop('href', "../reactionPoint/doDeleteReactionPoint?relId=${article.id }&relTypeCode=article&point=-1"); 
				}
				
			}, 'json');
			
		}
		
		$(function() {
			getReactionPoint();
		})
		
	</script>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3 pb-5 border-bottom-line">
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
							<td>${article.getForPrintBody() }</td>
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
						<a id="goodBtn" class="btn btn-outline" href="../reactionPoint/doInsertReactionPoint?relId=${article.id }&relTypeCode=article&point=1">👍 ${article.goodReactionPoint }</a>
						<a id="badBtn" class="btn btn-outline" href="../reactionPoint/doInsertReactionPoint?relId=${article.id }&relTypeCode=article&point=-1">👎 ${article.badReactionPoint * -1 }</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<script>
		function replyWrite_submitForm(form) {
			form.body.value = form.body.value.trim();
			
			if (form.body.value.length < 2) {
				alert('2글자 이상 입력해주세요');
				form.body.focus();
				return;
			}
			
			form.submit();
		}
	</script>
	
	<section class="mt-5 text-xl">
		<div class="container mx-auto px-3">
			<h2>댓글</h2>
			<c:forEach var="reply" items="${replies }">
				<div class="py-2 pl-16 border-bottom-line text-base">
					<div class="flex justify-between items-end">
						<div class="font-semibold"><span>${reply.writerName }</span></div>
						<c:if test="${reply.actorCanChangeData }">
							<div class="dropdown">
								<button class="btn btn-circle btn-ghost btn-sm mr-8">
									<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block w-5 h-5 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path></svg>
								</button>
								<ul tabindex="0" class="menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-20">
									<li><a>수정</a></li>
									<li><a>삭제</a></li>
								</ul>
							</div>
						</c:if>
					</div>
					<div class="my-1 text-lg pl-2"><span>${reply.getForPrintBody() }</span></div>
					<div class="text-xs text-gray-400"><span>${reply.regDate }</span></div>
				</div>
			</c:forEach>
			<c:if test="${rq.getLoginedMemberId() != 0 }">
				<form action="../reply/doWrite" method="POST" onsubmit="replyWrite_submitForm(this); return false;">
					<input type="hidden" name="relTypeCode" value="article" />
					<input type="hidden" name="relId" value="${article.id }" />
					<div class="mt-4 border border-gray-400 rounded-lg text-base p-4">
						<div class="mb-2"><span>${rq.getLoginedMember().getNickname() }</span></div>
						<textarea class="textarea textarea-bordered w-full" name="body" rows="3" placeholder="내용을 입력해주세요"></textarea>
						<div class="flex justify-end"><button class="btn btn-outline btn-sm">등록</button></div>
					</div>
				</form>
			</c:if>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>