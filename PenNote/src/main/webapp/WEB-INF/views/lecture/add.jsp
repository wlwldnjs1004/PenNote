<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>강좌 정보 등록</h1>

<form action="add" method="post">
강좌 정보<input name="lectureName"><br><br>
강좌 분류<input name="lectureCategory"><br><br>
강좌 참여인원<input name="lecturePeriod"><br><br>
강좌 가격<input name="lecturePrice"><br><br>
강좌 수업분류<input name="lectureType"><br><br>
<button>강좌 등록</button>
</form>
<h1><a href="list.jsp">강좌 목록 보기</a></h1>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


