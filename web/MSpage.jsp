<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    String dbDriver = "oracle.jdbc.driver.OracleDriver";
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe"; // Update with your DB details
    String dbUser = "system"; // Update with your DB username
    String dbPasswd = "oracle"; // Update with your DB password
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    List<Map<String, String>> menuList = new ArrayList<>();

    try {
        Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbURL, dbUser, dbPasswd);
        stmt = conn.createStatement();
        String query = "SELECT menu_name, menu_price FROM menu where cafeteria_code = 'ms' AND menu_category='컵밥'";
        rs = stmt.executeQuery(query);

        while (rs.next()) {
            Map<String, String> menuItem = new HashMap<>();
            menuItem.put("menu_name", rs.getString("menu_name"));
            menuItem.put("menu_price", rs.getString("menu_price"));

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
    <link rel="stylesheet" type="text/css" href="CSS/MSpage.css">
</head>
<style>
    .modal {
        display: none;
        position: fixed;
        z-index: 1500; /* 변경된 부분 */
        top: 50%; /* 수직 중앙 정렬 */
        left: 40%; /* 수평 중앙 정렬 */
        width:300px;
        height:400px;
        padding:20px;
        text-align: center;
        background-color: rgb(255,255,255);
        border-radius:10px;
        box-shadow:0 2px 3px 0 rgba(34,36,38,0.15);
        transform:translateY(-50%);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 500px;
        border-radius: 5px;
        z-index: 1501;
    }
</style>
<body>
<div class="mainpage">
    <ul class="category">
        <li class="menu-item selected" id="cupbab" onclick="selectMenu('cupbab')"><a href="MSpage.jsp">컵밥</a></li>
        <li class="menu-item" id="western" onclick="selectMenu('western')"><a href="MSpageWestern.jsp">양식</a></li>
        <li class="menu-item" id="special" onclick="selectMenu('special')"><a href="MSpageSpecial.jsp">스페셜메뉴</a></li>
    </ul>
    <div class="menu-container" id="menu-container">
        <%
            int i = 1;
            for (Map<String, String> menuItem : menuList) {
                String name = menuItem.get("menu_name");
                String price = menuItem.get("menu_price");
                String modalId = "modal" + i;
                String quantityId = "quantity" + i;
                String addToCartId = "addToCart" + i;

        %>
        <button class="menu-item-card">
            <div class="menu-item-background">
                <div class="menu-item-image" style="background-image: url('images/myeong2.png');"></div>
                <div class="menu-item-divider"></div>
                <div class="menu-item-name"><%= name %></div>
                <div class="menu-item-price"><%= price %>원</div>
                <div class="menu-item-add-container" onclick="openModal('<%= modalId %>')">
                    <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
                    <div class="menu-item-add-text">담기</div>
                </div>
            </div>
        </button>

        <div id="<%= modalId %>" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal('<%= modalId %>')">&times;</span>
                <p><%= name %></p>
            </div>
            <div class="quantity">
                <label for="<%= quantityId %>">수량 :</label>
                <input type="number" id="<%= quantityId %>" name="quantity" value="0" min="0" max="5">
            </div>
            <button id="<%= addToCartId %>" class="add-to-cart" data-name="<%= name %>" data-quantity-id="<%= quantityId %>" data-modal-id="<%= modalId %>">장바구니</button>
            <button onclick="closeModal('<%= modalId %>')" class="add-to-cart">닫기</button>
        </div>
        <%
                i++;
            }
        %>
    </div>
</div>

<script src="javascript/MSpage.js"></script>
<script src="javascript/MSpagemodal.js"></script>

<script>

    function selectMenu(category) {
        var items = document.getElementsByClassName('menu-item');
        for (var i = 0; i < items.length; i++) {
            items[i].classList.remove('selected');
        }
        document.getElementById(category).classList.add('selected');
    }

    function openModal(modalId) {
        document.getElementById(modalId).style.display = "block";
    }

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = "none";
    }

    document.addEventListener('DOMContentLoaded', function() {
        selectMenu('cupbab');

        var addToCartButtons = document.getElementsByClassName('add-to-cart');
        for (var i = 0; i < addToCartButtons.length; i++) {
            addToCartButtons[i].addEventListener('click', function() {
                var name = this.getAttribute('data-name');
                var quantityId = this.getAttribute('data-quantity-id');
                var modalId = this.getAttribute('data-modal-id');
                var quantity = document.getElementById(quantityId).value;
                alert(name + ' ' + quantity + '개가 장바구니에 추가되었습니다.');
                closeModal(modalId);
            });
        }
    });
</script>
</body>
</html>