<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-header.jsp"></jsp:include>


<div class="row mt-4">
	<div class="col">
		<div class="table-responsive text-nowrap">
			<table class="table table-bordered border-dark">
				<thead class="text-center">
				</thead>
				<tbody class="text-center">

						<tr>
					<c:forEach var="chapterDto" items="${list}">
							<td>${chapterDto.chapterNo}</td>
							<td>${chapterDto.chapterTitle}</td>
							<td>${chapterDto.chapterModified}</td>
					</c:forEach>
						</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/bootstrap/bootstrap-footer.jsp"></jsp:include>