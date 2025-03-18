<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<h1>휴대폰 등록</h1>

<form action="add" method="post">
휴대폰이름<input name="phoneName"><br><br>
휴대폰통신사<input name="phoneTelecom"><br><br>
휴대폰가격<input name="phonePrice"><br><br>
휴대폰약정기간<input name="phoneContract"><br><br>
<button>휴대폰 등록 완료</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
