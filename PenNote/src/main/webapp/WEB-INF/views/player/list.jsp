<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<h1>선수 목록</h1>
<h2><a href="add">선수 등록</a></h2>

<!-- 검색창 -->
<form action="list" method="get">
	<select name="column">
		<option ${column=='선수명' ? 'selected' : ''}>선수명</option>
		<option ${column=='종목' ? 'selected' : ''}>종목</option>
	</select>
	<input type="search" name="keyword" value="${keyword}">
	<button>검색</button>
</form>

<table border="1" width="600">
	<thead>
		<tr>
			<th>선수명</th>
			<th>종목</th>
			<th>분류</th>
		 	<th>금매달</th>
			<th>은매달</th>
			<th>동매달</th>
			<th>상세보기</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="playerDto" items="${list}">
		<tr>
			<td>${playerDto.playerName}</td>
			<td>${playerDto.playerEvent}</td>
			<td>${playerDto.playerType}</td>
			<td>${playerDto.playerGoldMedal}</td>
			<td>${playerDto.playerSilverMedal}</td>
			<td>${playerDto.playerBronzeMedal}</td>
		<td>
		<a href="detail?playerNo=${playerDto.playerNo}">상세</a>
		</td>
		</tr>
		</c:forEach>		
	</tbody>
</table>
 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
   
    