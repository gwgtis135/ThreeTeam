<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

  <!-- ** Basic Page Needs ** -->
  <meta charset="utf-8">
  <title>Medic | Medical HTML Template</title>

  <!-- ** Mobile Specific Metas ** -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Medical HTML Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Medical HTML Template v1.0">
  
  <!-- ** Plugins Needed for the Project ** -->
  <!-- bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick/slick-theme.css">
  <!-- FancyBox -->
  <link rel="stylesheet" href="plugins/fancybox/jquery.fancybox.min.css">
  <!-- fontawesome -->
  <link rel="stylesheet" href="plugins/fontawesome/css/all.min.css">
  <!-- animate.css -->
  <link rel="stylesheet" href="plugins/animation/animate.min.css">
  <!-- jquery-ui -->
  <link rel="stylesheet" href="plugins/jquery-ui/jquery-ui.css">
  <!-- timePicker -->
  <link rel="stylesheet" href="plugins/timePicker/timePicker.css">
  
  <!-- Stylesheets -->
  <link href="css/style.css" rel="stylesheet">
  
  <!--Favicon-->
  <link rel="icon" href="images/favicon.png" type="image/x-icon">

</head>
<body>

<!--Header Upper-->
<section class="header-uper">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-xl-4 col-lg-3">
        <div class="logo">
          <a href="index.html">
            <img loading="lazy" class="img-fluid" src="images/logo.jpg" alt="logo">
          </a>
        </div>
      </div>
          <div class="link-btn text-center text-lg-right">
            <a href="registerForm.do" class="btn-style-one">로그인 / 회원가입</a>
          </div>
      
    </div>
  </div>
  <br>
  <!--Main Header-->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarLinks" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarLinks">
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="home.do">Home</a>
        </li>
        <li class="nav-item @@about">
          <a class="nav-link" href="about.html">분실물 게시판</a>
        </li>
        <li class="nav-item @@service">
          <a class="nav-link" href="service.html">습득물 게시판</a>
        </li>
        <li class="nav-item @@gallery">
          <a class="nav-link" href="gallery.html">공공기관 유실물 조회</a>
        </li>
        <li class="nav-item @@team">
          <a class="nav-link" href="team.html">후기게시판</a>
        </li>
        <c:if test="${not empty id }"><!-- 로그인 후 보이는 메뉴 -->
        <li class="nav-item @@appointment">
          <a class="nav-link" href="memberSelect.do">나의 정보</a>
        </li>
        </c:if>
        
        <c:if test="${author == 'ADMIN' }"> <!-- 관리자만 보이는 드롭다운 -->
        <li class="nav-item dropdown @@blogs">
          <a class="nav-link dropdown-toggle" href="#!" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자 페이지</a>

          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item @@blog" href="memberSelectList.do">회원 관리</a></li>
            <li><a class="dropdown-item @@blogDetails" href="blog-details.html">게시글 관리</a></li>
            </li>
            </c:if>
          </ul>
        </li>
        <li class="nav-item @@contact">
          <a class="nav-link" href="contact.html">사이트 소개</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!--End Main Header -->
</section>
<!--Header Upper-->
<!-- jquery -->
<script src="plugins/jquery.min.js"></script>
<!-- bootstrap -->
<script src="plugins/bootstrap/bootstrap.min.js"></script>
<!-- Slick Slider -->
<script src="plugins/slick/slick.min.js"></script>
<script src="plugins/slick/slick-animation.min.js"></script>
<!-- FancyBox -->
<script src="plugins/fancybox/jquery.fancybox.min.js" defer></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU" defer></script>
<script src="plugins/google-map/gmap.js" defer></script>

<!-- jquery-ui -->
<script src="plugins/jquery-ui/jquery-ui.js" defer></script>
<!-- timePicker -->
<script src="plugins/timePicker/timePicker.js" defer></script>

<!-- script js -->
<script src="js/script.js"></script>
</body>
</html>