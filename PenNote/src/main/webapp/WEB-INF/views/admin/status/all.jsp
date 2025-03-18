<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <!--Chart JS cdn-->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  
   <!-- jQuery cdn-->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  
    <script src="/js/chart.js"></script>
  
     <jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <div class="container w-1000">
        <div class="cell center">
            <h1>차트 현황</h1>
        </div>
        <div class="cell flex-box">
            <div class="w-33">
                <canvas class="pokemon-chart"></canvas>
            </div>
            <div class="w-100">
                <table class="table table-border">
                    <thead class="center">
                        <tr>
                            <th>속성</th>
                            <th>개체수</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="statusVO" items="${list}">
                            <tr>
                    <td>${statusVO.key}</td>
					<td>${statusVO.value}</td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>

            </div>
            <div class="cell flex-box">
                <div class="w-33">
                    <canvas class="game-user-chart"></canvas>
                </div>
                <div class="w-100">
                    <table class="table table-border">
                        <thead class="center">
                            <tr>
                        	<th style="width:350px; max-width:350px;">직업</th>
							<th>이용자수</th>
                            </tr>
                        </thead>
                        <tbody align="center">
                            <c:forEach var="statusVO" items="${gameUser}">
                                <tr>
                              <td>${statusVO.key}</td>
								<td>${statusVO.value}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
    
                    </table>
                </div>
            </div>
            <div class="cell flex-box">
                <div class="w-33">
                    <canvas class="board-write-chart"></canvas>
                </div>
                <div class="w-100">
                    <table class="table table-border">
                        <thead class="center">
                            <tr>
                                <th style="width:350px; max-width:350px;">작성시기</th>
                                <th>게시글수</th>
                            </tr>
                        </thead>
                        <tbody align="center">
                            <c:forEach var="statusVO" items="${boardWrite}">
                                <tr>
                                <td>${statusVO.key}</td>
								<td>${statusVO.value}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
    
                    </table>
                </div>
            </div>
            <div class="cell flex-box">
      <div class="w-33">
                <canvas class="member-join-chart"></canvas>
            </div>
            <div class="w-100">
                <table class="table table-border">
                    <thead class="center">
                        <tr>
                            <th style="width:350px; max-width:350px;">가입기간</th>
                            <th>가입자수</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="statusVO" items="${memberJoin}">
                            <tr>
                            <td>${statusVO.key}</td>
							<td>${statusVO.value}</td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>
            </div>


        <div class="cell flex-box">
            <div class="w-33">
                <canvas class="member-chart"></canvas>
            </div>
            <div class="w-100">
                <table class="table table-border">
                    <thead class="center">
                        <tr>
                            <th style="width:350px; max-width:350px;">회원등급</th>
                            <th>회원숫자</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="statusVO" items="${member}">
                            <tr>
                            <td>${statusVO.key}</td>
							<td>${statusVO.value}</td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>
      
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    
    