<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="CSS/header.css?after">
</head>
<body>
<header class="header">
    <div class="topheader">
        <div class="logocontainer">
            <div class="logo">
                <img src="images/logo.svg" alt="숙명식당로고" />
                <div class="logo-text"><a href="home_page.jsp" >숙명식당</a></div>
            </div>
        </div>
        <div class="topheadermenu">
            <ul class="mypage_cart">
                <li><a href="mypage.jsp">마이페이지</a></li>
                <li class="separator"></li>
                <img class="cartlogo" src="images/cart.svg" alt="장바구니로고"/>
                <li><a href="cart.jsp">장바구니</a></li>
            </ul>
            <hr/>
        </div>
    </div>
    <div class="header-divider"></div>
    <ul class="mainmenu">
        <li><a href="MSpage.jsp">명신관</a></li>
        <li><a href="SHpage.jsp">순헌관</a></li>
        <li><a href="#THEBAKE_page">더베이크</a></li>
    </ul>
</header>

<div class="smimg">
    <img src="images/sm.png">
</div>