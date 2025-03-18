<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

   <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
     <h1>[${gameUserDto.gameUserId}] 유저 정보</h1>
    <img src="profile?gameUserNo=${gameUserDto.gameUserNo}" width="250" height="250">
    
    <table border="1" width="300">
     <tr>
      <th width="30%">번호</th>
      <td>${gameUserDto.gameUserNo}</td>
     
     </tr>
     <tr>
      <th>이름</th>
      <td>${gameUserDto.gameUserId}</td>
     
     </tr>
     <tr>
      <th>직업</th>
      <td>${gameUserDto.gameUserJob}</td>
     
     </tr>
     <tr>
      <th>래밸</th>
      <td>${gameUserDto.gameUserLevel}</td>
     
     </tr>
    
    </table>
        <h2><a href="list">유저 목록</a></h2>
    <h2><a href="add">신규 등록</a></h2>
    <h2><a href="edit?gameUserNo=${gameUserDto.gameUserNo}">수정하기</a></h2>
    <h2><a href="delete?gameUserNo=${gameUserDto.gameUserNo}">삭제하기</a></h2>
    <h2>
    <a href="levelup?gameUserNo=${gameUserDto.gameUserNo}">
    래밸업
    </a>
    </h2>
 
 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
    