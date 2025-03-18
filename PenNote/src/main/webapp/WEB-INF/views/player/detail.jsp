<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

   
    <h1>[${playerDto.playerName}] 선수 정보</h1>
    
    
    <table border="1" width="300">
     <tr>
      <th width="30%">번호</th>
      <td>${playerDto.playerNo}</td>
     
     </tr>
     <tr>
      <th>이름</th>
      <td>${playerDto.playerName}</td>
     
     </tr>
     <tr>
      <th>종목</th>
      <td>${playerDto.playerEvent}</td>
     
     </tr>
    <tr>
      <th>참여한 대회</th>
      <td>${playerDto.playerType}</td>
     
     </tr>
     <tr>
      <th>금매달</th>
      <td>${playerDto.playerGoldMedal}</td>
     
     </tr>
     <tr>
      <th>은메달</th>
      <td>${playerDto.playerSilverMedal}</td>
     
     </tr>
      <tr>
      <th>동메달</th>
      <td>${playerDto.playerBronzeMedal}</td>
     </tr>
    </table>
        <h2><a href="list">선수 목록</a></h2>
    <h2><a href="add">신규 등록</a></h2>
    <h2><a href="edit?playerNo=${playerDto.playerNo}">수정하기</a></h2>
    <h2><a href="delete?playerNo=${playerDto.playerNo}">삭제하기</a></h2>
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>