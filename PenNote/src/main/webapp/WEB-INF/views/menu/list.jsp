<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --%>


<h1>메뉴 목록</h1>
   <h2><a href="add">메뉴 등록하기</a></h2> 
    
    <!-- 검색창 -->
    
    <form action="list" method="get">
   	 <select name="column">
    	 <option ${column=='메뉴이름'?'selected':''}>메뉴이름</option>
 	  	 <option ${cloumn=='메뉴분류'?'selected':''}>메뉴분류</option>
   	 </select>
    <input type="search" name="keyword" value="${keyword}">
     <button>검색</button>
    </form>

<!--  -->
		<table border="1" width="600">
	<thead>
		<tr>
	<th>메뉴이름</th>
	<th>매뉴종류</th>
	<th>가격</th>
	<th>할인여부</th>
		</tr>
	</thead>
			<tbody align="center">
		<c:forEach var="menuDto" items="${list}">
	<tr>
		<td><a href="detail?menuNo=${menuDto.menuNo}">
		${menuDto.menuName}
		</a></td>
		<td>${menuDto.menuType}</td>
		<td>${menuDto.menuPrice}</td>
		<td>${menuDto.menuType}</td>
		<td>${menuDto.menuEvent}</td>
	</tr>
			</c:forEach>
		</tbody>
	</table>



<%-- <jsp:include page="/WEB-INF/views/template/pagination.jsp"></jsp:include> --%>

<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>
    
    
    