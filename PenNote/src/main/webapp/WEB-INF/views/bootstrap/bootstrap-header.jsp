<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부트스크랩 래이아웃 배우기</title>

    <!--google font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!--font awesome cdn-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.3/litera/bootstrap.min.css"
        integrity="sha512-TUtnNUXMMWp2IALAR9t2z1vuorOUQL4dPWG3J9ANInEj6xu/rz5fzni/faoEGzuqeY1Z1yGD6COYAW72oiDVYA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">

    </script>
    
    </head>

	<body>
	   <nav class="navbar navbar-expand-lg bg-dark fixed-top" data-bs-theme="dark">
        <div class="container-fluid">

            <!--좌측 로고(택스트 또는 이미지) -->

            <!--?? 버튼-->

            <a class="navbar-brand" href="#">KH정보교육원</a>

            <!-- 메뉴 펄침 버튼(폭이 작을 때만 나옴)-->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-menui"
                aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!--실제 매뉴 영역(폭에 따라 보이는 형태가 다름)-->
            <div class="collapse navbar-collapse" id="main-menui">
                <ul class="navbar-nav me-auto">
                  <li class="nav-item">
                        <a class="nav-link" href="/">
                            엣날 홈페이지
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                            aria-haspopup="true" aria-expanded="false">
                            <i class="fa-solid fa-server"></i>
                            데이터 관리
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/pokemon/bootstrap-add">포켓몬스터 등록</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/country/list">국가정보</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/chapter/add">작가정보</a>
                           <c:if test="${sessionScope.userId !=null}">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/game-user/list">게임유저정보</a>
                           </c:if>
                            <!-- <div class="dropdown-divider"></div> -->

                        </div>S
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fa-solid  fa-list-ul"></i>
                            게시판
                        </a>
                    </li>
                    <c:if test="${sessionScope.userId !=null && sessionScope.userLevel !='관리자'}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">
                            <i class="fa-solid fa-money-check-dollar"></i>
                            상품권 구매</a>
                    </li>
                    </c:if>
                </ul>
                <!--우측 메뉴-->
                <c:choose>
                <c:when test="${sessionScope.userId !=null}">
                     <ul class="navbar-nav">
                                <li class="nav-item">
	                    <a class="nav-link" href="${pageContext.request.contextPath}/member/mypage" >
	                    <i class="fa-solid fa-user"></i>
	                    ${sessionScope.userId} 님
	                    </a>
	                	</li>
                     </ul>
                  
                </c:when>
                <c:otherwise>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/member/login">
                            <i class="fa-solid fa-right-to-bracket"></i>로그인</a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/member/join">
                            <i class="fa-solid fa-user"></i>회원가입
                        </a>
                    </li>
                </c:otherwise>
                </c:choose>
                </ul>

            </div>
        </div>
    </nav>
 <!--컨테이너-->
    <div class="container mt-5 pt-5">

        <!--점보트론-->
        <div class="row mt-4">
            <div class="col">
                <div class="bg-dark text-light p-4 rounded">
                    <h1>부트스크랩 래이아웃</h1>
                    <p>설명</p>
                </div>
            </div>
        </div>

