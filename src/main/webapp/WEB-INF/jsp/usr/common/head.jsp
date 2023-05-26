<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html data-theme="light">
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<!-- 파비콘 불러오기 -->
<link rel="shortcut icon" href="/resource/images/favicon.ico" />
<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css" rel="stylesheet" type="text/css" />
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>

<script>
	function Theme_toggle() {
		const theme = localStorage.getItem("theme") ?? "light";
		
		if (theme == 'light') {
			localStorage.setItem("theme", "dark");
		} else {
			localStorage.setItem("theme", "light");
		}
		
		location.reload();
	}
	
	function Theme_applyTo(themeName) {
		$('html').attr('data-theme', themeName);
	}
	
	function Theme_init() {
		const theme = localStorage.getItem("theme") ?? "light";
		Theme_applyTo(theme);
	}
	
	Theme_init();
	
</script>

</head>
<body>
	<div class="navbar bg-base-100">
	<div class="flex-1">
		<a href="/" class="btn btn-ghost normal-case text-xl">로고</a>
		</div>
		<div class="flex-none">
		<ul class="menu menu-horizontal px-1">
			<li>
				<a class="h-full px-3 theme-toggle flex items-center" href="javascript:Theme_toggle();">
					<span><i class="fa-regular fa-sun"></i></span>
					<span><i class="fa-solid fa-sun"></i></span>
				</a>
			</li>
			<li><a class="h-full px-3 flex items-center btn btn-ghost normal-case text-xl" href="/"><span>HOME</span></a></li>
			<li><a class="h-full px-3 flex items-center btn btn-ghost normal-case text-xl" href="/usr/article/list?boardId=1"><span>NOTICE</span></a></li>
			<li><a class="h-full px-3 flex items-center btn btn-ghost normal-case text-xl" href="/usr/article/list?boardId=2"><span>FREE</span></a></li>
			<c:if test="${rq.getLoginedMemberId() == 0 }">
				<li><a class="h-full px-3 flex items-center btn btn btn-ghost normal-case text-xl" href="/usr/member/login"><span>LOGIN</span></a></li>
				<li><a class="h-full px-3 flex items-center btn btn btn-ghost normal-case text-xl" href="/usr/member/join"><span>JOIN</span></a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != 0  }">
				<li><a class="h-full px-3 flex items-center btn btn-ghost normal-case text-xl" href="/usr/member/myPage?id=${rq.getLoginedMemberId()}"><span>MYPAGE</span></a></li>
				<li><a class="h-full px-3 flex items-center btn btn-ghost normal-case text-xl" href="/usr/member/doLogout"><span>LOGOUT</span></a></li>
			</c:if>
			<li><a class="h-full px-3 flex items-center btn btn-ghost normal-case text-xl" href="/usr/home/APITest"><span>API1</span></a></li>
			<li><a class="h-full px-3 flex items-center btn btn-ghost normal-case text-xl" href="/usr/home/APITest2"><span>API2</span></a></li>
		</ul>
		</div>
	</div>
	
	<section class="my-3 text-2xl">
		<div class="container mx-auto px-3">
			<h1>${pageTitle }&nbsp;</h1>
		</div>
	</section>