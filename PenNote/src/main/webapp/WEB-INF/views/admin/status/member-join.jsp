<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
    <h1>월별 게시글 근황</h1>
    
    <table>
    <thead>
    <tr>
    <th>기간</th>
    <th>가입자수</th>
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
    
    
    
    
    