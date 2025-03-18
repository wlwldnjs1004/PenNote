<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


    
    <!-- 수정에서 primary key를 전달하기 위헤 input[type=hidden]사용 -->
   <form action="edit" method="post" enctype="multipart/form-data">
  <input type="hidden" name="pokemonNo" value="${pokemonDto.pokemonNo}">
 <div class="container w-300 mt-30">
        <div class="cell center">
            <h1>포켓몬 정보수정</h1>
        </div>
        <div class="cell">  
            <label>포켓몬 이름</label>
            <input type="text" name="pokemonName" class="field w-100" required  value="${pokemonDto.pokemonName}">
        </div>
        <div class="cell">
            <label>포켓몬 속성</label>
            <select name="pokemonType" required class="field w-100">
            <option value="">${pokemonDto.pokemonType}</option>
            <option>불</option>
            <option>바람</option>
            <option>전기</option>
            <option>물</option>
            <option>독</option>
            <option>땅</option>
            <option>무속성</option>
            <option>곤충</option>    
        </select>
        </div>
        <div class="cell">
            <label>이미지 등록</label>
            <input type="file" class="field w-100" name="attach" accept=".png,.jpg" multiple>
        	<small>* 미설정 시 현 상태가 유지됩니다</small> 	
        </div>
        <div class="cell">
            <button type="submit" class="btn btn-positive w-100">수정하기</button>         
        </div>
       
    </div>
   </form> 
    <!-- readonly -->
    
    
    
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    