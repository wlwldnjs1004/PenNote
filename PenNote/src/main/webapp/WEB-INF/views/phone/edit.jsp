<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>포켓몬 정보 수정</h1>
    
    <!-- 수정에서 primary key를 전달하기 위헤 input[type=hidden]사용 -->
   <form action="edit" method="post">
<input type="hidden" name="playerNo" value="${playerDto.playerNo}">
   선수이름<input type="text" name="playerName" value="${playerDto.playerName}"><br><br>
   참여 종목<input type="text" name="playerEvent" value="${playerDto.playerEvent}"><br><br> 
   
   
   
   <button>정보 수정</button>
   </form> 
    
    <!-- readonly -->
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
    