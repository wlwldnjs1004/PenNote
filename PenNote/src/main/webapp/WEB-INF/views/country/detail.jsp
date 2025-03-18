<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
 <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

 
   <h1>[${countryDto.countryName}] 국가 정보</h1>
    <img src="image?countryNo=${countryDto.countryNo}" width="50" height="50">
    
    <table border="1" width="300">
     <tr>
      <th width="32%">번호</th>
      <td>${countryDto.countryNo}</td>
     
     </tr>
     <tr>
      <th>이름</th>
      <td>
      ${countryDto.countryName}
      </td>
     
     </tr>
     <tr>
      <th>수도</th>
      <td>${countryDto.countryCapital}</td>
     
     </tr>
    </tr>
     <tr>
      <th>인구수</th>
      	<td>
      	<fmt:formatNumber pattern="#,##0" 
							value="${countryDto.countryPopulation}"></fmt:formatNumber>
     </td>
     </tr>
    
    </table>
        <h2><a href="list">국가 목록</a></h2>
    <h2><a href="add">신규 등록</a></h2>
    <h2><a href="edit?countryNo=${countryDto.countryNo}">수정하기</a></h2>
    <h2><a href="delete?countryNo=${countryDto.countryNo}">삭제하기</a></h2>
    
    
 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>



