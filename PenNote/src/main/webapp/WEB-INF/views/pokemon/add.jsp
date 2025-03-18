<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- head가 없으므로 상단에 배치 -->
<script type="text/javascript">
function checkPokemonName() {
    var tag = document.querySelector("[name=pokemonName]");

    var regex = /^[가-힣]{1,10}$/;
    var isValid = regex.test(tag.value);

    tag.classList.remove("success", "fail");
    tag.classList.add(isValid ? "success" : "fail");
    
    return isValid;
}
function checkPokemonType() {
    var tag = document.querySelector("[name=pokemonType]");

    //var regex = /^.+$/;
    var isValid = tag.value.length > 0;

    tag.classList.remove("success", "fail");
    tag.classList.add(isValid ? "success" : "fail");

    return isValid;
}

//폼 검사 함수 - 기존 입력창 검사를 재활용
function checkForm() {
    var nameValid = checkPokemonName();
    var typeValid = checkPokemonType();
    return nameValid && typeValid;
}
</script>


<!-- <form action="/pokemon/add2"> -->
<!-- <form action="add" method="post"> -->
<form action="add" method="post" enctype="multipart/form-data" 
onsubmit="return checkForm();">
	
	<div class="container w-500">
        <div class="cell center">
            <h1>포켓몬 등록</h1>
        </div>
        
        <div class="cell">
            <label>포켓몬 이름</label>
            <input type="text" name="pokemonName" class="field w-100"
                    placeholder="(ex) 피카츄" onblur="checkPokemonName();">
            <div class="success-feedback">올바른 이름입니다</div>
            <div class="fail-feedback">이름은 한글로만 작성해야 합니다</div>
        </div>

        <div class="cell">
            <label>포켓몬 속성</label>
            <select name="pokemonType" class="field w-100"
                                                oninput="checkPokemonType();">
                <option value="">선택하세요</option>
                <option>불</option>
                <option>물</option>
                <option>땅</option>
                <option>바람</option>
                <option>전기</option>
                <option>곤충</option>
                <option>독</option>
                <option>무속성</option>
            </select>
            <div class="fail-feedback">속성은 반드시 선택해야 합니다</div>
        </div>

        <div class="cell">
            <label>포켓몬 이미지</label>
            <input type="file" name="attach" class="field w-100" accept=".png, .jpg">
        </div>

        <div class="cell mt-30">
            <button type="submit" class="btn btn-positive w-100">
                <i class="fa-solid fa-plus"></i>
                등록하기
            </button>
        </div>

    </div>    
	
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>