<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 페이지</title>
    <link rel="stylesheet" href="edit_member.css">
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <div class="logo">로고</div>
            <ul class="menu">
                <li>여행 코스</li>
                <li>내가 쓴 글</li>
                <li>댓글 단 글</li>
                <li>추천한 글</li>
                <li>신고한 글</li>
            </ul>
        </div>

        <div class="main-content">
            <div class="header">
                <h2>기본정보</h2>
                <button class="logout-btn">회원탈퇴</button>
            </div>

            <form action="#" method="post">
                <table class="info-table">
                    <tr>
                        <th>이름</th>
                        <td>이상훈</td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td>
                            <input type="text" name="nickname" value="이******" id="nickname-input">
                            <button type="button" class="check-btn" onclick="checkNickname()">중복 확인</button>
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>****년 **월 **일</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>
                            <label><input type="radio" name="gender" value="male"> 남자</label>
                            <label><input type="radio" name="gender" value="female"> 여자</label>
                            <label><input type="radio" name="gender" value="private"> 비공개</label>
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="tel" value="010-1234-1234" id="tel"></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>example@example.com
                            <span class="auth-user">카카오 인증 사용자</span>
                        </td>
                    </tr>
                    <tr>
                        <th>현재 비밀번호</th>
                        <td>
                            <input type="password" name="current-password" id="current-password" placeholder="비밀번호를 입력해주세요." >
                        </td>
                    </tr>
                    <tr>
                        <th>새 비밀번호</th>
                        <td>
                            <input type="password" name="new-password" id="new-password" placeholder="새 비밀번호를 입력해주세요." >
                        </td>
                    </tr>
                    <tr>
                        <th>새 비밀번호 확인</th>
                        <td>
                            <input type="password" name="confirm-password" id="confirm-password" placeholder="새 비밀번호를 재입력해주세요." >
                        </td>
                    </tr>
                </table>

                <div class="button-container">
                    <button type="button" class="cancel-btn" onclick="cancelChanges()">취소하기</button>
                    <button type="submit" class="submit-btn">변경하기</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function checkNickname() {
            alert('닉네임 중복 확인');
            // 여기에 중복 확인 로직 추가
        }
    </script>
</body>
</html>
