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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/dstnt/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/dstnt/css/content.css?v=2023010400142124b5e-3e78-4c2d-9000-9954ac7cb338" />
<link id="tgpr_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/dstnt/css/theme/travel100scene/cont.css?v=2024072900142124b5e-3e78-4c2d-9000-9954ac7cb338">
<link id="curation_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/dstnt/css/curation.css?v=2023012100142124b5e-3e78-4c2d-9000-9954ac7cb338"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">


</style>
<script type="text/javascript">
$(function(){

});//ready
</script>
<jsp:include page="../common/header.jsp"/>
</head>
<body>
<div id="wrap">
<div id="contents">
	<!-- 상단 -->
	<div class="titleType1">
		<div class="area_tag">
				<span class="name1"><a href="/list/ms_list.do"><span class="ico">All</span>여행지</a></span>
			<div class="brandingIcon"><ul class="lodging"></ul></div>
		</div>
		<h2 id="topTitle">도원</h2>
		<div class="area_address" id="topAddr"><span>전북 전주시</span></div>
	</div>
	<!-- //상단 -->

	<!-- 내용 -->
	<div class="db_cont_detail">
		<div class="detail_tab">
			<ul>
				<li class="select_tab on" id="photoTab"><a href="javascript:tabChange('galleryGo');" title="사진 보기 위치로 이동"><span>사진보기</span></a></li>
				<li class="select_tab" id="detailTab"><a href="javascript:tabChange('detailGo');" title="상세정보 위치로 이동"><span>상세정보</span></a></li>
			</ul>
		</div>

		<!-- 사진보기 -->
		<div id="galleryGo">
			<div class="photo_gallery">
				<!-- 공사 사진 영역 -->
					<div style="width: 75%;padding-left: 25%; ">
						  <a href="javascript:;">
						  	 <img alt="도원 1" onclick="openPhotoView(0)" style="width:100%; height:100%;object-fit: contain;" tabindex="0" src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=4ec2d787-877b-4ad0-b0db-aba45f328e1b">
						  </a>
					</div>
			</div>
		</div>
		<!-- //사진보기 -->

		<!-- 상세정보 -->
		<div id="detailGo">
			<!-- 내용더보기 -->
			<div class="wrap_contView">
				<h3>상세정보</h3>
				<!-- //내용더보기 -->
				<div class="area_txtView top" style="padding-bottom: 0px;">
					<div class="inwebmsg" style="display: none;">
						<a href="https://korean.visitkorea.or.kr/list/travelinfo.do?service=digt">
							<img src="${pageContext.request.contextPath}/ttrip/dstnt/images/sub/banner_inwebmsg.jpg?v=20240618001" class="pc" alt="오늘부터 나도 명예주민!꿀 혜택 받고, 34개 지역 여행 떠나보세요! 디지털 관광주민증 무료 발급 받기">
							<img src="${pageContext.request.contextPath}/ttrip/dstnt/images/sub/banner_m_inwebmsg.png" class="mo" alt="오늘부터 나도 명예주민!꿀 혜택 받고, 34개 지역 여행 떠나보세요! 디지털 관광주민증 무료 발급 받기">
						</a>
					</div>
					<!-- 맛집 제보 코멘트 -->
					<div class="gastroventure_report">
						<!-- <div class="report_box">
                    여기에 값 넣기
                            </div> -->
					</div>
					<div class="inr_wrap" style="overflow: visible; height: auto;">
						<div class="inr">
							<p>다가도원은 객리단길에 위치한 한옥독채스테이다. 마당에서 실외 욕조를 사용 할 수 있다. 오직 한 팀만을 위한 독채 숙소로 운영 중이다. 빔프로젝터, 블루투스 스피커, 스탠드 조명, 루미큐브, 윷놀이까지 많은 즐길거리들이 있다. </p>
						</div>
					</div>
					<div class="cont_more" style="display: none;">
						<button type="button" class="btn_more" title="내용더보기">
							내용 <span>더보기</span>
						</button>
					</div>
				</div>
			</div>
			<h3 class="blind">상세정보</h3>
			<!-- 주변정보 지도 -->
			<div class="surroundingsMap" id="detailGo">
				<div class="map_skip"><a id="map_jump" href="#detailinfoview">지도 건너뛰기</a></div>
				<div id="map" class="wrap_map" style="overflow: hidden; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_tile.png&quot;);"> <!-- open 클래스 추가 시 지도 확장-->
					<img src="${pageContext.request.contextPath}/ttrip/dstnt/images/sub/map_dim01.png" alt="" style="width: 100%; height: 100%;">



					<a href="javascript:landingLocationMap();" class="btn_map" id="showMap">여행지도보기</a>



					<div class="layer" tabindex="0">
						<span class="img"><a href="javascript:;"><img src="" alt=""></a></span>
						<div>
							<strong><a href="javascript:;"></a></strong>
							<span class="area"></span>
							<span class="km"></span>
							<div class="btn">
								<button type="button" class="bookmark" onclick="setFavoContentDetail(2);">즐겨찾기</button>
								<button type="button" class="good" onclick="setLike(2);">좋아요</button>
								<button type="button" class="course" onclick="MycourseAddContent(2);">코스담기</button>
								<button type="button" class="guide roadbutton">길안내</button>
							</div>
						</div>
						<button type="button" class="close">닫기</button>
					</div>
					<div class="map_menu">
						<button type="button" class="view" style="display : none;">상세보기</button>
						<ul>
							<li><button type="button"><span class="icon1">주변 여행지</span></button></li>
							<li><button type="button"><span class="icon2">음식점</span></button></li>
							<li><button type="button"><span class="icon3">카페</span></button></li>
							<li><button type="button"><span class="icon4">숙소</span></button></li>
							<li><button type="button"><span class="icon5">주차장</span></button></li>
						</ul>
					</div>
				<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: default;"><div style="position: absolute;"><div style="position: absolute; z-index: 0;"></div><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/309/236.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -20px; top: -107px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/309/237.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 236px; top: -107px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/309/238.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 492px; top: -107px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/310/236.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -20px; top: -363px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/310/237.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 236px; top: -363px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/310/238.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 492px; top: -363px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/309/239.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 748px; top: -107px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/309/240.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1004px; top: -107px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/310/239.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 748px; top: -363px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/310/240.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1004px; top: -363px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/308/236.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -20px; top: 149px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/308/237.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 236px; top: 149px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/308/238.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 492px; top: 149px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/308/239.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 748px; top: 149px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://mts.daumcdn.net/api/v1/tile/PNGSD02/v04_3zpx5/latest/5/308/240.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1004px; top: 149px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"></div><div style="position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1; width: 938px; height: 298px;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -1876px; top: -596px; width: 4690px; height: 1490px;" viewBox="0 0 4690 1490"><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);"><div style="position: absolute; margin: -46px 0px 0px -30px; z-index: 0; left: 455px; top: 71px; display: block;"><img draggable="false" src="/resources/images/sub/icon_map_menu06.png" alt="" role="presentation" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 30px, 46px, 0px); top: 0px; left: 0px; width: 30px; height: 46px;"></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);"><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;"><div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 58px;"></div><div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">250m</div></div><div style="margin: 0px 4px; float: left;"><a target="_blank" href="http://map.kakao.com/" style="float: left; width: 32px; height: 10px;"><img src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png" alt="Kakao 맵으로 이동(새창열림)" style="float: left; width: 32px; height: 10px; border: none;"></a><div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div></div>
			</div>
			<!-- //주변정보 지도 -->
			<div class="wrap_contView" id="detailinfoview">
				<!-- 세부 정보 -->
				<div class="area_txtView bottom" style="padding-bottom: 54px;">
					<div class="inr_wrap" style="overflow: hidden; height: 150px;">
						<div class="inr">
							<ul>
							<li>
							<strong>문의 및 안내</strong>
							<span class="mo">
							<a href="tel:010-7678-3683">010-7678-3683</a>
							</span>
							<span class="pc">010-7678-3683</span>
							</li>
							<li>
							<strong>주소</strong><span>전북특별자치도 전주시 완산구 팔달로 58-3 (서서학동)</span>
							</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- //세부 정보 -->
			</div>
		</div>
		<!-- //내용 -->
	</div>

    <!-- //contents -->
</div>
</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>