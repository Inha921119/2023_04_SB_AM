<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Write" />
<%@ include file="../common/head.jsp" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doWrite" method="POST">
				<div class="table-box-type-1">
					<table>
						<colgroup>
							<col width="200" />
						</colgroup>
						<tbody>
							<tr>
								<th>게시판</th>
								<td>
									<label>
										<input type='radio' name='boardId' value='1' />
										공지사항
									</label>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label>
										<input type='radio' name='boardId' value='2' checked />
										자유 게시판
									</label>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" placeholder="제목을 입력해주세요"/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="body" placeholder="내용을 입력해주세요"></textarea></td>
							</tr>
							<tr>
								<td colspan="2"><button class="btn btn-outline">작성</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<div class="btns">
				<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>