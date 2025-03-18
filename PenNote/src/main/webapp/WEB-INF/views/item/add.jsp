<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<h1>아이템 등록</h1>
<form action="add" method="post">
상품 이름<input name="itemName"><br><br>
상품 분류<input name="itemType"><br><br>
상품가격<input name="itemPrice"><br><br>
할인률<input name="itemDiscountRate"><br><br>
상품갯수<input name="itemQty"><br><br>
할인여부<input name="itemEarly"><br><br>

<button>아이템 등록</button>
</form>
<hr>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>



