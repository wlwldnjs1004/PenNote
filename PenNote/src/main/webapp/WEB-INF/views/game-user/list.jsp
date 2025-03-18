<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<h1>게임 유저 목록</h1>
<!-- 푸터 화면 간격 조정 -->
<head>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        main {
            flex: 1;
            padding-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        footer {
            background-color: #f1f1f1;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<!--  -->
<h2><a href="add">신규 유저 생성하기</a></h2>

<!-- 검색창 -->
<form action="list" method="get">
	<select name="column">
		<option ${column=='아이디' ? 'selected' : ''}>아이디</option>
		<option ${column=='직업' ? 'selected' : ''}>직업</option>
	</select>
	<input type="search" name="keyword" value="${keyword}">
	<button>검색</button>
</form>

<table border="1" width="600">
	<thead>
		<tr>
			<th>유저이미지</th>
			<th>아이디</th>
			<th>직업</th>
			<th>레벨</th>
		    <th>상세보기</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="gameUserDto" items="${list}">
		<tr>
			<td>
			<img src="profile?gameUserNo=${gameUserDto.gameUserNo}" width="50" height="50">
			</td>
			<td>${gameUserDto.gameUserId}</td>
			<td>${gameUserDto.gameUserJob}</td>
			<td>${gameUserDto.gameUserLevel}</td>
		<td>
		<a href="detail?gameUserNo=${gameUserDto.gameUserNo}">상세</a>
		</td>
		</tr>
		</c:forEach>		
	</tbody>
</table>

<jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>


 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
