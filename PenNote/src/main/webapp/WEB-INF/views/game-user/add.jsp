<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 



<form action="add" method="post" enctype="multipart/form-data">
  <div class="container w-300">
            <div class="cell center">
                <h1>유저 정보 등록</h1>
            </div>
            <div class="cell fight">
            <a href="list" class="btn btn-neutral">유저목록</a>
            </div>
            <div class="cell">
                <label>유저 아이디</label>
            <input class="field w-100" name="gameUserId" type="text">
            </div>
            <div class="cell">
                <label>직업</label>
                <select name="gameUserJob" class="field w-100" required>
                    <option value="">선택하세요</option>
                    <option>성직자</option>
                    <option>도적</option>
                    <option>전사</option>
                </select>
               <c:if test="${sessionScope.userLevel == '관리자'}">
            </div>
            <div class="cell">
                <label>래밸</label>
                <input class="field w-100" name="gameUserLevel" type="number" required>
            </div>
            <div class="cell">
                <label>골드</label>
                <input class="field w-100" name="gameUserMoney" type="number" required>
            </div>
            </c:if>
            <div class="cell">
            
                <label>프로필 등록</label>
                <input class="field w-100" name="attach" type="file" accept=".png, .jpg" multiple>
            	
            </div>
            <div class="cell">
                <button class="btn btn-positive w-100" type="submit"  class="field w-100" >등록하기</button>
            </div>
        </div> 
          
</form>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>