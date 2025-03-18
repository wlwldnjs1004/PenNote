<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>



<h1>자유게시판</h1>

<p>
	글은 자신의 인격입니다.<br>무문별한 비방 글은 삭제될 수 있습니다
</p>

<h2>
	<a href="write">게시판 등록</a>
</h2>


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


<table border="1" width="800">
	<thead>
		<tr>
			<th width="20">번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>좋아요</th>
			<th>조회수</th>
			<th>댓글수</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:choose>
			<c:when test="${list.isEmpty()}">
				<tr height="150">
					<td colspan="6" align="center">등록된 게시글이 없습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="boardDto" items="${list}">
					<tr>
						<td>${boardDto.boardNo}</td>
						<td align="left"><a href="detail?boardNo=${boardDto.boardNo}">
								<!-- 게시글 제목 --> ${boardDto.boardTitle} <!-- 댓글 표시 --> <c:if
									test="${boardDto.boardReply > 0}">
					[${boardDto.boardReply}]
					</c:if>

						</a></td>
						<td>${boardDto.boardWriter}</td>
						<td>${boardDto.boardWtimeString}</td>

						<td>${boardDto.boardLike}</td>
						<td>${boardDto.boardRead}</td>
						<td>${boardDto.boardReply}</td>
					</tr>
				</c:forEach>
		</c:otherwise>
		</c:choose>
	</tbody>
</table>

<!-- 페이지 네비게이터 -->
<h3>

<!-- 이전 : startBlock > 1 일 경우 출력 -->
<c:if test="${startBlock > 1}">
	<c:choose>
		<c:when test="${search == true}">
			<a href="list?column=${column}&keyword=${keyword}&page=${startBlock-1}&size=${size}">&lt;</a>
		</c:when>
		<c:otherwise>
			<a href="list?page=${startBlock-1}&size=${size}">&lt;</a>	
		</c:otherwise>
	</c:choose>
</c:if>
 
<!-- 숫자 -->
<%-- for(int i=1; i <= 10; i++) {} --%>
<c:forEach var="i" begin="${startBlock}" end="${finishBlock}" step="1">
	<c:choose>
		<c:when test="${search == true}">
			<a href="list?column=${column}&keyword=${keyword}&page=${i}&size=${size}">${i}(검색)</a> 
		</c:when>
		<c:otherwise>
			<a href="list?page=${i}&size=${size}">${i}(목록)</a>
		</c:otherwise>
	</c:choose>
</c:forEach>

<!-- 다음 : finishBlock < pageCount 일 경우 출력 -->
<c:if test="${finishBlock < pageCount}">
	<c:choose>
		<c:when test="${search == true}">
			<a href="list?column=${column}&keyword=${keyword}&page=${finishBlock+1}&size=${size}">&gt;</a>
		</c:when>
		<c:otherwise>
			<a href="list?page=${finishBlock+1}&size=${size}">&gt;</a>	
		</c:otherwise>
	</c:choose>
</c:if>

</h3>

<!-- 검색창 -->
<form action="list" method="get">
	<select name="column">
		<option value="board_title" ${param.column == 'board_title' ? 'selected' : ''}>제목</option>
		<option value="board_writer" ${param.column == 'board_writer' ? 'selected' : ''}>작성자</option>
	</select>
	<input type="text" name="keyword" value="${param.keyword}">
	<button>검색</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>