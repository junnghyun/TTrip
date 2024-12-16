<%@page import="kr.co.triptrip.admin.prd.AdminPrdVO"%>
<%@page import="kr.co.triptrip.admin.prd.AdminPrdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>


<div class="modal-overlay">
    <div class="modal-content shadow-xl">
        <div class="bg-green-600 text-white px-6 py-4 flex justify-between items-center">
            <h2 class="text-xl font-semibold">게시글 상세보기</h2>
            <button class="text-white hover:text-gray-200 transition duration-150" onclick="closeProductModal()">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </button>
        </div>
        <form class="p-4 space-y-4" id="addProductForm" method="post">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="input-group md:col-span-2">
                    <label for="product_name" class="block text-sm font-medium text-gray-700 mb-1">게시글 제목</label>
                    <input type="text" id="product_name" name="product_name" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                </div>
                <div class="input-group md:col-span-2">
                    <label for="description" class="block text-sm font-medium text-gray-700 mb-1">게시글 내용</label>
                    <textarea id="description" name="description" rows="2" class="w-full px-2 py-1 text-sm border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"></textarea>
                </div>
                <div class="input-group">
                    <label for="writer" class="block text-sm font-medium text-gray-700 mb-1">작성자</label>
                    <input type="text" id="writer" name="writer" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                </div>
                <div class="input-group">
                    <label for="comment_writer" class="block text-sm font-medium text-gray-700 mb-1">댓글 작성자</label>
                    <input type="text" id="comment_writer" name="comment_writer" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                </div>
                <div class="input-group md:col-span-2">
                    <label for="comment_contact" class="block text-sm font-medium text-gray-700 mb-1">댓글 내용</label>
                    <div class="flex items-center space-x-3">
                        <input type="text" id="comment_contact" name="comment_contact" rows="2" class="flex-1 px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500"></textarea>
                        <button type="button" class="delete-btn px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition duration-150">삭제</button>
                    </div>
                </div>
            </div>
            <div class="flex justify-end space-x-3">
                <button type="submit" class="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-orange-700 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:ring-offset-2 transition duration-150">블라인드</button>
                <button type="button" class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition duration-150" onclick="closeProductModal()">취소</button>
            </div>
        </form>
    </div>
</div>
