<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


    <h1>[${pokemonDto.pokemonName}] 몬스터 정보</h1>
  
<img src="image?pokemonNo=${pokemonDto.pokemonNo}" width="300">
    
    <table border="1" width="300">
     <tr>
      <th width="30%">번호</th>
      <td>${pokemonDto.pokemonNo}</td>
     
     </tr>
     <tr>
      <th>이름</th>
      <td>${pokemonDto.pokemonName}</td>
     
     </tr>
     <tr>
      <th>속성</th>
      <td>${pokemonDto.pokemonType}</td>
     
     </tr>
    
    </table>
        <h2><a href="list">포켓몬 목록</a></h2>
    <h2><a href="add">신규 등록</a></h2>
    <h2><a href="edit?pokemonNo=${pokemonDto.pokemonNo}">수정하기</a></h2>
    <h2><a href="delete?pokemonNo=${pokemonDto.pokemonNo}">삭제하기</a></h2>
    <br><br>
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    