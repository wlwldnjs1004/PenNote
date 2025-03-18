<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --%>

     <h1>[${menuDto.menuNo}]메뉴 정보</h1>
    
    
    <table border="1" width="300">
     <tr>
      <th width="30%">번호</th>
      <td>${menuDto.menuNo}</td>
     
     </tr>
     <tr>
      <th>이름</th>
      <td>${menuDto.menuName}</td>
     
     </tr>
     <tr>
      <th>종류</th>
      <td>${menuDto.menuType}</td>
     
     </tr>
    </tr>
     <tr>
      <th>가격</th>
      <td>${menuDto.menuPrice}</td>
     
     </tr>
    
    </table>
        <h2><a href="list">메뉴 목록</a></h2>
    <h2><a href="add">신규 등록</a></h2>
    <h2><a href="#">수정하기</a></h2>
    <h2><a href="delete?menuNo=${menuDto.menuNo}">삭제하기</a></h2>
    
<%--     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>
    
    