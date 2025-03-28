<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<%-- <h1>로그인 페이지</h1>
<form action="login" method="post">
   *아이디<input type="text" name="memberId" required ><br><br>
   *비밀번호<input type="password" name="memberPw" required ><br><br>         
	
<button >로그인하기</button>
</form>
<c:if test="${param.error !=null}">
<h2 style="color:red">로그인 정보가 일치하지 않습니다</h2>
</c:if> --%>
<!-- if(error라는 파라미터가 있으면 -->
 
   
    
  <form action="login" method="post">
<div class="container w-400">
	<div class="cell center">
		<h1>로그인</h1>
	</div>
	<div class="cell">
		<label>아이디</label>
		 <input type="text" name="memberId"  class="field w-100"
		 value="${cookie.saveId.value}">
	</div>
	<div class="cell">
		<label>비밀번호</label>
		<input type="password" name="memberPw"  class="field w-100">
	</div>
<div>
        <label>
        <input type="checkbox"  name="remember" 
        ${cookie.saveId !=null ?'checked':''}>
        <span>아이디 저장</span>
        </label>
</div>       
	<div class="cell mt-20">
		<button type="submit" class="btn btn-positive w-100">로그인하기</button>
	</div>
   <div class=" cell mt-20 conter">
	<a href="findPw">비밀번호가 기억나지 않습니다</a>
    </div>
	<!-- if(error라는 파라미터가 있으면) { -->
	<c:if test="${param.error != null}">
	<div class="cell center">
		<h2 class="red">로그인 정보가 일치하지 않습니다</h2>
	</div>
	</c:if>
</div>

</form>

 <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>