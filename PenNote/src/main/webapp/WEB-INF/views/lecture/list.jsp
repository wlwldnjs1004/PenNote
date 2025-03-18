<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<h1>강좌 목록</h1>
   <h2><a href="add">신규 강좌 개설하기</a></h2> 
    
    <!-- 검색창 -->
    
    <form action="list" method="get">
   	 <select name="column">
    	 <option ${column=='강좌명'?'selected':''}>강좌명</option>
 	  	 <option ${cloumn=='강좌분류'?'selected':''}>강좌분류</option>
   	 </select>
    <input type="search" name="keyword" value="${keyword}">
     <button>검색</button>
    </form>

<!--  -->
		<table border="1" width="600">
	<thead>
		<tr>
	<th>강좌이름</th>
	<th>강좌분류</th>
	<th>듣는숫자</th>
	<th>강의가격</th>
	<th>강의방식</th>
		</tr>
	</thead>
			<tbody align="center">
		<c:forEach var="lectureDto" items="${list}">
	<tr>
		<td>${lectureDto.lectureName}</td>
		<td>${lectureDto.lectureCategory}</td>
		<td>${lectureDto.lecturePeriod}</td>
		<td>${lectureDto.lecturePrice}</td>
		<td>${lectureDto.lectureType}</td>
	</tr>
			</c:forEach>
		</tbody>
	</table>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


    
    