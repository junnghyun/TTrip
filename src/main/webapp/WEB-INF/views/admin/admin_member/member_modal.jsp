<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal-overlay" style="display: none;"></div>
<div class="modal-content">
    <div class="modal-header">
        <h2>회원 상세 정보</h2>
        <button class="modal-close-btn" onclick="closeMemverModal()">✕</button>
    </div>
    <form id="memberForm" class="modal-form">
		<input type="hidden" id="memberNick" name="memberNick" value="${member.nick}">
        <div class="input-grid">
            <div class="input-group">
			    <label>이름</label>
			    <input type="text" id="name" name="name" value="${member.name}">
			</div>
            <div class="input-group">
                <label>이메일</label>
                <input type="email" id="email" name="email" value="${member.email}" readonly>
            </div>
            <div class="input-group">
                <label>닉네임</label>
                <input type="text" id="nick" name="nick" value="${member.nick}" readonly>
            </div>
            <div class="input-group">
                <label>생년월일</label>
                <input type="text" id="birth" name="birth" value="${member.birth}">
            </div>
            <div class="input-group">
                <label>연락처</label>
                <input type="tel" id="phone" name="phone" value="${member.phone}">
            </div>
            <div class="input-group">
                <label>가입일</label>
                <input type="text" id="join_date" name="join_date" value="<fmt:formatDate value='${member.join_date}' pattern='yyyy-MM-dd'/>" readonly>
            </div>
            <div class="input-group">
                <label>회원 상태</label>
                <input type="text" id="account_flag" name="account_flag" value="${member.account_flag eq 'Y' ? '정상' : '탈퇴'}" readonly>
            </div>
            <div class="input-group">
                <label>소셜 로그인</label>
                <input type="text" id="oauth_provider" name="oauth_provider" value="${empty member.oauth_provider ? '일반' : member.oauth_provider}" readonly>
            </div>
        </div>
        <div class="button-group">
            <button type="button" class="btn btn-cancel" onclick="closeMemverModal()">취소</button>
            <button type="button" class="btn btn-save" onclick="updateMember()">저장</button>
        </div>
    </form>
</div>