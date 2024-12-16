<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 게시판 관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/common/css/admin.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/admin_boardlist/css/admin_boardlist.css">
<script src="${pageContext.request.contextPath}/admin/admin_boardlist/js/admin_boardlist.js" defer></script>
</head>
<body>
<jsp:include page="../common/admin.jsp" />
<div class="common_admin">
<h1>게시판 관리</h1>
<div class="product-summary">
	
</div>
<div class="order-management">
<div class="product-filter">
    <input type="text" placeholder="닉네임 검색" class="filter-input" id="product-name">
    <button class="filter-btn" onclick="searchProducts()">검색</button>
   <!--  <button class="reset-btn" onclick="resetFilters()">초기화</button> -->
    <button class="filter-btn category-btn" onclick="filterByCategory('free')" style="background-color:purple">자유</button>
    <button class="filter-btn category-btn" onclick="filterByCategory('question')" style="background-color:green">질문</button>
    <button class="filter-btn category-btn" onclick="filterByCategory('recommend')" style="background-color:blue">추천</button>
    <button class="filter-btn category-btn" onclick="filterByCategory('course')" style="background-color:orange">코스</button>
   
 	
</div>
				
<table class="product-table">
    <thead>
        <tr>
            <th style="width: 300px;">글 제목</th>
            <th style="width: 150px;">작성자</th>
            <th style="width: 150px;">카테고리</th>
            <th style="width: 120px;">작성일</th>
            <th style="width: 100px;">게시글 상태</th>
            <th style="width: 100px;">
            	<div>
				    <span>관리</span>
				</div>
            </th>
        </tr>
    </thead>
    <tbody>
    <tr>
    	
    </tr>
           <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><button class="add-product-btn" onclick="openAddProductModal()">상세 정보 추가</button></td>
       	   </tr> 
        <%-- 
            } 
        --%>
    </tbody>
</table>
<div class="pagination">
    <button class="prev-page">◀</button>
    <span>1/1</span>
    <button class="next-page">▶</button>
</div>
</div>
 
<div id="editProductModal" style="display: none;">
    <jsp:include page="boardlist_edit_modal.jsp" />
</div>
<div id="addProductModal" style="display: none;">
    <jsp:include page="boardlist_add_modal.jsp" />
</div>
</div>
<script src="${pageContext.request.contextPath}/admin/common/js/admin.js"></script>
</body>
</html>