<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset=EUC-KR">
  <title>숙명식당</title>
</head>
<body>

<%@include file="header.jsp"%>
<table width="100%" align="center" height="100%">

  <%@include file="todayMenu.jsp"%>
  <table width="100%" align="center" height="100%">

    <%@include file="chart.jsp"%>
    <table width="100%" align="center" height="100%">

      <%@include file="sunheon.jsp"%>
      <table width="100%" align="center" height="100%">

        <%@include file="myeongshin.jsp"%>
        <table width="100%" align="center" height="100%">

          <%@include file="thebake.jsp"%>
          <table width="100%" align="center" height="100%">

            <footer>
              <p>© 2024 숙명상점. 모든 권리 보유.</p>
            </footer>
</body>
</html>