<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>회원별 현황</h1>

<table >
<thead>
<tr>
<th>등급</th>
<th>회원수</th>
</tr>
</thead>
<tbody align="center">



 <c:forEach var="statusVO" items="${list}">

<tr>
<td>${statusVO.key}</td>
<td>${statusVO.value}</td>
</tr>
</c:forEach>
</tbody>

</table>