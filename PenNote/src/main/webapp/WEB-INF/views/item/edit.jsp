<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<h1>상품 정보 수정</h1>
    
    <!-- 수정에서 primary key를 전달하기 위헤 input[type=hidden]사용 -->
   <form action="edit" method="post">
   <input type="hidden" name="itemNo" value="${itemDto.itemNo}">
   상품이름<input type="text" name="itemName" value="${itemDto.itemName}"><br><br>
	상품분류 
	<select name="itemJob" required>
		<option ${itemDto.itemType == '식품' ? 'selected' : ''}>식품</option>
		<option ${itemDto.itemType == '잡화' ? 'selected' : ''}>잡화</option>
		<option ${itemDto.itemType == '의류' ? 'selected' : ''}>의류</option>
		<option ${itemDto.itemType == '장난감' ? 'selected' : ''}>장난감</option>
		<option ${itemDto.itemType == '생필품' ? 'selected' : ''}>생필품</option>
		<option ${itemDto.itemType == '스포츠' ? 'selected' : ''}>스포츠</option>
		<option ${itemDto.itemType == '주방' ? 'selected' : ''}>주방</option>
		<option ${itemDto.itemType == '전자제품' ? 'selected' : ''}>전자제품</option>
	</select>	
	<br><br>
   상품가격<input type="number" name="itemPrice" value="${itemDto.itemPrice}" required ><br><br>
   할인률<input type="number" name="itemDiscountRate" value="${itemDto.itemDiscountRate}" required ><br><br>
    상품갯수<input type="number" name="itemQty" value="${itemDto.itemQty}" required ><br><br>
   할인적용여부<input type="text" name="itemEarly" value="${itemDto.itemEarly}" required ><br><br>
   
   <button>정보 수정</button>
   </form> 
    
    
    <!-- 수정에서 primary key를 전달하기 위헤 input[type=hidden]사용 -->
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
    