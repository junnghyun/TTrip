<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원관리</title>
<link rel="stylesheet" type="text/css" href="css/admin_member.css?after">
<link rel="stylesheet" type="text/css" href="../common/css/admin.css">
<script src="js/admin_member.js" defer></script>
  <script>
  
  		//편집 화면 버튼
	    function MemberModal() {
	        window.location.href = "member_modal.jsp";
	    }
    </script>
</head>
<body>
<jsp:include page="../common/admin.jsp" />
<div class="common_admin">
<h1>회원관리</h1>

<%--
    MemberDAO memberDAO = new MemberDAO();
    int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
    String searchTerm = request.getParameter("search") != null ? request.getParameter("search") : "";
    int membersPerPage = 20;
    
    List<Member> members = memberDAO.getMembers(currentPage, membersPerPage, searchTerm);
    int totalMembers = memberDAO.getTotalMembersCount(searchTerm);
    int totalPages = (int) Math.ceil((double) totalMembers / membersPerPage);
--%>

<div class="member-summary">

</div>

<div class="order-management">
<div class="product-filter">
        <input type="text" name="search" placeholder="닉네임 검색" class="filter-input" id="product-name">
        <button type="submit" class="filter-btn">검색</button>
        <!-- <a href="?page=1" class="reset-btn">초기화</a> -->
</div>
    
<table class="member-table">
    <thead>
        <tr>
            <th style="width: 110px;">닉네임 </th>
            <th style="width: 70px;">이름</th>
            <th style="width: 100px;">생년월일</th>
            <th style="width: 120px;">전화번호</th>
            <th style="width: 170px;">이메일</th>
            <th>주소</th>
            <th style="width: 80px;">회원상태</th>
            <th style="width: 200px;">
            	<div class="pagination">
		            <a href="?page=<%--= Math.max(1, currentPage - 1) --%>&search=<%--= searchTerm --%>" class="prev-page" <%--= currentPage == 1 ? "disabled" : "" --%>>◀</a>
		            <span><%--= currentPage --%></span> / <span><%--= totalPages --%></span>
		            <a href="?page=<%--= Math.min(totalPages, currentPage + 1) --%>&search=<%--= searchTerm --%>" class="next-page" <%--= currentPage == totalPages ? "disabled" : "" --%>>▶</a>
		        </div>
            </th>
        </tr>
    </thead>
    <tbody id="memberTableBody"> 
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td>
                     <button class="action-btn" onclick="MemberModal()">회원 정보 확인</button>
                     <button class="action-btn delete-btn" onclick="deleteMember()">삭제</button>
                 </td>
             </tr>
         <%-- } --%>
    </tbody>
</table>
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
    
<!-- 회원 정보 확인 모달 -->
<div id="MemberModal" style="display: none;">
    <jsp:include page="member_modal.jsp" />
</div>
<script src="../common/js/admin.js"></script>
</body>
</html>