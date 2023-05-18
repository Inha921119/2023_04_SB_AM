<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="APITest" />
<%@ include file="../common/head.jsp" %>

<script>
	const API_KEY = 'nqa6eG1KYIbhMXoXLQHLgg9G6LQdcQNHE30RCV76%2BG61GgXPy7gFWD8TtNVjDO94eZfxERRs9S%2F0CWiCbJLl2A%3D%3D';
	
	async function getData() {
		const url = 'http://apis.data.go.kr/1790387/covid19CurrentStatusKorea/covid19CurrentStatusKoreaJason?serviceKey=' + API_KEY;
		
		const response = await fetch(url);
		const data = await response.json();
		
		console.log(data);
		
		$('.API-content').html(data.response.result[0].cnt_hospitalizations)
	}
	
	getData();
</script>

<div class="container mx-auto">
	<div>APITest입니다</div>
	<div class="API-content"></div>
</div>