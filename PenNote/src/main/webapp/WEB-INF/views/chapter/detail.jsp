<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>

<div class="container">

	<form action="add" method="Post" class="p-3  rounded">
		<div class="row mt-4">
			<div class="col-sm-12">
				<input type="text" name="chapterTitle" class="form-control"
					placeholder="소제목을 입력해주세요. (최대 60자 까지 입력가능)">
			</div>
		</div>
		<div class="row mt-4">
			<div class="col-sm-12">
				<textarea type="text" name="chapterDetail" class="form-control"
					placeholder="내용입력" rows="13"></textarea>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col">
				<button class="btn btn-primary" type="submit">보내기</button>
			</div>
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>