<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Write" />
<%@ include file="../common/head.jsp" %>

<script>
	function ToastEditor__init() {
	  $('.toast-ui-editor').each(function(index, node) {
	    const $node = $(node);
	    const $initialValueEl = $node.find(' > script');
	    const initialValue = $initialValueEl.length == 0 ? '' : $initialValueEl.html().trim();

	    const editor = new toastui.Editor({
	      el: node,
	      initialValue: initialValue,
	      height:'600px',
	      plugins: []
	    });

	    $node.data('data-toast-editor', editor);
	  });
	}
	function ToastEditorView__init() {
	  $('.toast-ui-viewer').each(function(index, node) {
	    const $node = $(node);
	    const $initialValueEl = $node.find(' > script');
	    const initialValue = $initialValueEl.length == 0 ? '' : $initialValueEl.html().trim();
	    $node.empty();

	    var viewer = new toastui.Editor.factory({
	      el: node,
	      initialValue: initialValue,
	      viewer:true,
	      plugins: []
	    });

	    $node.data('data-toast-editor', viewer);
	  });
	}

	$(function() {
	  ToastEditor__init();
	  ToastEditorView__init();
	});
	
	function submitForm(form){
		  form.title.value = form.title.value.trim();
		  
		  if(form.title.value.length == 0){
		    alert('제목을 입력해주세요');
		    form.title.focus();
		    return;
		  }
		  
		  const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
		  const html = editor.getHTML().trim();
		  
		  if(html.length == 0){
		    alert('내용을 입력해주세요');
		    editor.focus();
		    return;
		  }
		  
		  form.body.value = html;
		  
		  form.submit();
	}
</script>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doWrite" method="POST" onsubmit="submitForm(this); return false;">
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
								<td><div id="body" class="toast-ui-editor"></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			<div class="btns flex justify-between items-end mt-2">
				<a class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</a>
				<button class="btn btn-outline">작성</button>
			</div>
		</form>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>