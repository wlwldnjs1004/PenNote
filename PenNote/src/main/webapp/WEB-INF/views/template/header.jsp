<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	HTML 코드
	- <!Doctype html>은 HTML의 형태를 선언하기 위한 표식
		- 현재 세계 표준은 HTML 5 (10년 다되감)
		- 그전에는 4, 4.1, 3, ... 등이 사용
	- <html> 은 HTML 문서의 범위를 지정
		- <head> 는 이 문서의 정보를 저장 (편지봉투)
			- <meta>는 외부에 노출되는 문서의 정보 및 설정
			- <title>은 브라우저 탭에 표시될 페이지의 제목
		- <body> 는 이 문서의 표시될 내용을 저장 (편지지)
 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈페이지 레이아웃</title>

    <!-- google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- font awesome cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons.css">
<!--     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/test.css"> -->
    <style>
        
    </style>
    
    <!-- moment -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/locale/ko.min.js"></script>
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript">
	$.ajaxSetup({//ajax 초기 설정
		beforeSend:function(xhr, settings){
			if(!settings.url.startsWith("/")){//통신주소가 슬래시로 시작하면
		//context path 계산하여 추가하겠다
			settings.url="${pageContext.request.contextPath}"+settings.url:settings;
			}
		}			
	});
	</script>



    <script src="${pageContext.request.contextPath}/js/checkbox.js"></script>
    <script src="${pageContext.request.contextPath}/js/link-confirm.js"></script>
</head>
<body>
    
    <!-- 화면 영역 -->
    <div class="container w-1200">
        <!-- 헤더 영역 -->
        <div class="flex-box p-10">
            <div class="w-25 left flex-box flex-center">
                <a href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/images/kh.png" width="200">
                </a>
            </div>
            <div class="w-50 center">
                <h1>홈페이지 제작 수업자료</h1>
            </div>
            <div class="w-25 right"></div>
        </div>
        
        <!-- 신규 메뉴 영역 -->
        <div>
        	<ul class="menu">
        		<li>
        		<a href="${pageContext.request.contextPath}/bootstrap">부트스트랩</a>
        		</li>
        		<li>
        			<a>데이터관리</a>
        			<ul>
        				<li><a href="${pageContext.request.contextPath}/pokemon/list">포켓몬스터정보</a></li>
        				<li><a href="${pageContext.request.contextPath}/country/list">국가정보</a></li>
        				<c:if test="${sessionScope.userId != null}">
        				<li><a href="${pageContext.request.contextPath}/game-user/list">게임유저정보</a></li>
        				</c:if>
        			</ul>		
        		</li>
        		
        		<li><a href="${pageContext.request.contextPath}/board/list">게시판</a></li>
        		<c:if test="${sessionScope.userId != null && sessionScope.userLevel != '관리자'}">
        		<li><a href="${pageContext.request.contextPath}/giftcard/list">상품권구매</a></li>
        		</c:if>
        		
        		<!-- 회원 메뉴는 우측에 -->
        		<c:if test="${sessionScope.userId == null}">
        		<li class="menu-end">
        			<a href="${pageContext.request.contextPath}/member/login">로그인</a>
        			<ul>
        				<li><a href="${pageContext.request.contextPath}/member/join">회원가입</a></li>
        			</ul>
        		</li>
        		</c:if>
        		
        		<c:if test="${sessionScope.userId != null}">
        		<li class="menu-end">
        			<a href="${pageContext.request.contextPath}/member/mypage">${sessionScope.userId}</a>
        			<ul>
	        			<c:if test="${sessionScope.userLevel == '관리자'}">
    	    			<li><a href="${pageContext.request.contextPath}/admin/home">관리자메뉴</a></li>
        				</c:if>
        				<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
        			</ul>
        		</li>
        		</c:if>
        		
        	</ul>
        	
        </div>
        
        <!-- 컨텐츠 영역 -->
        <div class="flex-box">
            <div class="w-200 p-10">
                
			<c:choose>
				<c:when test="${sessionScope.userId != null}">
					<!-- 회원일 경우 -->
	                <div class="cell center">
	                    <img src="https://placehold.co/100x100">
	                </div>
	                <div class="cell center">
	                    <i class="fa-solid fa-user"></i>
	                    ${sessionScope.userId} 님
	                </div>
	                <div class="cell center">
	                    <a href="${pageContext.request.contextPath}/member/mypage">내 정보 보기</a>
	                </div>
				</c:when>
				<c:otherwise>
					<!-- 비회원일 경우 -->
	                <div class="cell center">
	                    <a href="${pageContext.request.contextPath}/member/login">로그인</a> 하세요
	                </div>
				</c:otherwise>
			</c:choose>
                
                

                

            </div>
            <div class="flex-fill p-10" style="min-height: 400px;">

 
	
	
	
	