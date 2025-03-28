<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container">

	<form action="add" method="Post" class="p-3  rounded"
	enctype="multipart/form-data">
		<div class="row">
			<div class="col">
				<label>작품명</label>
			</div>
		</div>



		<div class="row mt-4">
			<div class="col-sm-12">
				<input name="workName" type="text" class="form-control" placeholder="작품명을 입력하세요">
			</div>
		</div>

		<div class="row">
			<div class="col">
				<label>작품표지</label>
			</div>
		</div>



		<div class="row mt-4">
			<div class="col-sm-12">
		<input type="file" name="attach" class="form-control w-100" accept=".png, .jpg">
			</div>
		</div>



		<div class="row">
			<div class="col">
				<label>아이디?</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<input name="workId" type="text" class="form-control" placeholder="작품명을 입력하세요">
			</div>
		</div>

		<div class="row">
			<div class="col">
				<label>태그</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<input name="workPrefer" type="text" class="form-control" placeholder="작품명을 입력하세요">
			</div>
		</div>


		<div class="row mt-5">
			<div class="col">
				<label>작품 부가설명</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<textarea  name="workSubtotal" class="form-control" placeholder="작품명을 입력하세요"
					rows="6" cols="7"></textarea>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col">
				<label>유료여부?</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<select class="form-select" name="workPaid">
					<option value="N">유료</option>
					<option value="Y">무료</option>
				</select>
			</div>
		</div>



		<div class="row mt-5">
			<div class="col">
				<label>독점 여부</label>
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12 mb-3">
				<select class="form-select" name="workContract">
					<option value="독점">독점</option>
					<option value="비독점">비독점</option>
				</select>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col text-end">
				<button type="submit" class="btn btn-primary w-25 btn-lg">등록</button>
			</div>
		</div>

	</form>
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>