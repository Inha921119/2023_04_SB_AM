<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MyPage" />
<%@ include file="../common/head.jsp" %>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3 pb-5 border-bottom-line">
			<div class="table-box-type-1">
				<table>
					<colgroup>
						<col width="200" />
					</colgroup>
					<tbody>
						<tr>
							<th>가입일</th>
							<td>${rq.loginedMember.regDate }</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${rq.loginedMember.loginId }</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${rq.loginedMember.name }</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>${rq.loginedMember.nickname }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${rq.loginedMember.cellphoneNum }</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${rq.loginedMember.email }</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="btns flex justify-between items-end mt-2">
				<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
				<a class="btn btn-outline" href="checkPassword">회원정보수정</a>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>