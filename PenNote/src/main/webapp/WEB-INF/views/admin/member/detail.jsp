<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<h1>${memberDto.memberId} 님의 상세정보</h1>
<h2><a href="list">돌아가기</a></h2>
<table border="1" width="400">
	<tr>
		<th width="25%">아이디</th>
		<td>${memberDto.memberId}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${memberDto.memberNickname}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${memberDto.memberEmail}</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>${memberDto.memberBirth}</td>
	</tr>
	<tr>
		<th>연락처</th>
		<td>${memberDto.memberContact}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			[${memberDto.memberPost}]
			${memberDto.memberAddress1}
			${memberDto.memberAddress2}
		</td>
	</tr>
	<tr>
		<th>등급</th>
		<td>${memberDto.memberLevel}</td>
	</tr>
	<tr>
		<th>포인트</th>
		<td>${memberDto.memberPoint} point</td>
	</tr>
	<tr>
		<th>가입일시</th>
		<td>
			<fmt:formatDate value="${memberDto.memberJoin}" 
										pattern="y년 M월 d일 a h시 m분 s초"/>
		</td>
	</tr>
	<tr>
		<th>최종로그인</th>
		<td>
			<fmt:formatDate value="${memberDto.memberLogin}" 
										pattern="y년 M월 d일 a h시 m분 s초"/>
		</td>
	</tr>
	<tr>
		<th>비밀번호 변경일</th>
		<td>
			<fmt:formatDate value="${memberDto.memberChange}" 
										pattern="y년 M월 d일 a h시 m분 s초"/>
		</td>
	</tr>
</table>
<h2><a href="#">임시 비밀번호 발급</a></h2>
<h2><a href="#">개인정보 변경</a></h2>
<h2><a href="delete?memberId=${memberDto.memberId}">회원 탈퇴</a></h2>
<h2><a href="#">회원 블랙리스트 등록</a></h2>
       
       
       
     
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
    
    