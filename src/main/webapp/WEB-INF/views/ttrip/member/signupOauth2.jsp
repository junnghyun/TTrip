<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ttrip/member/signup/signup.css?after">
</head>
<body>
<div class="form-container">
    <form id="signupForm2" action="/signup/outh2" method="post">
        <table class="signup-table">
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="email" name="email" value="${email}" readonly required></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                    <div class="nickname-container">
                        <input type="text" name="nickname" id="nickname" required>
                        <button type="button" class="check-btn" id="checkNickBtn">중복 확인</button>
                    </div>
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <label><input type="radio" name="gender" value="M"> 남자</label>
                    <label><input type="radio" name="gender" value="F"> 여자</label>
                    <label><input type="radio" name="gender" value="S" checked> 비공개</label>
                </td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" name="phone" id="phone" required></td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td><input type="date" name="birthdate" required></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="text" name="pass" required></td>
            </tr>
            <tr>
                <th>비밀번호<br>확인</th>
                <td><input type="text" name="pass" required></td>
            </tr>
        </table>
        <input type="hidden" name="registrationId" value="${registrationId}">
        <button type="submit" class="submit-btn">회원가입</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/ttrip/member/signup/signupUser.js"></script>
</body>
</html>