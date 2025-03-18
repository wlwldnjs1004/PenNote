<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> --%>

<h1>메뉴 등록</h1>
<form action="add" method="post">
메뉴이름<input name="menuName"><br><br>
메뉴분류<input name="menuType"><br><br>
메뉴가격<input name="menuPrice"><br><br>
할인여부<input name="menuEvent"><br><br>
<button>메뉴 정보 등록</button>
</form>

<h2><a href="list">메뉴 목록</a></h2>


<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>

