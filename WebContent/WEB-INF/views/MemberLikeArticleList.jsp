<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 추천한 글</title>
<!--아이콘 링크 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>   	
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/notice.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function () 
	{
		/* 메인페이지 외 상단바 */
		// $('.logo a, .right-menu').css('color','black');

		/* header 변수 */
		var header = $('#header').offset();

		/* header 상단바 scroll 시 고정 스크립트 */
		$(window).scroll(function () 
		{
			if ($(document).scrollTop() > header.top) 
			{
				$('#header').addClass('headerFixed');
			}
			else 
			{
				$('#header').removeClass('headerFixed');
			}
		});
		
		
	});
</script>

</head>

<body>

<div id="wrap">
	<div id="header">
		<div class="top">
			<!-- top-width -->
        <div class="top-width">
          		<div class="btn_main">
            		<a href="main.action">
              			<div class="xi-home-o">
              			</div>
              			Main
            		</a>
          		</div>
          		<ul class="user_menu">
          			<c:choose>
          				<c:when test="${sessionScope.admin != null }">
          					<li id="adminPage"><a href="adminmain.action"">관리자 페이지</a></li>
          				</c:when>
          			</c:choose>
          			<c:choose>
          				<c:when test="${sessionScope.name == null }">
          					<li id="loginBtn"><a href="loginopen.action">로그인</a></li>
          				</c:when>
          				<c:otherwise>
          					<li id="logoutBtn"><a href="logout.action">로그아웃</a></li>
          				</c:otherwise>
          			</c:choose>
          			<c:choose>
          				<c:when test="${sessionScope.name == null }">
          					<li id="#"><a href="tosagreeopen.action">회원가입</a></li>
          				</c:when>
          				<c:otherwise>
          					<li id="#"><a href="#"></a></li>
          				</c:otherwise>
          			</c:choose>
            		<li><a href="mypage.action" id="myPage">마이페이지</a></li>
            		<li><a href="qnainsertform.action" id="QnA">고객센터</a></li>
          		</ul>
        	</div><!-- end .top-width -->
		</div><!-- end .top -->
		<nav class="sub_navbar">
			<div class="logo"> <a href="main.action"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획</a> </div><!-- end .logo -->
			<!-- right-menu -->
			<div class="right-menu">
				<ul>
					<li><a href="notice_list.action">공지사항</a></li>
            		<li><a href="plannerlist.action">플래너</a></li>
            		<li><a href="storyopen.action">커뮤니티</a></li>
				</ul>
			</div><!-- end .right-menu -->
		</nav><!-- end .navbar -->
	</div><!-- end .header -->

	<div id="container">
		<div class="ct_nav">
			<ul>
				<li>
					<a href="main.action">
						<div class="xi-home"></div>
					</a></li>
				<li class="nav_text"><span><a href="#">${memberId } 님이 추천한 글</a></span></li>
			</ul>
		</div>
		<div class="ct_title">
			<h1></h1>
		</div>
		<div class="notice_main">
			<div>
				<span href="#" style="color: black; font-size: 30px;">${memberId } 님이 추천한 글</span>
				<hr>
			</div>
			<div class="notice_bottom">
				<div class="notice_title">
				</div>
				<br>
				<div class="notice_content">
					<table>
						<tr class="notice_table_tr">
							<th>게시판</th>
							<th>No.</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
						<c:forEach var="article" items="${lists }">
						<tr>
							<td>${article.boardTypeDetail }</td>
							<td>${article.bno }</td>
							<c:choose>
								<c:when test="${pageNum == null }">
								<td><a href="javascript:location.href='memberdetailopen.action?articleCode=${article.articleCode }&bno=${article.bno }&pageNum=${pageNum = 1 }&memberId=${memberId }'"  style="color: black;">${article.articleTitle }</a></td>
								</c:when>
								<c:when test="${pageNum != null }">
								<td><a href="javascript:location.href='memberdetailopen.action?articleCode=${article.articleCode }&bno=${article.bno }&pageNum=${pageNum }&memberId=${memberId }'"  style="color: black;">${article.articleTitle }</a></td>
								</c:when>
							</c:choose>
							<td>${article.memberId }</td>
							<td>${article.articleDate }</td>
							<td>${article.articleHit }</td>
							<td>${article.articleLike }</td>
						</tr>
						</c:forEach>
					</table><!-- end .table -->
					<div class="table_bottom">
						<div class="paging">
							<c:if test="${dataCount != 0 }">
								<span style="color: black">${pageIndexList }</span>
							</c:if>
						</div><!-- end .paging -->
					</div><!-- end .table_bottom -->
				</div><!-- end .notice_content -->
			</div>
		</div><!-- end .my_main-->

	</div><!-- end .container-->

	<footer id="-footer" class="-footer">
		<div class="footerinfowrap">
	        <div class="-frame">
	          	<table border="0" summary="" cellspacing="0" cellpadding="0">
		            <colgroup>
		              <col style="width:auto;">
		              <col style="width:14%;">
		              <col style="width:23%;">
		              <col style="width:23%;">
		            </colgroup>
		            <tbody>
		              	<tr>
			                <td scope="col">
			                  <div class="companyInfo">
			                    <ul>
			                      <li> <span class="dd">스케블러</span>
			                        <span class="dd"><b>대표.</b> </span>
			                        <span class="dd"><b>TEL.</b> 1577-1575</span>
			                        <span class="dd"><b>사업자등록번호.</b>
			                          <a href="#" class="btn">612-123-12345</a></span>
			
			                      </li>
			                      <li>
			                        <span class="dd">
			                          <b>주소.</b> 서울특별시 강남구
			                        </span>
			                      </li>
			                    </ul>
			                  </div>
			                  <div class="copyright">Copyright © <b>스케블러</b> all rights reserved.</div>
			                </td>
			                <td scope="col">
			                  <div class="footerinfo">
			                    <div class="title">QUICK</div>
			                    <ul>
	                  <c:choose>
	                  	<c:when test="${membercode eq null }">
	                  		<li><a href="loginopen.action">로그인</a> </li>
	                     	<li><a href="tosagreeopen.action">회원가입</a> </li>
	                  	</c:when>
	                  	<c:otherwise>
	                  		<li><a href="logout.action">로그아웃</a> </li>
	                  	</c:otherwise>
	                  </c:choose>
                
                     <li><a href="mypage.action">마이페이지</a></li>
                     <li><a href="notice_list.action">공지사항</a></li>
                     <li><a href="qnainsertform.action">고객센터</a></li>
                     <li><a href="storyopen.action">커뮤니티</a></li>
                  </ul>
			                  </div>
			                </td>
			                <td scope="col">
			                  <div class="footerinfo">
			                    <div class="title">CALL CENTER</div>
			                    <div class="data d1_fc_kor">
			                      <p class="call"><span client="callnumber">1234-5678</span></p>
			                      <p><span client="openinfo1">평일 오전 10:00 - 오후 6:00</span></p>
			                      <p><span client="openinfo2">점심시간 오후 12:00 - 오후 1:00</span></p>
			                      <p><span client="openinfo3">토.일.공휴일 휴무</span></p>
			                    </div>
			                  </div>
			                  <div class="footerinfo">
			                    <div class="title">RETURN / EXCHANGE</div>
			                    <div class="data d1_fc_kor">
			                      <p><span>서울특별시 강남구 </span></p>
			                    </div>
			                  </div>
			                </td>
		              	</tr>
		            </tbody>
	          	</table>
	          	<div class="footerbottom">
		            <div class="snswrap">
						<ul>
						  	<li class="-sns_blog"><a href="#none" target="_blank"><i class="xi-blogger"></i></a></li>
						  	<li class="-sns_facebook"><a href="#none" target="_blank"><i class="xi-facebook"></i></a></li>
						  	<li class="-sns_instagram"><a href="#none" target="_blank"><i class="xi-instagram"></i></a></li>
						  	<li class="-sns_katalk"><a href="#none" target="_blank"><i class="xi-kakaotalk"></i></a></li>
						  	<li class="-sns_kastory"><a href="#none" target="_blank"><i class="xi-kakaostory"></i></a></li>
						</ul>
		            </div><!-- end .snswrap -->
          		</div><!-- end .footerbottom-->
			</div><!-- end .-frame -->
		</div><!-- end .footerinfowrap -->

	</footer><!-- end footer -->

</div><!-- end .wrap -->

</body>

</html>