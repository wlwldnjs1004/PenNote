<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

     <h1>[${lectureDto.lectureName}] 강좌 정보</h1>
    
    
    <table border="1" width="300">
     <tr>
      <th width="30%">번호</th>
      <td>${lectureDto.lectureNo}</td>
     
     </tr>
     <tr>
      <th>강좌이름</th>
      <td>${lectureDto.lectureName}</td>
     
     </tr>
     <tr>
      <th>강좌분류</th>
      <td>${lectureDto.lectureCategory}</td>
     
     </tr>
    </tr>
     <tr>
      <th>강좌 수강 인원</th>
      <td>${lectureDto.lecturePeriod}</td>
     
     </tr>
       </tr>
     <tr>
      <th>가격</th>
      <td>${lectureDto.lecturePrice}</td>
     
     </tr>
        </tr>
     <tr>
      <th>방식</th>
      <td>${lectureDto.lectureType}</td>
     
     </tr>
    </table>
        <h2><a href="list">유저 목록</a></h2>
    <h2><a href="add">신규 등록</a></h2>
    <h2><a href="edit?lectureNo=${lectureDto.lectureNo}">수정하기</a></h2>
    <h2><a href="delete?lectureNo=${lectureDto.lectureNo}">삭제하기</a></h2>
    
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    