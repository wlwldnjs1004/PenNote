<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



     <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>상품권 목록</h1>

<h2><a href="add">+신규 등록</a></h2>


<table width="500">
	<c:forEach var="giftcardDto" items="${list}">
	<tr>
		<th width="30%">
			<img src="image?giftcardNo=${giftcardDto.giftcardNo}"
						width="80%">
		</th>
		<td>
			<h2>${giftcardDto.giftcardName}</h2>
			<h3>
				${giftcardDto.giftcardCharge} 포인트 
				(
					${giftcardDto.giftcardPrice} 원, 
					${giftcardDto.discountRate}% 할인
				)
			</h3>
			<pre>${giftcardDto.giftcardContent}</pre>
		</td>
	</tr>
	</c:forEach>
</table>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>