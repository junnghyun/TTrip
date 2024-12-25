<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원관리</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/admin_member/css/admin_member.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/common/css/admin.css">
<script src="${pageContext.request.contextPath}/admin/admin_member.js/admin_member.js" defer></script>

  <script>
  
  		//편집 화면 버튼
	function MemberModal() {
        const modal = document.getElementById('MemberModal');
        const overlay = modal.querySelector('.modal-overlay');
        modal.style.display = 'block';
        overlay.style.display = 'block';
    }

    function closeMemverModal() {
        const modal = document.getElementById('MemberModal');
        const overlay = modal.querySelector('.modal-overlay');
        modal.style.display = 'none';
        overlay.style.display = 'none';
    }
    


    // 모달 외부 클릭 시 닫기
    window.onclick = function(event) {
        const modal = document.getElementById('MemberModal');
        const modalOverlay = modal ? modal.querySelector('.modal-overlay') : null;
        
        if (event.target === modalOverlay) {
            closeMemverModal();
        }
    };
    
    </script>
    
</head>
<body>
<jsp:include page="../common/admin.jsp" />
<div class="common_admin">
<h1><a href="/admin_member" style="text-decoration: none; color: inherit;">회원관리</a></h1>

<div class="order-management">
<div class="product-filter">
    <form action="/admin_member" method="get">
        <input type="text" name="search" placeholder="닉네임 검색" 
               class="filter-input" id="product-name" value="${param.search}">
        <button type="submit" class="filter-btn">검색</button>
        <!-- <a href="/admin_member" class="reset-btn">초기화</a> -->
    </form>
</div>
    
<table class="member-table">
    <thead>
        <tr>
            <th style="width: 110px;">닉네임 </th>
            <th style="width: 70px;">이름</th>
            <th style="width: 100px;">생년월일</th>
            <th style="width: 120px;">전화번호</th>
            <th style="width: 170px;">이메일</th>
            <th style="width: 80px;">회원상태</th>
            <th style="width: 200px;">회원 관리</th>
        </tr>
    </thead>
    <tbody id="memberTableBody">
    <c:choose>
        <c:when test="${not empty members}">
            <c:forEach items="${members}" var="member">
                <tr>
                    <td>${member.nick}</td>
                    <td>${member.name}</td>
                    <td>${member.birth}</td>
                    <td>${member.phone}</td>
                    <td>${member.email}</td>
                    <td>${member.account_flag eq 'Y' ? '정상' : '탈퇴'}</td>
                    <td>
                        <button class="action-btn" onclick="showMemberModal('${member.nick}')">회원 정보 확인</button>
                        <button class="action-btn delete-btn" onclick="deleteMember()">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="8" class="text-center">검색된 회원이 없습니다.</td>
            </tr>
        </c:otherwise>
    </c:choose>
</tbody>
</table>
		<!-- 데이터 테이블 아래에 페이징 추가 -->
<div class="pagination" style="text-align: center; margin-top: 20px;">
    <c:if test="${totalPages > 1}">
        <!-- 이전 페이지 -->
        <c:if test="${currentPage > 1}">
            <a href="/admin_member?page=${currentPage-1}&search=${search}" style="margin: 0 5px;">이전</a>
        </c:if>
        
        <!-- 페이지 번호 -->
        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <c:choose>
                <c:when test="${pageNum == currentPage}">
                    <span style="font-weight: bold; margin: 0 5px;">${pageNum}</span>
                </c:when>
                <c:otherwise>
                    <a href="/admin_member?page=${pageNum}&search=${search}" style="margin: 0 5px;">${pageNum}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <!-- 다음 페이지 -->
        <c:if test="${currentPage < totalPages}">
            <a href="/admin_member?page=${currentPage+1}&search=${search}" style="margin: 0 5px;">다음</a>
        </c:if>
    </c:if>
	</div>
	</div>
</div>

    
<!-- 회원 정보 확인 모달 -->
<div id="MemberModal" style="display: none;">
    <jsp:include page="member_modal.jsp" />
</div>
<script src="${pageContext.request.contextPath}/admin/common/js/admin.js"></script>
</body>
</html>