<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


<h1>유저 정보 수정</h1>
    
    <!-- 수정에서 primary key를 전달하기 위헤 input[type=hidden]사용 -->
   <form action="edit" method="post" enctype="multipart/form-data">
     <input type="hidden" name="gameUserNo" value="${gameUserDto.gameUserNo}">
     <div class="container w-300">
            <div class="cell center">
                <h1>유저 정보 등록(운영자)</h1>
            </div>
          
            <div class="cell">
                <label>유저 아이디</label>
            <input class="field w-100" name="gameUserId" type="text" value="${gameUserDto.gameUserId}">
            </div>
            <div class="cell">
                <label>직업</label>
                <select name="gameUserJob" class="field w-100" required>
                    <option value="${gameUserDto.gameUserJob}">${gameUserDto.gameUserJob}</option>
                    <option>성직자</option>
                    <option>도적</option>
                    <option>전사</option>
                </select>
               
            </div>
            <div class="cell">
                <label>래밸</label>
                <input class="field w-100" name="gameUserLevel" type="number" value="${gameUserDto.gameUserLevel}" required>
            </div>
            <div class="cell">
                <label>골드</label>
                <input class="field w-100" name="gameUserMoney" type="number" value="${gameUserDto.gameUserMoney}" required>
            </div>
            <div class="cell">
                <label>프로필 등록</label>
                <input class="field w-100" name="attach" type="file" accept=".png,.jpg" multiple >
            </div>
            <div class="cell">
                <button class="btn btn-positive w-100" type="submit"  class="field w-100" >등록하기</button>
            </div>

        </div>  
   </form> 
    
    <!-- readonly -->
    
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    