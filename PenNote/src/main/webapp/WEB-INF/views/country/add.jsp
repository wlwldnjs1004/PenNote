<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
 
<!--자바스크립트 작성 공간-->
<script type="text/javascript">
    function checkCountryName(){
        var input=document.querySelector("[name=countryName]");
        var regex=/^[가-힣]{1,15}$/;

        var isValid=regex.test(input.value);
        
        // var text=input.value;
        // var count=text.length;

        input.classList.remove("success","fail","fail2");
        input.classList.add(isValid?"success":"fail");
      
        return isValid;
    }
    function checkCountryCapital(){
        
        var input=document.querySelector("[name=countryCapital]");

        var regex=/^[가-힣]{1,15}$/;

        var isValid=regex.test(input.value);


        input.classList.remove("success","fail","fail2");

        input.classList.add(isValid?"success":"fail"); 

        return isValid;
    }
    function checkCountryPopulation(){
        var tag=document.querySelector("[name=countryPopulation]");
        // var isValid=tag.value.length>=0;
        var isValid=parseInt(tag.value)>0;



        tag.classList.remove("success","fail");
        tag.classList.add(isValid?"success":"fail");
        return isValid;
    }
    function checkForm(){
        var  countryNameValid=checkCountryName();
        var capitalValid=checkCountryCapital();
        var populationValid=checkCountryPopulation();
return countryNameValid&&capitalValid&&populationValid;
    }

    //(추가)입력창을 text로 두는 대신 숫자만 입력 가능하도록 구현
function checkNumberlnput(){
    var tag=document.querySelector("[name=countryPopulation]");

    tag.value=tag.value.replace(/[^0-9]+/g,"");
}   
</script>



<form action="add" method="post" enctype="multipart/form-data"
onsubmit="return checkForm();">
  <div class="container w-300">
               <div class="cell center">
                   <h1>국가등록</h1>
               </div>
        <div class="cell">
           <label>국가이름</label>
           <input type="text" name="countryName" class="field w-100" 
           onblur="checkCountryName();">
          <div class="success-feedback">올바른 형식 입니다</div>
          <div class="fail-feedback">한글로만 작성 가능합니다</div>
          <div class="fail2-feedback">45글자가 넘어가면 안됩니다</div>
           </div>
       <div class="cell">
           <label>수도명</label>
           <input type="text" name="countryCapital" class="field w-100" 
           onblur="checkCountryPopulation();">
           <div class="success-feedback"></div>
           <div class="fail-feedback">한글로만 작성하세요</div>
       </div>
       <div class="cell">
           <label>인구수</label>
           <input type="text" inputmode="numeric" 
           name="countryPopulation" class="field w-100" 
           oninput="checkNumberlnput();"
           onblur="checkCountryPopulation();">
           <div class="success-feedback"></div>
           <div class="fail-feedback">숫자는 0보다 커야 입력 가능합니다</div>
        </div>
       <div class="cell">
           <label>이미지 등록</label>
       <input type="file" name="attach" accept=".png, .jpg" multiple 
       class="field w-100">
       </div>
       <div class="cell mt-30">      
        <button type="submit" class="btn btn-positive w-100">
       <i class="fa-solid fa-plus"></i>
        등록하기</button>
    </div>
    </div>
</form>

        <h2><a href="list">국가 목록</a></h2>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>



