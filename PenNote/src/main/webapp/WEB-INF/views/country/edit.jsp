<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>


    
    <!-- 수정에서 primary key를 전달하기 위헤 input[type=hidden]사용 -->
   <form action="edit" method="post" enctype="multipart/form-data">
 <input type="hidden" name="countryNo" value="${countryDto.countryNo}">
 <div class="container w-300 mt-30">
                <div class="cell center">
                    <h1>국가 정보 수정</h1>
                </div>
         <div class="cell">
            <label>국가이름</label>
            <input type="text" name="countryName" class="field w-100" required>
            </div>
        <div class="cell">
            <label>수도명</label>
            <input type="text" name="countryCapital" class="field w-100" required>
        </div>
        <div class="cell">
            <label>인구수</label>
            <input type="number" name="countryPopulation" class="field w-100" required>
        </div>
        <div class="cell">
            <label>이미지 등록</label>
        <input type="file" name="attach" accept=".png, .jpg" multiple class="field w-100">
        </div>
        <div class="cell mt-30">
            <button type="submit" class="btn btn-positive w-100">수정하기</button>
        </div>
     </div>
   </form> 
    
    <!-- readonly -->
    
     <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    