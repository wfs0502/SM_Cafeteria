<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "system";
    String password = "oracle";
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
    <link rel="stylesheet" type="text/css" href="CSS/MSpage.css">
</head>
<body>
<div class="mainpage">
    <div class="category">
        <div class="menu-item selected" id="cupbab" onclick="selectMenu('cupbab')">컵밥</div>
        <div class="menu-item" id="western" onclick="selectMenu('western')">양식</div>
        <div class="menu-item" id="special" onclick="selectMenu('special')">스페셜메뉴</div>
    </div>
    <div class="menu-container" id="menu-container">
        <div class="menu-item-card">
            <div class="menu-item-background">
                <div class="menu-item-image" style="background-image: url('images/image1.png');"></div>
                <div class="menu-item-divider"></div>
                <div class="menu-item-name">비건야채컵밥</div>
                <div class="menu-item-price">4,500원</div>
                <div class="menu-item-add-container">
                    <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
                    <div class="menu-item-add-text">담기</div>
                </div>
            </div>
        </div>
        <div class="menu-item-card">
            <div class="menu-item-background">
                <div class="menu-item-image" style="background-image: url('images/image2.png');"></div>
                <div class="menu-item-divider"></div>
                <div class="menu-item-name">참치마요컵밥</div>
                <div class="menu-item-price">4,500원</div>
                <div class="menu-item-add-container">
                    <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
                    <div class="menu-item-add-text">담기</div>
                </div>
            </div>
        </div>
        <div class="menu-item-card">
            <div class="menu-item-background">
                <div class="menu-item-image" style="background-image: url('images/image3.png');"></div>
                <div class="menu-item-divider"></div>
                <div class="menu-item-name">참치김치컵밥</div>
                <div class="menu-item-price">4,500원</div>
                <div class="menu-item-add-container">
                    <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
                    <div class="menu-item-add-text">담기</div>
                </div>
            </div>
        </div>
        <div class="menu-item-card">
            <div class="menu-item-background">
                <div class="menu-item-image" style="background-image: url('images/image4.png');"></div>
                <div class="menu-item-divider"></div>
                <div class="menu-item-name">스파게티</div>
                <div class="menu-item-price">6,000원</div>
                <div class="menu-item-add-container">
                    <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
                    <div class="menu-item-add-text">담기</div>
                </div>
            </div>
        </div>
        <div class="menu-item-card">
            <div class="menu-item-background">
                <div class="menu-item-image" style="background-image: url('images/image5.png');"></div>
                <div class="menu-item-divider"></div>
                <div class="menu-item-name">리조또</div>
                <div class="menu-item-price">7,000원</div>
                <div class="menu-item-add-container">
                    <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
                    <div class="menu-item-add-text">담기</div>
                </div>
            </div>
        </div>
        <div class="menu-item-card">
            <div class="menu-item-background">
                <div class="menu-item-image" style="background-image: url('images/image6.png');"></div>
                <div class="menu-item-divider"></div>
                <div class="menu-item-name">스페셜 메뉴 1</div>
                <div class="menu-item-price">8,000원</div>
                <div class="menu-item-add-container">
                    <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
                    <div class="menu-item-add-text">담기</div>
                </div>
            </div>
        </div>
        <div class="menu-item-card">
            <div class="menu-item-background">
                <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
                <div class="menu-item-divider"></div>
                <div class="menu-item-name">스페셜 메뉴 2</div>
                <div class="menu-item-price">9,000원</div>
                <div class="menu-item-add-container">
                    <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
                    <div class="menu-item-add-text">담기</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function selectMenu(category) {
        var items = document.getElementsByClassName('menu-item');
        for (var i = 0; i < items.length; i++) {
            items[i].classList.remove('selected');
        }
        document.getElementById(category).classList.add('selected');
    }

    document.addEventListener('DOMContentLoaded', function() {
        selectMenu('cupbab');
    });
</script>
</body>
</html>