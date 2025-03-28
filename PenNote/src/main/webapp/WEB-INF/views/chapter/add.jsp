<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container">

	<form action="add" method="Post" class="p-3 rounded"
	>
		
		<div class="row">
		<div class="col">
		<input type="text" class="form-control" name="workNo">
		</div>
		</div>
		
		<div class="row mt-4">
			<div class="col-sm-12">
				<input type="text" name="chapterTitle" class="form-control"
					placeholder="소제목을 입력해주세요. (최대 60자 까지 입력가능)">
			</div>
		</div>
		<p class="fs-6">* 글 번호는 자동으로 생성됩니다. 소제목에 회차 번호를 입력하시면 중복 표기될 수
			있습니다.</p>
		<div class="row mt-5">
			<div class="col-sm-12">
				<textarea type="text" name="chapterDetail" class="form-control"
					placeholder="내용입력" rows="11"></textarea>
			</div>
		</div>

		<div class="row mt-4">
			<div class="col-sm-12">
				<textarea type="text" name="chapterComment" class="form-control"
					placeholder="작가의 말을 입력해주세요" rows="6"></textarea>
			</div>
		</div>


		<div class="row mt-5">
			<div class="col text-end">
				<button class="btn btn-primary w-25 btn-lg" type="submit">등록</button>
			</div>
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>