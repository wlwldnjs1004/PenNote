<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

   
    <h1>[${phoneDto.phoneName}]휴대폰 정보</h1>
    
    
    <table border="1" width="300">
     <tr>
      <th width="30%">번호</th>
      <td>${phoneDto.phoneNo}</td>
     
     </tr>
     <tr>
      <th>이름</th>
      <td>${phoneDto.phoneName}</td>
     
     </tr>
     <tr>
      <th>통신사</th>
      <td>${phoneDto.phoneTelecom}</td>
     
     </tr>
      <tr>
      <th>가격</th>
      <td>${phoneDto.phonePrice}</td>
     
     </tr>
      <tr>
      <th>약정게월</th>
      <td>${phoneDto.phoneContract}</td>
     
     </tr>
    </table>
        <h2><a href="list">휴대폰 목록</a></h2>
    <h2><a href="add">신규 등록</a></h2>
    <h2><a href="#">수정하기</a></h2>
    <h2><a href="delete=phoneNo=${phoneDto.phoneNo}">삭제하기</a></h2>
    
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>