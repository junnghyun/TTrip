<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 관리</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/common/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/admin_lodging/css/admin_lodging.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/admin/admin_lodging/js/admin_lodging.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>
    
   		 //숙소 추가 버튼 작동
	    function mapcrawler() {
	        window.location.href = "admin_lodging_crawler.jsp";
	    }
	   
    </script>
</head>
<body>

<jsp:include page="${pageContext.request.contextPath}/admin/common/admin.jsp" />
    
    <div class="common_admin">
        <div><h1 class="store" id="store">숙소 관리</h1></div>
       
        <!-- 매장 요약 정보 -->
       <%--  <div class="store-summary">
            <span>매장 수: <strong id="store-count"><c:out value="${totalCount}"/></strong></span>
        </div> --%>
        
        <!-- 검색 및 필터 영역 -->
        <div class="order-management">
            <div class="store-filter">
                <div class="search-container">
                    <input type="text" 
                           id="store-name" 
                           name="store-name"
                           class="filter-input" 
                           placeholder="여행지 이름 검색"
                           value="<c:out value='${param.keyword}'/>">
                    <button class="filter-btn" onclick="searchStores()">검색</button>
                </div>
                <div class="region">
                  <label for="reigon" class="block text-sm font-medium text-gray-700 mb-1"></label>
                  <select id="region" name="region">
                <option value="">광역시/도</option>
                <option value="서울">서울</option>
                <option value="부산">부산</option>
                <option value="대구">대구</option>
                <option value="인천">인천</option>
                <option value="광주">광주</option>
                <option value="대전">대전</option>
                <option value="울산">울산</option>
                <option value="경기">경기</option>
                <option value="강원">강원</option>
                <option value="충북">충북</option>
                <option value="충남">충남</option>
                <option value="전북">전북</option>
                <option value="전남">전남</option>
                <option value="경북">경북</option>
                <option value="경남">경남</option>
                <option value="제주">제주</option>
            </select>
                </div>
                
                <div class="add-store-btn">
                <!-- 여행지 정보 가져오기 -->
                    <button class="crawler-btn" onclick="mapcrawler()">숙소 정보 가져오기</button>
                    <button class="store-btn" onclick="openStoreAddModal()">숙소 추가</button>
                <!-- 여행지 추가  -->
                </div>
            </div>
            
            <!-- 매장 목록 테이블 -->
            <div class="table-container">
                <table class="store-table">
                    <thead>
                        <tr>
                            <th style="width: 200px;">숙소 이름</th>
                            <th style="width: 200px;">지역</th>
                            <th style="max-width: 250px;">주소</th>
                            <th style="width: 150px;">여행지 연락처</th>
                            <th style="width: 100px;">숙소상태</th>
                            <th style="width: 100px;">관리</th>
                        </tr>
                    </thead>
                    <tbody id="storeTableBody">
                    <!-- 임시 데이터 -->
						    <tr>
						        <td></td>
						        <td></td>
						        <td></td>
						        <td></td>
						        <td></td>
						        <td>
						            <button class="action-btn"  onclick="openStoreEditModal">편집</button>
						            <button class="action-btn delete-btn" onclick="deleteStore">삭제</button>
						        </td>
						    </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- 페이지네이션 -->
			<div class="pagination">
			    <button class="prev-page" 
			            onclick="changePage('prev')">
			        ◀
			    </button>
			    <span>${currentPage} / ${totalPage}</span> <!-- 현재 페이지와 총 페이지 수 -->
			    <button class="next-page" 
			            onclick="changePage('next')">
			        ▶
			    </button>
			</div>
        </div>
    </div>

    <!-- 매장 추가 모달 -->
    <jsp:include page="lodging_add_modal.jsp" />
    
    <!-- 매장 수정 모달 -->
    <jsp:include page="lodging_edit_modal.jsp" />

    <script src="${pageContext.request.contextPath}/admin/common/js/admin.js"></script>
</body>
</html>
