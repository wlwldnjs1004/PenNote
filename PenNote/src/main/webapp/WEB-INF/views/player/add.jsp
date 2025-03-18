<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<h1>선수 등록</h1>
<form action="add" method="post" enctype="multipart/form-data">
선수 이름<input name="playerName"><br><br>
참여 종목<input name="playerEvent"><br><br>
구분    <input name="playerType"><br><br>
금매달  <input name="playerGoldMedal" type="number"><br><br>
은매달  <input name="playerSilverMedal" type="number"><br><br>
동매달  <input name="playerBronzeMedal" type="number"><br><br>
선수 사진 업로드<input type="file"  name="attach" accept=".png, .jpg" multiple><br><br>

<button>선수 등록완료</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>







