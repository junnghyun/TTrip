<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="http://192.168.10.228/jsp_prj/common/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/content.css?v=2023010400142124b5e-3e78-4c2d-9000-9954ac7cb338" />
<link id="tgpr_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/theme/travel100scene/cont.css?v=2024072900142124b5e-3e78-4c2d-9000-9954ac7cb338">
<link id="curation_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/curation.css?v=2023012100142124b5e-3e78-4c2d-9000-9954ac7cb338"/>
<!--  bootstrap CDN 시작-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<!--  jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
$(function(){

});//ready
</script>
<jsp:include page="../common/header.jsp"/>
</head>
<body>
	<div id="contents" class="aiplanner" style="width: auto">
		<div class="cockcock_planner">
			<div class="showcase">
				<div class="inr">
					<img src="${pageContext.request.contextPath}/ttrip/main/images/curation/img_planner_tit.png"
						class="pc"
						alt="AI콕콕 플래너 - 당신이 원하는 여행의 시작 1분이면 끝! 나만을 위한 여행 코스 추천. 대한민국구석구석 x Tmap x 한국관광 데이터랩 Data Lab x 공공데이터포털">
					<img src="${pageContext.request.contextPath}/ttrip/main/images/curation/img_planner_m_tit.jpg"
						class="mo"
						alt="AI콕콕 플래너 - 당신이 원하는 여행의 시작 1분이면 끝! 나만을 위한 여행 코스 추천. 대한민국구석구석 x Tmap x 한국관광 데이터랩 Data Lab x 공공데이터포털">
					<div class="map">
						<span class="spot1"></span> <span class="spot2"></span> <span
							class="spot3"></span>
					</div>
					<div class="tag">
						<span> <img
							src="${pageContext.request.contextPath}/ttrip/main/images/curation/img_planner_tag.png" class="pc"
							alt="#맞춤형 코스 추천 #마음대로 편집 가능">
						</span>
						<button type="button">
							<img src="${pageContext.request.contextPath}/ttrip/main/images/curation/btn_planner_tag.png"
								class="pc" alt="#BEST 코스 도전">
						</button>
						<div class="tip">
							<div class="pc">
								<em>TIP</em>
								<p>
									코스를 ‘공개’하면 BEST코스 도전 가능!<br>‘비공개’하면 나만의 코스로 간직할 수 있어요.
								</p>
							</div>
							<img src="${pageContext.request.contextPath}/ttrip/main/images/curation/bg_planner_m_tip.png"
								class="mo" alt="">
						</div>
					</div>
					<div class="btn">
						<a href="javascript:GoCreateCourse(1);">
							<div class="pc">
								<em>코스만들기</em> <span class="arw_wrap"> <span class="left"></span>
									<span class="right"></span>
								</span>
							</div> <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/btn_planner_m_cos.png"
							class="mo" alt="">
						</a> <span class="mo"><button type="button"
								onclick="layerPopup.layerShow('aiPlannerPop');">AI콕콕
								플래너란?</button></span>
					</div>
				</div>
			</div>
			<div class="tab">
				<ul>
					<li class=""><a href="#plannerTab3" class="mo_tab"
						onclick="getCurationMainPlannerBestContents(true)">다른 사용자코스</a></li>
					<li id="my" class="on"><a href="/main_mytripcourse"
						onclick="getMyPlannerCourse(true);">나의 여행코스</a></li>
					<li id="best" class=""><a href="/main_monthbest"
						onclick="getCurationMainPlannerBestContents(true);">월간Best30</a></li>
					<li id="area" class=""><a href="/main_tripboard"
						onclick="settingRegionPlannerCourse(true);">여행게시판</a></li>
				</ul>
			</div>
			<div id="plannerTab2" class="tab_cont active" style="display: block;">
				<h4>나의 여행 코스</h4>
				<div class="planner_list myPlannerList">
					<button type="button" class="all_del" onclick="deleteAllCourse();">전체
						코스 삭제</button>
					<ul class="my_cos">
						<li tabindex="0"><span
							onclick="goDetailCourse('c1b76431-4304-4840-9fdf-e3aff683fe2a')"
							class="img"> <img
								src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=982dfc68-c20b-46cb-a34e-da41c57f7081"
								alt="">
						</span>
							<div class="cont">
								<span class="day">1박2일</span> <a
									href="javascript:goDetailCourse('c1b76431-4304-4840-9fdf-e3aff683fe2a');">서울
									여행코스</a> <span class="area">서울 </span>
								<div class="date">
									<em>만든날짜</em> <span>2024. 12. 6.</span>
								</div>
								<div class="tag">
									<span></span>
								</div>
								<div class="rate">
									<div class="grade">
										<div class="star">
											<span style="width: 100%">총5점 중 5.0점</span>
										</div>
										<span class="total"><em class="blind">별점 매긴 사람 수</em>1</span>
									</div>
									<span class="comment"><em class="blind">댓글수</em>0</span>
								</div>
								<div class="thumbnail">
									<span><img
										src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=097c39e3-57f1-4b2a-abc6-901ca73a5afd"
										alt="힐링코스"></span> <span><img
										src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=0c69cac2-2569-40ce-9494-f254b802c746"
										alt="힐링코스"></span> <span> <img
										src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=2772b0e9-5767-4b84-8929-51f7ebc161b1"
										alt="힐링코스"> <a
										href="javascript:goDetailCourse('c1b76431-4304-4840-9fdf-e3aff683fe2a');"></a>
									</span>
								</div>
							</div>
							<button type="button" class="delete"
								onclick="deleteCourse('c1b76431-4304-4840-9fdf-e3aff683fe2a',this);">삭제</button>
						</li>
					</ul>
					<div class="more" style="display: none;">
						<button onclick="getMyPlannerCourse(false);" type="button"
							class="type1">더보기</button>
					</div>
				</div>
				<div class="planner_list myPannerNoData" style="display: none">
					<!-- 로그인 후 -->
					<div class="no_data">
						<strong>아직 제작한 코스가 없어요. 😨</strong>
						<p>맞춤형 여행 코스 추천 받아보세요.</p>
					</div>
					<!-- //로그인 후 -->
					<!-- 로그인 후
                <div class="no_data">
                    <strong>아직 제작한 코스가 없어요.   😨</strong>
                    <p>맞춤형 여행 코스 추천 받아보세요.</p>
                </div>
                -->
				</div>
			</div>


		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>