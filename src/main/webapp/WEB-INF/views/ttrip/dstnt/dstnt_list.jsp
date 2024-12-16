<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://192.168.10.228/jsp_prj/common/images/favicon.ico">
<!--  bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!--  jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/dstnt/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/dstnt/css/content.css?v=2023010400142124b5e-3e78-4c2d-9000-9954ac7cb338" />
<link id="tgpr_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/dstnt/css/theme/travel100scene/cont.css?v=2024072900142124b5e-3e78-4c2d-9000-9954ac7cb338">
<link id="curation_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/dstnt/css/curation.css?v=2023012100142124b5e-3e78-4c2d-9000-9954ac7cb338"/>
<style type="text/css">


</style>
<script type="text/javascript">
$(function(){

});
</script>
<jsp:include page="../common/header.jsp"/>
</head>
<body>
<div id="wrap">
	<!-- contents -->
	<div id="contents" class="travel list_blank">
		<div class="tit_cont">
			<div class="area_tag">
				<span class="name1"><span class="ico">All</span>여행지</span>
			</div>
			<h2 class="tag">#전체</h2>
		</div>

		<div class="wrap_contView clfix">

			<!-- 썸네일 리스트 -->
			<div class="box_leftType1">
				<div class="total_check">
					<strong style="margin-right: 20px;">총<span id="totalCnt">39,459</span>건</strong>
						<select size="1" name="region" id="region" class="inputBox" style="margin-right: 20px;">
						    <option value="none">광역시/도</option>
						    <option value="서울">서울</option>
						    <option value="경기도">경기도</option>
						    <option value="대구">대구</option>
						    <option value="부산">부산</option>
						</select>
						<input type="text" placeholder="찾을 장소를 입력해주세요." style="width: 200px;height:40px ;margin-right: 20px; "></input>
						<input type="button" value="검색" style="width: 80px;height:40px;">
					<div class="btn_txt">
						<button type="button" class="on" id="1" title="선택됨">최신순</button>
						<button type="button" id="3">인기순</button>
					</div>
				</div>
				<ul class="list_thumType place">
				<li class="bdr_nor">
				<div class="photo">
					<a href="javascript:;" onclick="goDetail('1572663a-b987-4826-b236-f219b17a7729','33',null);">
					<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=07de7b57-86cf-4b50-a3b0-40f9c7b1096b" alt="청춘 패러">
					</a>
				</div>
				<div class="area_txt catchphrase">
					<div class="tit">
						<a href="javascript:;" onclick="goDetail('1572663a-b987-4826-b236-f219b17a7729','33',null);">청춘 패러</a>
					</div>
					<p>충북 단양군</p>
					<p class="phrase">남녀노소 누구나 한 번쯤 해보고픈 하늘 여행!</p>
					<p class="tag">
						<span>#단양청춘패러</span>
						<span>#도깨비카페</span>
						<span>#레포츠</span>
						<span>#청춘페러</span>
						<span>#패러사진인화서비스</span>
					</p>
				</div>
				</li>
				<li>
				<div class="photo">
					<a href="javascript:;" onclick="goDetail('1572663a-b987-4826-b236-f219b17a7729','33',null);">
					<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=07de7b57-86cf-4b50-a3b0-40f9c7b1096b" alt="청춘 패러">
					</a>
				</div>
				<div class="area_txt catchphrase">
					<div class="tit">
						<a href="javascript:;" onclick="goDetail('1572663a-b987-4826-b236-f219b17a7729','33',null);">청춘 패러</a>
					</div>
					<p>충북 단양군</p>
					<p class="phrase">남녀노소 누구나 한 번쯤 해보고픈 하늘 여행!</p>
					<p class="tag">
						<span>#단양청춘패러</span>
						<span>#도깨비카페</span>
						<span>#레포츠</span>
						<span>#청춘페러</span>
						<span>#패러사진인화서비스</span>
					</p>
				</div>
				</li>
				<li>
				<div class="photo">
					<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">
					<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=23ab0e15-f722-48ad-8b0e-8fe9adde78ed" alt="목포항	">
					</a>
				</div>
				<div class="area_txt catchphrase">
					<div class="tit">
						<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">목포항</a>
					</div>
					<p>전남 목포시</p>
					<p class="phrase">부산, 인천 등과 더불어 한국을 대표하는 항구</p>
					<p class="tag">
						<span>#관광지</span>
						<span>#목포가볼만한곳</span>
						<span>#목포국제여객터미널</span>
						<span>#목포마리나요트</span>
						<span>#목포여행</span>
						<span>#목포연안여객선터미널</span>
						<span>#목포항</span>
						<span>#한국대표항구</span>
					</p>
				</div>
				</li>
								<li>
				<div class="photo">
					<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">
					<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=23ab0e15-f722-48ad-8b0e-8fe9adde78ed" alt="목포항	">
					</a>
				</div>
				<div class="area_txt catchphrase">
					<div class="tit">
						<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">목포항</a>
					</div>
					<p>전남 목포시</p>
					<p class="phrase">부산, 인천 등과 더불어 한국을 대표하는 항구</p>
					<p class="tag">
						<span>#관광지</span>
						<span>#목포가볼만한곳</span>
						<span>#목포국제여객터미널</span>
						<span>#목포마리나요트</span>
						<span>#목포여행</span>
						<span>#목포연안여객선터미널</span>
						<span>#목포항</span>
						<span>#한국대표항구</span>
					</p>
				</div>
				</li>
								<li>
				<div class="photo">
					<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">
					<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=23ab0e15-f722-48ad-8b0e-8fe9adde78ed" alt="목포항	">
					</a>
				</div>
				<div class="area_txt catchphrase">
					<div class="tit">
						<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">목포항</a>
					</div>
					<p>전남 목포시</p>
					<p class="phrase">부산, 인천 등과 더불어 한국을 대표하는 항구</p>
					<p class="tag">
						<span>#관광지</span>
						<span>#목포가볼만한곳</span>
						<span>#목포국제여객터미널</span>
						<span>#목포마리나요트</span>
						<span>#목포여행</span>
						<span>#목포연안여객선터미널</span>
						<span>#목포항</span>
						<span>#한국대표항구</span>
					</p>
				</div>
				</li>
								<li>
				<div class="photo">
					<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">
					<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=23ab0e15-f722-48ad-8b0e-8fe9adde78ed" alt="목포항	">
					</a>
				</div>
				<div class="area_txt catchphrase">
					<div class="tit">
						<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">목포항</a>
					</div>
					<p>전남 목포시</p>
					<p class="phrase">부산, 인천 등과 더불어 한국을 대표하는 항구</p>
					<p class="tag">
						<span>#관광지</span>
						<span>#목포가볼만한곳</span>
						<span>#목포국제여객터미널</span>
						<span>#목포마리나요트</span>
						<span>#목포여행</span>
						<span>#목포연안여객선터미널</span>
						<span>#목포항</span>
						<span>#한국대표항구</span>
					</p>
				</div>
				</li>
								<li>
				<div class="photo">
					<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">
					<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=23ab0e15-f722-48ad-8b0e-8fe9adde78ed" alt="목포항	">
					</a>
				</div>
				<div class="area_txt catchphrase">
					<div class="tit">
						<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">목포항</a>
					</div>
					<p>전남 목포시</p>
					<p class="phrase">부산, 인천 등과 더불어 한국을 대표하는 항구</p>
					<p class="tag">
						<span>#관광지</span>
						<span>#목포가볼만한곳</span>
						<span>#목포국제여객터미널</span>
						<span>#목포마리나요트</span>
						<span>#목포여행</span>
						<span>#목포연안여객선터미널</span>
						<span>#목포항</span>
						<span>#한국대표항구</span>
					</p>
				</div>
				</li>
								<li>
				<div class="photo">
					<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">
					<img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=23ab0e15-f722-48ad-8b0e-8fe9adde78ed" alt="목포항	">
					</a>
				</div>
				<div class="area_txt catchphrase">
					<div class="tit">
						<a href="javascript:;" onclick="goDetail('7b825fe2-6ed5-441d-8665-361fc289f32a','38',null);">목포항</a>
					</div>
					<p>전남 목포시</p>
					<p class="phrase">부산, 인천 등과 더불어 한국을 대표하는 항구</p>
					<p class="tag">
						<span>#관광지</span>
						<span>#목포가볼만한곳</span>
						<span>#목포국제여객터미널</span>
						<span>#목포마리나요트</span>
						<span>#목포여행</span>
						<span>#목포연안여객선터미널</span>
						<span>#목포항</span>
						<span>#한국대표항구</span>
					</p>
				</div>
				</li>
				</ul>
				<!-- paging -->
				<div class="page_box">
					 <a class="on" title="선택됨" href="javascript:" id="1">1</a>
					 <a href="javascript:" id="2">2</a>
				  	 <a href="javascript:" id="3">3</a>
				     <a href="javascript:" id="4">4</a>
				     <a href="javascript:" id="5">5</a>
				 </div>
				<!-- //paging -->
			</div>
			<!-- //썸네일 리스트 -->
		</div>
	</div>
</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>