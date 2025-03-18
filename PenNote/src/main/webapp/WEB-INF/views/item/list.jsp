<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- 푸터 화면 간격 조정 -->
<head>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        main {
            flex: 1;
            padding-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        footer {
            background-color: #f1f1f1;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>

<h1>아이템 목록</h1>
   <h2><a href="add">신규 아이템 등록하기</a></h2> 
    
    <!-- 검색창 -->
    
    <form action="list" method="get">
   	 <select name="column">
    	 <option ${column=='상품이름'?'selected':''}>상품이름</option>
 	  	 <option ${cloumn=='상품종류'?'selected':''}>상품종류</option>
   	 </select>
    <input type="search" name="keyword" value="${keyword}">
     <button>검색</button>
    </form>

<!--  -->
		<table border="1" width="600">
	<thead>
		<tr>
	<th>상품이름</th>
	<th>상품분류</th>
	<th>상품가격</th>
	<th>할인률</th>
	<th>상품갯수</th>
		</tr>
	</thead>
			<tbody align="center">
		<c:forEach var="itemDto" items="${list}">
	<tr>
		<td><a href="edit?itemNo=${itemDto.itemNo}">
		${itemDto.itemName}
		</a></td>
		<td>${itemDto.itemType}</td>
		<td>${itemDto.itemPrice}</td>
		<td>${itemDto.itemDiscountRate}</td>
		<td>${itemDto.itemQty}</td>
	</tr>
			</c:forEach>
		</tbody>
	</table>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
    
    
    