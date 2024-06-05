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
    <li class="menu-item selected" id="western" onclick="selectMenu('western')"><a href="MSpageWestern.jsp">양식</a></li>
    <li class="menu-item" id="special" onclick="selectMenu('special')"><a href="MSpageSpecial.jsp">스페셜메뉴</a></li>
  </ul>
  <div class="menu-container" id="menu-container">
    <button class="menu-item-card1">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image1.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">돈까스</div>
        <div class="menu-item-price">6,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card2">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image2.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">가라아게카레</div>
        <div class="menu-item-price">6,900원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="images/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card3">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image3.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">소시지카레</div>
        <div class="menu-item-price">6,900원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card4">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image4.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">우동+미니돈까스</div>
        <div class="menu-item-price">7,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card5">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image5.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">냉우동+미니돈까스</div>
        <div class="menu-item-price">7,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card6">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image6.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">쫄면+미니돈까스</div>
        <div class="menu-item-price">7,000원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card7">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">우동+가라아게(5pc)</div>
        <div class="menu-item-price">7,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card8">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">쫄면+가라아게(5pc)</div>
        <div class="menu-item-price">7,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card9">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">냉우동+가라아게(5pc)</div>
        <div class="menu-item-price">7,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card10">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">일반라면</div>
        <div class="menu-item-price">3,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card11">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">매운라면</div>
        <div class="menu-item-price">4,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card12">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">순두부라면</div>
        <div class="menu-item-price">5,000원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card13">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">얼큰해장라면</div>
        <div class="menu-item-price">5,000원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card14">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">부대라면</div>
        <div class="menu-item-price">5,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card15">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">우동</div>
        <div class="menu-item-price">5,300원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card16">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">냉우동</div>
        <div class="menu-item-price">5,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card17">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">어묵우동</div>
        <div class="menu-item-price">6,000원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
    <button class="menu-item-card18">
      <div class="menu-item-background">
        <div class="menu-item-image" style="background-image: url('images/image7.png');"></div>
        <div class="menu-item-divider"></div>
        <div class="menu-item-name">쫄면</div>
        <div class="menu-item-price">4,500원</div>
        <div class="menu-item-add-container">
          <img class="menu-item-add-icon" src="img/cart.svg" alt="Cart Icon">
          <div class="menu-item-add-text">담기</div>
        </div>
      </div>
    </button>
  </div>
</div>
<div id="western1" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western1')">&times;</span>
    <p>돈까스</p>
  </div>
  <div class="quantity">
    <label for="western1Quantity">수량 :</label>
    <input type="number" id="western1Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern1" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western1')" class="add-to-cart">닫기</button>
</div>
<div id="western2" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western2')">&times;</span>
    <p>가라아게카레</p>
  </div>
  <div class="quantity">
    <label for="western2Quantity">수량 :</label>
    <input type="number" id="western2Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern2" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western2')" class="add-to-cart">닫기</button>
</div>
<div id="western3" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western3')">&times;</span>
    <p>소시지카레</p>
  </div>
  <div class="quantity">
    <label for="western3Quantity">수량 :</label>
    <input type="number" id="western3Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartcubbab3" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western3')" class="add-to-cart">닫기</button>
</div>
<div id="western4" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western4')">&times;</span>
    <p>우동+미니돈까스</p>
  </div>
  <div class="quantity">
    <label for="western4Quantity">수량 :</label>
    <input type="number" id="western4Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern4" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western4')" class="add-to-cart">닫기</button>
</div>
<div id="western5" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western5')">&times;</span>
    <p>냉우동+미니돈까스</p>
  </div>
  <div class="quantity">
    <label for="western5Quantity">수량 :</label>
    <input type="number" id="western5Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern1" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western5')" class="add-to-cart">닫기</button>
</div>
<div id="western6" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western6')">&times;</span>
    <p>쫄면+미니돈까스</p>
  </div>
  <div class="quantity">
    <label for="western6Quantity">수량 :</label>
    <input type="number" id="western6Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern6" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western6')" class="add-to-cart">닫기</button>
</div>
<div id="western7" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western7')">&times;</span>
    <p>우동+가라아게(5pc)</p>
  </div>
  <div class="quantity">
    <label for="western7Quantity">수량 :</label>
    <input type="number" id="western7Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern7" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western7')" class="add-to-cart">닫기</button>
</div>
<div id="western8" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western8')">&times;</span>
    <p>쫄면+가라아게(5pc)</p>
  </div>
  <div class="quantity">
    <label for="western8Quantity">수량 :</label>
    <input type="number" id="western8Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern8" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western8')" class="add-to-cart">닫기</button>
</div>
<div id="western9" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western9')">&times;</span>
    <p>냉우동+가라아게(5pc)</p>
  </div>
  <div class="quantity">
    <label for="western9Quantity">수량 :</label>
    <input type="number" id="western9Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern9" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western9')" class="add-to-cart">닫기</button>
</div>
<div id="western10" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western10')">&times;</span>
    <p>일반라면</p>
  </div>
  <div class="quantity">
    <label for="western10Quantity">수량 :</label>
    <input type="number" id="western10Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern10" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western10')" class="add-to-cart">닫기</button>
</div>
<div id="western11" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western11')">&times;</span>
    <p>매운라면</p>
  </div>
  <div class="quantity">
    <label for="western11Quantity">수량 :</label>
    <input type="number" id="western11Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern11" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western11')" class="add-to-cart">닫기</button>
</div>
<div id="western12" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western12')">&times;</span>
    <p>순두부라면</p>
  </div>
  <div class="quantity">
    <label for="western12Quantity">수량 :</label>
    <input type="number" id="western12Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern12" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western12')" class="add-to-cart">닫기</button>
</div>
<div id="western13" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western13')">&times;</span>
    <p>얼큰해장라면</p>
  </div>
  <div class="quantity">
    <label for="western13Quantity">수량 :</label>
    <input type="number" id="western13Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern13" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western13')" class="add-to-cart">닫기</button>
</div>
<div id="western14" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western14')">&times;</span>
    <p>부대라면</p>
  </div>
  <div class="quantity">
    <label for="western14Quantity">수량 :</label>
    <input type="number" id="western14Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern14" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western14')" class="add-to-cart">닫기</button>
</div>
<div id="western15" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western15')">&times;</span>
    <p>우동</p>
  </div>
  <div class="quantity">
    <label for="western15Quantity">수량 :</label>
    <input type="number" id="western15Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern15" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western15')" class="add-to-cart">닫기</button>
</div>
<div id="western16" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western16')">&times;</span>
    <p>냉우동</p>
  </div>
  <div class="quantity">
    <label for="western16Quantity">수량 :</label>
    <input type="number" id="western16Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern16" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western16')" class="add-to-cart">닫기</button>
</div>
<div id="western17" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western17')">&times;</span>
    <p>어묵우동</p>
  </div>
  <div class="quantity">
    <label for="western17Quantity">수량 :</label>
    <input type="number" id="western17Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern17" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western17')" class="add-to-cart">닫기</button>
</div>
<div id="western18" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal('western18')">&times;</span>
    <p>쫄면</p>
  </div>
  <div class="quantity">
    <label for="western18Quantity">수량 :</label>
    <input type="number" id="western18Quantity" name="quantity" value="0" min="0" max="5">
  </div>
  <button id="addToCartwestern18" class="add-to-cart">장바구니</button>
  <button onclick="closeModal('western18')" class="add-to-cart">닫기</button>
</div>
<script src="javascript/MSpageWestern.js"></script>
<script src="javascript/MSpageWesternmodal.js"></script>

<script>
  function selectMenu(category) {
    var items = document.getElementsByClassName('menu-item');
    for (var i = 0; i < items.length; i++) {
      items[i].classList.remove('selected');
    }
    document.getElementById(category).classList.add('selected');
  }

  document.addEventListener('DOMContentLoaded', function() {
    selectMenu('western');
  });
</script>
</body>
</html>