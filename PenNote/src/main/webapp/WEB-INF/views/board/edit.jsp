<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- summernote cdn -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet">
<style>
	.note-editor {
		border: 1px solid #636e72 !important;
	}
	.note-editable {
	    background-color: white !important;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
<script src="/js/summernote-custom.js"></script>

<h1>게시글 수정</h1>

<form action="edit" method="post" class="form-check">
	<input type="hidden" name="boardNo" value="${boardDto.boardNo}">

	제목 <input type="text" name="boardTitle" value="${boardDto.boardTitle}"> <br><br>
	내용 <br>

	<textarea name="boardContent" rows="10" cols="60" required>${boardDto.boardContent}</textarea>
	<br><br>
	<button>수정하기</button>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>