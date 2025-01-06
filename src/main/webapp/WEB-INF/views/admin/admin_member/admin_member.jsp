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
<script src="${pageContext.request.contextPath}/admin/admin_member/js/admin_member.js" defer></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
//편집 화면 버튼
function MemberModal() {
    const modal = document.getElementById('MemberModal');
    if(modal) {
        modal.style.display = 'block';
        const modalContent = modal.querySelector('.modal-content');
        const overlay = modal.querySelector('.modal-overlay');
        if(overlay) {
            overlay.style.display = 'block';
        }
        if(modalContent) {
            modalContent.style.pointerEvents = 'auto';
        }
    }
}

function closeMemverModal() {
    const modal = document.getElementById('MemberModal');
    if(modal) {
        modal.style.display = 'none';
        const overlay = modal.querySelector('.modal-overlay');
        if(overlay) {
            overlay.style.display = 'none';
        }
    }
}

function showMemberModal(nick) {
    if (!nick) {
        alert('회원 정보가 없습니다.');
        return;
    }

    const xhr = new XMLHttpRequest();
    xhr.open('GET', '${pageContext.request.contextPath}/admin/member/detail/' + encodeURIComponent(nick), true);
    
    xhr.onload = function() {
        if (xhr.status === 200) {
            if (xhr.responseText.includes("error")) {
                alert('회원 정보를 불러오는데 실패했습니다.');
                return;
            }
            const modalContainer = document.getElementById('MemberModal');
            if(modalContainer) {
                modalContainer.innerHTML = xhr.responseText;
                MemberModal();
            }
        } else {
            console.error('Error:', xhr.status);
            alert('회원 정보를 불러오는데 실패했습니다.');
        }
    };
    
    xhr.onerror = function() {
        console.error('Request failed');
        alert('서버 연결에 실패했습니다.');
    };
    
    xhr.send();
}

function updateMember() {
    const form = document.getElementById('memberForm');
    const nameValue = form.name.value;
    const phoneValue = form.phone.value;
    const birthValue = form.birth.value;
    const nickValue = form.nick.value;

    if (!nameValue || nameValue.trim() === '') {
        alert('이름은 필수 입력값입니다.');
        form.name.focus();
        return;
    }

    if (!phoneValue || phoneValue.trim() === '') {
        alert('전화번호는 필수 입력값입니다.');
        form.phone.focus();
        return;
    }

    if (!birthValue || birthValue.trim() === '') {
        alert('생년월일은 필수 입력값입니다.');
        form.birth.focus();
        return;
    }

    const formData = {
        nick: nickValue,
        name: nameValue,
        phone: phoneValue,
        birth: birthValue
    };

    $.ajax({
    	url: '${pageContext.request.contextPath}/admin/member/update',
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify(formData),
        success: function(data) {
            if (data.status === 'success') {
                alert('회원 정보가 수정되었습니다.');
                closeMemverModal();
                location.reload();
            } else {
                alert('회원 정보 수정에 실패했습니다.');
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('회원 정보 수정 중 오류가 발생했습니다.');
        }
    });
}

function deleteMember2(nick, accountFlag) {
    if(accountFlag === 'N') {
        alert('이미 탈퇴된 회원입니다.');
        return;
    }

    if (!confirm(`정말 이 회원을 삭제하시겠습니까?`)) {
        return;
    }

    $.ajax({
    	url: '${pageContext.request.contextPath}/admin/member/delete/' + encodeURIComponent(nick),
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        success: function(data) {
            if (data.status === 'success') {
                alert('회원이 삭제되었습니다.');
                location.reload();
            } else {
                alert('회원 삭제에 실패했습니다.');
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('회원 삭제 중 오류가 발생했습니다.');
        }
    });
}

</script>
    
</head>
<body>
<jsp:include page="../common/admin.jsp" />
<div class="common_admin">
<h1><a href="${pageContext.request.contextPath}/admin/member">회원관리</a></h1>

<div class="order-management">
<div class="product-filter">
<form action="${pageContext.request.contextPath}/admin/member" method="get">
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
    					<button class="action-btn delete-btn" onclick="deleteMember2('${member.nick}', '${member.account_flag}')">삭제</button>
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
			<a href="${pageContext.request.contextPath}/admin/member?page=${currentPage-1}&search=${search}">이전</a>
        </c:if>
        
        <!-- 페이지 번호 -->
        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <c:choose>
                <c:when test="${pageNum == currentPage}">
                    <span style="font-weight: bold; margin: 0 5px;">${pageNum}</span>
                </c:when>
                <c:otherwise>
					<a href="${pageContext.request.contextPath}/admin/member?page=${pageNum}&search=${search}">${pageNum}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <!-- 다음 페이지 -->
        <c:if test="${currentPage < totalPages}">
			<a href="${pageContext.request.contextPath}/admin/member?page=${currentPage+1}&search=${search}">다음</a>
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