<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/session_chk.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>여행지 관리</title>
    <link rel="stylesheet" type="text/css" href="../common/css/admin.css">
    <link rel="stylesheet" type="text/css" href="css/admin_travel.css?after">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="js/admin_travel.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>
	    function mapcrawler() {
	        window.location.href = "travel_crawler.jsp";
	    }
    </script>
</head>
<body>

<jsp:include page="../common/admin.jsp" />
    
    <div class="common_admin">
        <div><h1 class="store" id="store">여행지 관리</h1></div>
        <jsp:useBean id="sVO" class="kr.co.triptrip.user.store.StoreSearchVO" scope="page"/>
        <jsp:setProperty property="*" name="sVO"/>
       <%--  <%
        // 총 매장의 수 구하기
         int totalCount=0;
        
       StoreDAO sDAO=StoreDAO.getInstance();
      try{
      	totalCount=sDAO.selectTotalCount(sVO);
        } catch(SQLException se) {
       	se.printStackTrace();
        } 
        
        // 한 화면에 보여줄 레코드의 수 
        int pageScale=15;
        
        // 총 페이지 수
         int totalPage=(int)Math.ceil((double)totalCount/pageScale); 
      
        // 검색의 시작 번호 구하기
        String paramPage=request.getParameter("currentPage");
        
        int currentPage=1;
        if(paramPage != null) {
        	try{
        		currentPage=Integer.parseInt(paramPage);
        	} catch (NumberFormatException nfe){
        		nfe.printStackTrace();
        	}
        }
        
        // 시작 번호
        int startNum = currentPage * pageScale - pageScale + 1;
        
        // 끝 번호
        int endNum = startNum + pageScale - 1;
        
        sVO.setCurrentStorePage(currentPage);
        sVO.setStartNum(startNum);
        sVO.setEndNum(endNum);
        sVO.setTotalPage(totalPage);
        sVO.setTotalCount(totalCount);
        
        List<StoreVO> storeList = null;
        try {
           storeList = sDAO.selectStore(sVO); // 새로운 페이지의 데이터 가져오기
        } catch (SQLException se) {
            se.printStackTrace();
        }
        
        pageContext.setAttribute("totalCount", totalCount);
        pageContext.setAttribute("pageScale", pageScale);
        pageContext.setAttribute("totalPage", totalPage);
        pageContext.setAttribute("currentPage", currentPage);
        pageContext.setAttribute("storeList", storeList);
        
        pageContext.setAttribute("startNum", startNum);
        pageContext.setAttribute("endNum", endNum);
        
        %>  --%>
        <!-- 매장 요약 정보 -->
       <div class="store-summary">
     <%--        <span>매장 수: <strong id="store-count"><c:out value="${totalCount}"/></strong></span> --%>
        </div> 
        
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
                    <button class="crawler-btn" onclick="mapcrawler()">여행지 정보 가져오기</button>
                    <button class="store-btn" onclick="openStoreAddModal()">여행지 추가</button>
                <!-- 여행지 추가  -->
                </div>
            </div>
            
            <!-- 매장 목록 테이블 -->
            <div class="table-container">
                <table class="store-table">
                    <thead>
                        <tr>
                            <th style="width: 250px;">여행지 이름</th>
                            <th style="width: 250px;">매장연락처</th>
                            <th style="max-width: 250px;">주소</th>
                            <th style="width: 100px;">매장상태</th>
                            <th style="width: 150px;">관리</th>
                        </tr>
                    </thead>
                    <tbody id="storeTableBody">
                    <!-- 임시 데이터 -->
						    <tr>
						        <td></td>
						        <td></td>
						        <td></td>
						        <td></td>
						        <td>
						            <button class="action-btn" 
									        onclick="openStoreEditModal">
									    편집
									</button>
						            <button class="action-btn delete-btn" 
						                    onclick="deleteStore">
						                삭제
						            </button>
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
    <jsp:include page="travel_add_modal.jsp" />
    
    <!-- 매장 수정 모달 -->
    <jsp:include page="travel_edit_modal.jsp" />

    <script src="../common/js/admin.js"></script>
</body>
</html>
