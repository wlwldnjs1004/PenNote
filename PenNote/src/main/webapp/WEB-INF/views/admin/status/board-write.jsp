<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
    <h1>회원 가입 현황</h1>
    
    <table>
    <thead>
    <tr>
    <th>작성기간</th>
    <th>게시글수</th>
    </tr>
    </thead>
    <tbody>
 <c:forEach var="statusVO" items="${list}">
    <tr>
    <td>${statusVO.key}</td>
    <td>${statusVO.value}</td>
    </tr>  
   
</c:forEach>
 </tbody>
   
    </table>
    
    
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
    
    
    
    