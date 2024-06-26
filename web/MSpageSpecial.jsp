<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  String user = "db2012133";
  String password = "ss2";
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  List<Map<String, String>> menuList = new ArrayList<>();

  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, password);
    stmt = conn.createStatement();
    String query = "SELECT * FROM menu";
    rs = stmt.executeQuery(query);

    while (rs.next()) {
      // TODO 명신관 메뉴 받아오기
      Map<String, String> menuItem = new HashMap<>();

      menuList.add(menuItem);
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
  }
  request.setAttribute("menuList", menuList);
%>

<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>명신관</title>
  <link rel="stylesheet" type="text/css" href="CSS/MSpage.css?after">
</head>
<body>
<div class="mainpage">
  <ul class="category">
    <li class="menu-item" id="cupbab" onclick="selectMenu('cupbab')"><a href="MSpage.jsp">컵밥</a></li>
    <li class="menu-item" id="western" onclick="selectMenu('western')"><a href="MSpageWestern.jsp">양식</a></li>
    <li class="menu-item selected" id="special" onclick="selectMenu('special')"><a href="MSpageSpecial.jsp">스페셜메뉴</a></li>
  </ul>
  <div class="menu-container" id="menu-container">
    <button class="menu-item-card1">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image1.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">순두부찌개</div>
        <div class="menu-item-price">5,900원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card2">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image2.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">현충일 휴무</div>
        <div class="menu-item-price">0원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
  </div>
</div>
<div id="special1" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('special1')">&times;</span>
    <p>순두부찌개</p>
  </div>
  <div class="quantity">
    <label for="special1Quantity">수량 :</label>
    <input type="number" id="special1Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartspecial1" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('special1')" class="add-to-cart">닫기</button>
</div>
<div id="special2" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('special2')">&times;</span>
    <p>6월 6일 현충일</p>
  </div>
  <div class="quantity">
    <label for="special2Quantity">수량 :</label>
    <input type="number" id="special2Quantity" name="quantity" value="0" min="0" max="0">
  </div>
  <button id="addToCartspecial2" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('special2')" class="add-to-cart">닫기</button>
</div>
<script src="javascript/MSpageSpecial.js"></script>
<script src="javascript/MSpageSpecialmodal.js"></script>

<script>
  function selectMenu(category) {
    var items = document.getElementsByClassName('menu-item');
    for (var i = 0; i < items.length; i++) {
      items[i].classList.remove('selected');
    }
    document.getElementById(category).classList.add('selected');
  }

  document.addEventListener('DOMContentLoaded', function() {
    selectMenu('special');
  });
</script>
</body>
</html>