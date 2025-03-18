<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<h1>휴대폰 목록</h1>
   <h2><a href="add">휴대폰 등록하기</a></h2> 
    
    <!-- 검색창 -->
    
    <form action="list" method="get">
   	 <select name="column">
    	 <option ${column=='기종'?'selected':''}>기종</option>
 	  	 <option ${cloumn=='통신사'?'selected':''}>통신사</option>
   	 </select>
    <input type="search" name="keyword" value="${keyword}">
     <button>검색</button>
    </form>

<!--  -->
		<table border="1" width="600">
	<thead>
		<tr>
	<th>휴대폰이름</th>
	<th>통신사분류</th>
	<th>휴대폰가격</th>
	<th>약정개월</th>
		</tr>
	</thead>
			<tbody align="center">
		<c:forEach var="phoneDto" items="${list}">
	<tr>
		<td>${phoneDto.phoneName}</td>
		<td>${phoneDto.phoneTelecom}</td>
		<td>${phoneDto.phonePrice}</td>
		<td>${phoneDto.phoneContract}</td>
		<td></td>
	</tr>
			</c:forEach>
		</tbody>
	</table>


<jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
    
    