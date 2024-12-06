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
    <form action="#" method="post">
        <table class="signup-table">
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" required></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="email" name="email" required></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                    <div class="nickname-container">
                        <input type="text" name="nickname" required>
                        <button type="button" class="check-btn">중복 확인</button>
                    </div>
                </td>
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
                <td><input type="text" name="phone" required></td>
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
        <button type="submit" class="submit-btn">회원가입</button>
    </form>
</div>
</body>
</html>