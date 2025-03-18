<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div class="container w-600">
	<div class="cell center">
		<h1>${search == true ? '국가 검색 ' : '국가 목록' }</h1>
	</div>
	<div class="cell right">
		<a href="add" class="btn btn-neutral">+ 신규 국가 등록</a>
	</div>
	
	<!-- 검색창 - /country/list?column=국가명&keyword=한국 -->
	<div class="cell center">
		<form action="list" method="get">
			<select name="column" class="field">
				<option ${column == '국가명' ? 'selected' : '' }>국가명</option>
				<option ${column == '수도명' ? 'selected' : ''}>수도명</option>
			</select>
			<input type="text" name="keyword" value="${keyword}" required class="field">
			<button class="btn btn-positive">검색</button>
		</form>
	</div>
	
	<!-- 테이블 -->
	<div class="cell">
		<table class="table table-border table-stripe">
			<thead>
				<tr>
					<th>번호</th>
					<th>국가</th>
					<th>수도</th>
					<th>인구</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:choose>
					<c:when test="${list.isEmpty()}">
						<tr>
							<td colspan="4">데이터가 존재하지 않습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="countryDto" items="${list}">
						<tr>
							<td>${countryDto.countryNo}</td>
							<td>
								<img src="flag?countryNo=${countryDto.countryNo}" width="20" height="15">
							
		<!-- 						<a href="/country/detail?countryNo=xxx"></a> -->
								<a href="detail?countryNo=${countryDto.countryNo}">
									${countryDto.countryName}
								</a>
							</td>
							<td>${countryDto.countryCapital}</td>
							<td align="right">
								<fmt:formatNumber pattern="#,##0" 
									value="${countryDto.countryPopulation}"></fmt:formatNumber>
							</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>