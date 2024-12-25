<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<div class="modal-overlay">
   <div class="modal-content">
       <div class="modal-header">
           <h2 class="modal-title">회원 상세 정보</h2>
           <button class="modal-close-btn" onclick="closeMemverModal()">✕</button>
       </div>
       <form id="memberForm" class="modal-form">
		    <input type="hidden" id="memberNick" name="nick">
		    <div class="input-grid">
		        <div class="input-group">
		            <label class="input-label" for="name">이름</label>
		            <input type="text" id="name" name="name" class="input-field" readonly>
		        </div>
		        <div class="input-group">
		            <label class="input-label" for="nick">닉네임</label>
		            <input type="text" id="nick" name="nick" class="input-field">
		        </div>
		        <div class="input-group">
		            <label class="input-label" for="birth">생년월일</label>
		            <input type="text" id="birth" name="birth" class="input-field">
		        </div>
		        <div class="input-group">
		            <label class="input-label" for="phone">연락처</label>
		            <input type="tel" id="phone" name="phone" class="input-field">
		        </div>
		        <div class="input-group">
		            <label class="input-label" for="email">이메일</label>
		            <input type="email" id="email" name="email" class="input-field" readonly>
		        </div>
		        <div class="input-group">
		            <label class="input-label" for="join_date">가입일</label>
		            <input type="text" id="join_date" name="join_date" class="input-field" readonly>
		        </div>
		        <div class="input-group">
		            <label class="input-label" for="account_flag">회원 상태</label>
		            <input type="text" id="account_flag" name="account_flag" class="input-field" readonly>
		        </div>
		        <div class="input-group">
		            <label class="input-label" for="oauth_provider">소셜 로그인</label>
		            <input type="text" id="oauth_provider" name="oauth_provider" class="input-field" readonly>
		        </div>
		    </div>
		    <div class="button-group">
		        <button type="button" class="btn btn-cancel" onclick="closeMemverModal()">취소</button>
		        <button type="button" class="btn btn-save" onclick="updateMember()">저장</button>
		    </div>
		</form>
   </div>
</div>