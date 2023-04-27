<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="List" />
<%@ include file="../common/head.jsp" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<c:if test="${rq.getLoginedMemberId() != 0 }">
				<div class="mb-2 flex justify-end">
					<a class="btn btn-outline" href="/usr/article/write">WRITE</a>
				</div>
			</c:if>
			<div class="overflow-x-auto">
				<table class="table w-full">
					<thead>
						<tr>
							<th>번호</th>
							<th>날짜</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${articles }">
							<tr class="hover bg-gray-700">
								<td>${article.id }</td>
								<td>${article.regDate.substring(2,16) }</td>
								<td><a href="detail?id=${article.id }">${article.title }</a></td>
								<td>${article.writerName }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>