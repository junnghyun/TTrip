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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/content.css?v=2023010400142124b5e-3e78-4c2d-9000-9954ac7cb338" />
<link id="tgpr_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/theme/travel100scene/cont.css?v=2024072900142124b5e-3e78-4c2d-9000-9954ac7cb338">
<link id="curation_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/curation.css?v=2023012100142124b5e-3e78-4c2d-9000-9954ac7cb338"/>
<!--  bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!--  jQuery CDN 시작-->
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
<div id="contents" class="aiplanner" style="width: auto">
    <div class="cockcock_planner">
        <div class="showcase">
            <div class="inr">
                <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/img_planner_tit.png" class="pc" alt="AI콕콕 플래너 - 당신이 원하는 여행의 시작 1분이면 끝! 나만을 위한 여행 코스 추천. 대한민국구석구석 x Tmap x 한국관광 데이터랩 Data Lab x 공공데이터포털">
                <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/img_planner_m_tit.jpg" class="mo" alt="AI콕콕 플래너 - 당신이 원하는 여행의 시작 1분이면 끝! 나만을 위한 여행 코스 추천. 대한민국구석구석 x Tmap x 한국관광 데이터랩 Data Lab x 공공데이터포털">
                <div class="map">
                    <span class="spot1"></span>
                    <span class="spot2"></span>
                    <span class="spot3"></span>
                </div>
                <div class="tag">
                                    <span>
                                        <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/img_planner_tag.png" class="pc" alt="#맞춤형 코스 추천 #마음대로 편집 가능">
                                    </span>
                    <button type="button">
                        <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/btn_planner_tag.png" class="pc" alt="#BEST 코스 도전">
                    </button>
                    <div class="tip">
                        <div class="pc">
                            <em>TIP</em>
                            <p>코스를 ‘공개’하면 BEST코스 도전 가능!<br>‘비공개’하면 나만의 코스로 간직할 수 있어요.</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/bg_planner_m_tip.png" class="mo" alt="">
                    </div>
                </div>
                <div class="btn">
                    <a href="javascript:GoCreateCourse(1);">
                        <div class="pc">
                            <em>코스만들기</em>
                            <span class="arw_wrap">
                                                <span class="left"></span>
                                                <span class="right"></span>
                                            </span>
                        </div>
                        <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/btn_planner_m_cos.png" class="mo" alt="">
                    </a>
                    <span class="mo"><button type="button" onclick="layerPopup.layerShow('aiPlannerPop');">AI콕콕 플래너란?</button></span>
                </div>
            </div>
        </div>
        <div class="tab">
            <ul>
                <li class=""><a href="#plannerTab3" class="mo_tab" onclick="getCurationMainPlannerBestContents(true)">다른 사용자코스</a></li>
                <li id="my"><a href="mytripcourse.jsp" onclick="getMyPlannerCourse(true);">나의 여행코스</a></li>
                <li id="best" class=""><a href="monthbest.jsp" onclick="getCurationMainPlannerBestContents(true);">월간Best30</a></li>
                <li id="area" class="on"><a href="maintripboard.jsp" onclick="settingRegionPlannerCourse(true);">여행게시판</a></li>
            </ul>
        </div>
	<div id="plannerTab4" class="tab_cont active" style="display: block;">
	            <h4>여행 게시판</h4>
	            <div class="planner_list bestPlannerList">
	                <ul><li tabindex="0">
	                  <span onclick="goDetailCourse('2ceaa576-5882-4ccc-8fbf-3f5ccbea4a76')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=ff2c7736-ff11-4a4f-8f81-2b84704d2e64" alt="">   <span class="profile"><img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">당일여행</span>
	                      <a href="javascript:goDetailCourse('2ceaa576-5882-4ccc-8fbf-3f5ccbea4a76');">제주도 여행코스</a>
	                      <span class="area">제주 </span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 26.</span>
	                      </div>
	                      <div class="tag mo">        <span>#식도락</span>        <span>#카페</span>        <span>#문화.역사</span>        <span>#바다</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span >총5점 중 4.6점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>6</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>6</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('023df494-e6f1-4685-ac47-604997b3158d')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=36c2513c-b9eb-4593-b0bb-3c2f2a5a77b1" alt="">   <span class="profile"><img src="https://k.kakaocdn.net/dn/dEaSMZ/btsIAWupXBR/1HLfXYFlsm3Fa1ESgMiyv1/m1.jpg" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">1박2일</span>
	                      <a href="javascript:goDetailCourse('023df494-e6f1-4685-ac47-604997b3158d');">전북 고창군 여행코스</a>
	                      <span class="area">전북 고창군</span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 2. 21.</span>
	                      </div>
	                      <div class="tag mo">        <span>#식도락</span>        <span>#문화.역사</span>        <span>#바다</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        <span>#카페</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.6점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>56</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>40</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('02329793-86c7-421f-9ec9-9626558f94db')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=d6b9eca7-e0be-4fdc-b429-98d77ecd5768" alt="">   <span class="profile"><img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">2박3일</span>
	                      <a href="javascript:goDetailCourse('02329793-86c7-421f-9ec9-9626558f94db');">제주도 여행코스</a>
	                      <span class="area">제주 </span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 2. 12.</span>
	                      </div>
	                      <div class="tag mo">        <span>#바다</span>        <span>#식도락</span>        <span>#산.자연</span>        <span>#카페</span>        <span>#문화.역사</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.4점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>67</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>46</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('2a068a0e-1f3b-4f5f-b773-cef2d48f50b8')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=7ae3ea49-2ab7-4c9d-8c4e-e37a50a7e5da" alt="">   <span class="profile"><img src="https://lh3.googleusercontent.com/a/ACg8ocIm6DNc63kAnDvl2HU5TzOzNeEsi4jpdKNLdB4voSeD3wNj2w=s96-c" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">1박2일</span>
	                      <a href="javascript:goDetailCourse('2a068a0e-1f3b-4f5f-b773-cef2d48f50b8');">광주 여행코스</a>
	                      <span class="area">광주 </span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2023. 11. 15.</span>
	                      </div>
	                      <div class="tag mo">        <span>#식도락</span>        <span>#문화.역사</span>        <span>#산.자연</span>        <span>#바다</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        <span>#카페</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.5점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>17</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>9</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('19fa8280-1168-42cc-8187-d612efe32531')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=266485eb-fc0f-4da3-b3b2-f26a6243b46c" alt="">   <span class="profile"><img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">1박2일</span>
	                      <a href="javascript:goDetailCourse('19fa8280-1168-42cc-8187-d612efe32531');">서울 여행코스</a>
	                      <span class="area">서울 </span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 26.</span>
	                      </div>
	                      <div class="tag mo">        <span>#식도락</span>        <span>#문화.역사</span>        <span>#바다</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        <span>#카페</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.4점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>12</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>11</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('01b47777-7834-417f-9b4b-a6c593c1f241')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=83af39e2-5b63-4ad8-af2f-a02e5b225548" alt="">   <span class="profile"><img src="https://img1.kakaocdn.net/thumb/R640x640.q70/?fname=http://t1.kakaocdn.net/account_images/default_profile.jpeg" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">1박2일</span>
	                      <a href="javascript:goDetailCourse('01b47777-7834-417f-9b4b-a6c593c1f241');">충남 금산군 여행코스</a>
	                      <span class="area">충남 금산군</span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 1. 25.</span>
	                      </div>
	                      <div class="tag mo">        <span>#산.자연</span>        <span>#식도락</span>        <span>#문화.역사</span>        <span>#바다</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        <span>#카페</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.3점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>35</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>27</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('08185831-1030-403a-93fb-c9a61a88cb25')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=fa2f6317-50cc-40d1-9873-97f6c562961e" alt="">   <span class="profile"><img src="https://t1.kakaocdn.net/account_images/default_profile.jpeg.twg.thumb.R640x640" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">당일여행</span>
	                      <a href="javascript:goDetailCourse('08185831-1030-403a-93fb-c9a61a88cb25');">전남 화순군 여행코스</a>
	                      <span class="area">전남 화순군</span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 25.</span>
	                      </div>
	                      <div class="tag mo">        <span>#문화.역사</span>        <span>#식도락</span>        <span>#카페</span>        <span>#바다</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.8점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>2</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>2</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('34abaa67-4020-4d54-b929-50ce14491313')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=c7b45d12-09aa-4aaa-9957-547c32764a71" alt="">   <span class="profile"><img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">당일여행</span>
	                      <a href="javascript:goDetailCourse('34abaa67-4020-4d54-b929-50ce14491313');">서울 여행코스</a>
	                      <span class="area">서울 </span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 27.</span>
	                      </div>
	                      <div class="tag mo">        <span>#문화.역사</span>        <span>#식도락</span>        <span>#카페</span>        <span>#바다</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 5.0점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>4</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>2</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('0320843f-3b4a-4b9a-85b2-1d7f6dd3fcef')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=825a8641-d6d2-4bd8-a17f-31486f8a291a" alt="">   <span class="profile"><img src="https://k.kakaocdn.net/dn/nNm0T/btsHjuL3pNc/N1vRek03Oz6HRjrCQ4lM5k/img_640x640.jpg" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">1박2일</span>
	                      <a href="javascript:goDetailCourse('0320843f-3b4a-4b9a-85b2-1d7f6dd3fcef');">울산 여행코스</a>
	                      <span class="area">울산 </span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 27.</span>
	                      </div>
	                      <div class="tag mo">        <span>#바다</span>        <span>#식도락</span>        <span>#카페</span>        <span>#문화.역사</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.3점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>12</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>4</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('071c4225-576a-43c6-9f00-59d9a3b27910')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=3972a4a1-0266-4583-abc9-714f30bfa496" alt="">   <span class="profile"><img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">1박2일</span>
	                      <a href="javascript:goDetailCourse('071c4225-576a-43c6-9f00-59d9a3b27910');">경남 남해군 여행코스</a>
	                      <span class="area">경남 남해군</span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 16.</span>
	                      </div>
	                      <div class="tag mo">        <span>#문화.역사</span>        <span>#식도락</span>        <span>#카페</span>        <span>#바다</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.5점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>12</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>11</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('4b9d667a-b2da-49d5-94c2-138ca8982bdd')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=177e7922-3009-4a74-b826-06f5bdb338ac" alt="">   <span class="profile"><img src="https://phinf.pstatic.net/contact/20170117_201/1484614714050BbrHV_JPEG/gm3bxhin8va-daria-nepriakhina.jpg" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">1박2일</span>
	                      <a href="javascript:goDetailCourse('4b9d667a-b2da-49d5-94c2-138ca8982bdd');">충남 보령시 여행코스</a>
	                      <span class="area">충남 보령시</span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 27.</span>
	                      </div>
	                      <div class="tag mo">        <span>#바다</span>        <span>#문화.역사</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#식도락</span>        <span>#액티비티</span>        <span>#축제</span>        <span>#카페</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.3점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>3</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>3</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('33c5d5b5-c289-45b1-92de-3def787dce11')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=ae0abff3-4bfe-4bce-a47f-5f81db82c714" alt="">   <span class="profile"><img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">1박2일</span>
	                      <a href="javascript:goDetailCourse('33c5d5b5-c289-45b1-92de-3def787dce11');">시흥 여행코스</a>
	                      <span class="area">경기 시흥시</span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2023. 11. 14.</span>
	                      </div>
	                      <div class="tag mo">        <span>#문화.역사</span>        <span>#산.자연</span>        <span>#식도락</span>        <span>#카페</span>        <span>#바다</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.7점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>9</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>7</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('5057115f-3eaf-4b57-9d6c-0d0ade780254')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=97f00e64-2da2-4654-a48a-a1a457fe4aef" alt="">   <span class="profile"><img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">당일여행</span>
	                      <a href="javascript:goDetailCourse('5057115f-3eaf-4b57-9d6c-0d0ade780254');">전북 익산시 여행코스</a>
	                      <span class="area">전북 익산시</span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 26.</span>
	                      </div>
	                      <div class="tag mo">        <span>#문화.역사</span>        <span>#식도락</span>        <span>#카페</span>        <span>#바다</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 5.0점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>5</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>3</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('409b2f02-366d-4fab-9524-e0f3591b47d8')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=87f97154-896a-4a27-bfbb-c4022588dc5e" alt="">   <span class="profile"><img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">당일여행</span>
	                      <a href="javascript:goDetailCourse('409b2f02-366d-4fab-9524-e0f3591b47d8');">대구 여행코스</a>
	                      <span class="area">대구 </span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 26.</span>
	                      </div>
	                      <div class="tag mo">        <span>#식도락</span>        <span>#카페</span>        <span>#문화.역사</span>        <span>#바다</span>        <span>#산.자연</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.8점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>9</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>10</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('0ff5065c-15e4-4441-87a6-1d00d804572e')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=d8273aab-587b-458a-b87a-1dc8e45fb2a1" alt="">   <span class="profile"><img src="https://phinf.pstatic.net/contact/20210711_160/1625989019381rrITW_JPEG/image.jpg" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">2박3일</span>
	                      <a href="javascript:goDetailCourse('0ff5065c-15e4-4441-87a6-1d00d804572e');">제주도 여행코스</a>
	                      <span class="area">제주 </span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 26.</span>
	                      </div>
	                      <div class="tag mo">        <span>#산.자연</span>        <span>#식도락</span>        <span>#바다</span>        <span>#액티비티</span>        <span>#카페</span>        <span>#문화.역사</span>        <span>#쇼핑</span>        <span>#축제</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 4.7점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>7</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>5</span>
	                        </div>
	                    </div>
	                </li><li tabindex="0">
	                  <span onclick="goDetailCourse('41850892-673e-49d2-8d81-811f8e37e01c')" class="img">
	                      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=64413f3f-68e0-4eaa-b381-3fbc4a442ede" alt="">   <span class="profile"><img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필"></span></span>
	                  <div class="cont">
	                      <span class="day">당일여행</span>
	                      <a href="javascript:goDetailCourse('41850892-673e-49d2-8d81-811f8e37e01c');">경북 상주시 여행코스</a>
	                      <span class="area">경북 상주시</span>
	                      <div class="date">
	                          <em>만든날짜</em>
	                          <span>2024. 5. 26.</span>
	                      </div>
	                      <div class="tag mo">        <span>#산.자연</span>        <span>#식도락</span>        <span>#문화.역사</span>        <span>#바다</span>        <span>#쇼핑</span>        <span>#액티비티</span>        <span>#축제</span>        <span>#카페</span>        </div>
	                       <div class="rate">
	                            <div class="grade">
	                                <div class="star">
	                                    <span>총5점 중 5.0점</span>
	                                </div>
	                                <span class="total"><em class="blind">별점 매긴 사람 수</em>3</span>
	                            </div>
	                            <span class="comment"><em class="blind">댓글수</em>4</span>
	                        </div>
	                    </div>
	                </li></ul>
	                <div class="more">
	                    <button onclick="settingCurationMainPlannerBestCourse();"><span class="mo">월간 베스트 코스 </span>더보기</button>
	                </div>
	            </div>
	        </div>


    </div>
</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>