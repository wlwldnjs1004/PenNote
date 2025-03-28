<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container">

	<div class="row">
		<div class="col">
			<label>작품명</label>
		</div>
	</div>
	<div class="row">
		<div class="col">${workDto.workNo}</div>
	</div>
	<div class="row mt-4">
		<div class="col-sm-12">${workDto.workName}</div>
	</div>

	<div class="row">
		<div class="col">
			<label>작품표지</label>
		</div>
	</div>



	<div class="row mt-4">
		<div class="col-sm-12">
			<img src="image?workNo=${workDto.workNo}" width="300">
		</div>
	</div>



	<div class="row">
		<div class="col">
			<label>아이디?</label>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-sm-12">

		</div>
	</div>

	<div class="row">
		<div class="col">
			<label>태그</label>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-sm-12">
			<input name="workPrefer" type="text" class="form-control"
				placeholder="작품명을 입력하세요">
		</div>
	</div>


	<div class="row mt-5">
		<div class="col">
			<label>작품 부가설명</label>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-sm-12"></div>
	</div>

	<div class="row mt-5">
		<div class="col">
			<label>유료여부?</label>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-sm-12"></div>
	</div>



	<div class="row mt-5">
		<div class="col"></div>
	</div>
	<div class="row mt-4">
		<div class="col-sm-12 mb-3"></div>
	</div>

	<div class="row mt-5">
		<div class="col text-end">
			<button type="submit" class="btn btn-primary w-25 btn-lg">등록</button>
		</div>
	</div>

</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>