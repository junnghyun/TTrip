<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <div id="storeAddModal" style="display: none;">
    <div class="modal-overlay">
        <div class="modal-content shadow-xl">
            <!-- 제목 왼쪽 정렬 -->
            <div class="bg-green-600 text-white px-6 py-4 flex items-center">
                <h2 class="text-xl font-semibold flex-grow text-left">여행지 정보 추가</h2>
                <button class="text-white hover:text-gray-200 transition duration-150" onclick="closeStoreModal()">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>
            <form action="${pageContext.request.requestURI}" method="post" class="p-6 space-y-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- 여행지 이름 -->
                    <div class="input-group md:col-span-2">
                        <label for="store_name" class="block text-sm font-medium text-gray-700 mb-1">여행지 이름</label>
                        <input type="text" id="dstnt_name" name="dstnt_name" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                    </div>
                    
                    <!-- 지역 -->
                    <div class="input-group md:col-span-2">
                        <label for="region" class="block text-sm font-medium text-gray-700 mb-1">지역</label>
                        <input type="text" id="region" name="region" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                    </div>
                    
                    <!-- 주소 -->
                    <div class="input-group md:col-span-2">
                        <label for="address" class="block text-sm font-medium text-gray-700 mb-1">주소</label>
                        <div class="relative">
                            <!-- 주소 입력란 -->
                            <input type="text" id="address" name="address" class="w-full px-3 py-2 pr-24 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500" placeholder="주소 검색을 통해 주소를 입력해주세요." readonly>
                            <!-- 버튼을 입력란 안쪽으로 배치 -->
                            <button type="button" id="findZipcode" onclick="searchZipcode('add')" class="absolute right-2 top-2 h-7 px-3 text-sm bg-green-600 text-white rounded hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 transition duration-150">
                                주소 검색
                            </button>
                        </div>
                    </div>
                    
                    <!-- 여행지 설명 -->
                    <div class="input-group md:col-span-2">
                        <label for="dstnt_detail" class="block text-sm font-medium text-gray-700 mb-1">여행지 설명</label>
                        <input type="text" id="dstnt_detail" name="dstnt_detail" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                    </div>
                    
                    <!-- 여행지 연락처 -->
                    <div class="input-group">
                        <label for="store_contact" class="block text-sm font-medium text-gray-700 mb-1">여행지 연락처</label>
                        <input type="tel" id="store_contact" name="store_contact" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500" placeholder="연락처를 입력해주세요">
                    </div>
                    
                    <!-- 여행지 상태 -->
                    <div class="input-group">
                        <label for="dstnt_status" class="block text-sm font-medium text-gray-700 mb-1">여행지 상태</label>
                        <select id="dstnt_status" name="dstnt_status" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
                            <option value="Y">영업 중</option>
                            <option value="D">폐업</option>
                            <option value="T">임시 휴업</option>
                        </select>
                    </div>
                    
                    <!-- 위도 -->
                    <div class="input-group">
                        <label for="latitude" class="block text-sm font-medium text-gray-700 mb-1">위도</label>
                        <input type="number" id="latitude" name="latitude" step="0.000001" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500" placeholder="위도" readonly>
                    </div>
                    
                    <!-- 경도 -->
                    <div class="input-group">
                        <label for="longitude" class="block text-sm font-medium text-gray-700 mb-1">경도</label>
                        <input type="number" id="longitude" name="longitude" step="0.000001" class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500" placeholder="경도" readonly>
                    </div>
                </div>
                
                <!-- 버튼 -->
                <div class="flex justify-end space-x-3">
                    <button type="button" class="px-4 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition duration-150" onclick="closeStoreModal()">취소</button>
                    <button type="submit" class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-orange-700 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:ring-offset-2 transition duration-150">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
 