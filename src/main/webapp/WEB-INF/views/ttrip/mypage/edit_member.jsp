<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ttrip/member/edit_member/edit_member.css">
    <link href="${pageContext.request.contextPath}/ttrip/mypage/css/mypage.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
    <div class="sidebar">
        <div class="logo">로고</div>
        <nav class="side-menu">
            <a href="mypage_course" class="menu-item" style="width: 180px">여행 코스</a>
            <a href="mypage_myboard" class="menu-item" style="width: 180px">내가 쓴 글</a>
            <a href="mypage_comment" class="menu-item" style="width: 180px">댓글 단 글</a>
            <a href="mypage_recommend" class="menu-item" style="width: 180px">추천한 글</a>
            <a href="mypage_report" class="menu-item" style="width: 180px">신고한 글</a>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h2>기본정보</h2>
            <button class="logout-btn">회원탈퇴</button>
        </div>

        <form id="memberUpdateForm">
            <table class="info-table">
                <tr>
                    <th>이름</th>
                    <td id="name">${memberInfo.name}</td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td>
                        <input type="text" name="nickname" value="${memberInfo.nick}" id="nickname-input">
                        <button type="button" class="check-btn" onclick="checkNickname()">중복 확인</button>
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td id="birth">${memberInfo.birth}</td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <label><input type="radio" name="gender" value="M" ${memberInfo.gender == 'M' ? 'checked' : ''}> 남자</label>
                        <label><input type="radio" name="gender" value="F" ${memberInfo.gender == 'F' ? 'checked' : ''}> 여자</label>
                        <label><input type="radio" name="gender" value="S" ${memberInfo.gender == 'S' ? 'checked' : ''}> 비공개</label>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="text" name="tel" value="${memberInfo.phone}" id="tel"></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td id="email">${memberInfo.email}</td>
                </tr>
                <tr>
                    <th>현재 비밀번호</th>
                    <td>
                        <input type="password" name="current-password" id="current-password" placeholder="비밀번호를 입력해주세요.">
                    </td>
                </tr>
                <tr>
                    <th>새 비밀번호</th>
                    <td>
                        <input type="password" name="new-password" id="new-password" placeholder="새 비밀번호를 입력해주세요.">
                    </td>
                </tr>
                <tr>
                    <th>새 비밀번호 확인</th>
                    <td>
                        <input type="password" name="confirm-password" id="confirm-password" placeholder="새 비밀번호를 재입력해주세요.">
                    </td>
                </tr>
            </table>

            <div class="button-container">
                <button type="button" class="cancel-btn" onclick="javascript:history.back()">취소하기</button>
                <button type="button" class="submit-btn" onclick="updateMember()">변경하기</button>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function() {
        // 페이지가 로드될 때, 사용자 정보를 가져옵니다.
        var token = localStorage.getItem("jwt_token");  // 예시로 로컬스토리지에서 JWT 토큰을 가져옵니다.

        $.ajax({
            url: '/user/api/edit_member',
            type: 'GET',
            headers: {
                'Authorization': 'Bearer ' + token
            },
            success: function(response) {
                // 서버로부터 받은 데이터로 각 필드를 업데이트합니다.
                var memberInfo = response;
                $("#nickname-input").val(memberInfo.nick);  // 닉네임 입력 필드 업데이트
                $("input[name='gender'][value='" + memberInfo.gender + "']").prop('checked', true);  // 성별 업데이트
                $("#tel").val(memberInfo.phone);  // 전화번호 필드 업데이트
                $("#current-password").val('');  // 비밀번호 입력칸은 초기화
                $("#new-password").val('');
                $("#confirm-password").val('');

                $("#name").text(memberInfo.name);  // 이름 필드 업데이트
                $("#birth").text(memberInfo.birth);  // 생년월일 필드 업데이트
                $("#email").text(memberInfo.email);  // 이메일 필드 업데이트
            },
            error: function(error) {
                alert("회원 정보를 불러오는 데 실패했습니다.");
                console.log(error);
            }
        });
    });
</script>

<script src="${pageContext.request.contextPath}/common/authCheck.js"></script>
</body>
</html>