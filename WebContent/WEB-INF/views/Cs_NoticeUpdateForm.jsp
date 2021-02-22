<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Cs_NoticeUpdateForm.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>  
<!--아이콘 링크 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- include summernote css/js--> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/cs_noticeupdate.css">
<script type="text/javascript">

  $(document).ready(function () {

    /* 메인페이지 외 상단바 */
    // $('.logo a, .right-menu').css('color','black');

    /* header 변수 */
    var header = $('#header').offset();

    /* header 상단바 scroll 시 고정 스크립트 */
    $(window).scroll(function () {
      if ($(document).scrollTop() > header.top) {
        $('#header').addClass('headerFixed');
      }
      else {
        $('#header').removeClass('headerFixed');
      }
    });

    //수정전 summernote 내용 가져오기
    
    $('#summernote').summernote('code',"${dto.notice_content}");
    
    // summernote 적용
    
    $('#summernote').summernote({
    	  value : '${dto.notice_content}'
    	, height : 600
    	, width : 700
    	, lang : 'ko-KR'
    	, focus : false
    	, tabsize : 4
    });
    
    //필수 사항 입력 체크
    $('#submit_btn').click(function()
	{
		if($('#notice_title').val()=="")
		{
			alert("제목을 입력해주세요.");
			$('#notice_title').focus();
			return false;
		}
		
		if($('#type_selected').val()=="")
		{
			alert("공지사항 유형을 입력해주세요.");
			$('#type_selected').focus();
			return false;
		}
		
		if($('#summernote').val()=="")
		{
			alert("내용을 입력해주세요.");
			$('#summernote').summernote({focus : true});
			return false;
		}	
	 });
    $('#list_btn').click(function()
	{
		//alert("확인");
		if('${pageNum}' == "")
			$(location).attr("href","notice_list.action?member_id=" + '${member_id}');
		else
			$(location).attr("href","notice_list.action?pageNum="+'${pageNum}' + "&member_id=" + '${member_id}');
	});
   });
</script>

</head>

<body>

  <div id="wrap">
    <div id="header">
      <div class="top">
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
      </div>
      <!-- end top -->

      <nav class="sub_navbar">
        <div class="logo"> <a href="main.action"> <b>스케블러</b> &nbsp;&nbsp; 완벽한 여행을 위한 계획</a> </div>
        <!-- end logo -->

        <!-- right-menu -->
        <div class="right-menu">
          <ul>
            	<li><a href="notice_list.action">공지사항</a></li>
           		<li><a href="plannerlist.action">플래너</a></li>
           		<li><a href="storyopen.action">커뮤니티</a></li>
          </ul>
        </div>
        <!-- end right-menu -->
      </nav>
      <!-- end navbar -->
    </div>
    <!-- end header -->

    <div id="container">
      <div class="ct_nav">
        <ul>
          <li>
            <div class="xi-home"></div>
          </li>
          <li class="nav_text"><span>고객센터</span></li>
        </ul>
      </div>
      <div class="ct_title">
        <h1>고객센터</h1>
      </div>
      <div class="ct_left_menu">
        <div class="my_top">
          <div class="xi-profile-o xi-3x"></div>
          <br>
          CS Center<br>
        </div>
        <ul>
          <li>
            <dl>
              <dt>고객센터</dt>
              <dd><a href="qnainsert.action">- 1:1 문의</a></dd>
              <dd><a href="notice_list.action">- 공지사항</a></dd>
            </dl>
          </li>
        </ul>
      </div>
      <!-- ct_left_menu -->

      <div class="content">
      <form method="post" action="noticeupdate.action">
		  <div class="detail_contentBox">
		  <div class="detail_content">
		  	<h3>공지사항 수정 페이지</h3>
		 </div>
		 <input type="hidden" name="pageNum" value="${pageNum }" >
		  <input type="hidden" name="notice_code" value="${dto.notice_code }">
		  	<table class = "input_table">
		  		<tr> 
		  			<th>제목 : </th>
		  			<td>
		  				<input type="text" class="notice_title" id="notice_title" name="notice_title" value="${dto.notice_title}">
		  			</td>
		  		</tr>
		  		
		  		<tr>
		  			<th>공지사항 유형 : </th>
		  			<td >
		  				<input type="hidden" name="type_code" value="${dto.notice_type_code }">
			  			<select id="type_selected" name="notice_type_code">
			  				<c:forEach var="tdto" items ="${noticeType }">
			  					<option value="${tdto.notice_type_code }"
			  						${notice_type_code == tdto.notice_type_code ? "selected=\"selected\"" : "" }>
			  						[${tdto.notice_type_detail}]
			  					</option>
			  				</c:forEach>
			  			</select>
			  			<input type="hidden" name="notice_num" value="${dto.nno }">
		  				<input type="hidden" name="member_code" value="${dto.member_code }">
		  			</td>
		  		</tr>
		  		<tr>
		  			<th>내용 : </th>
		  			<td colspan="2">
		  				<textarea id="summernote" cols="50" rows="20"  name="notice_content"></textarea>
		  			</td>
		  		</tr>	
		  	</table>
		  </div> <!-- end detail_contentBox-->
		  <div class="detail_bottom">	
		  	<button type="submit" class="submit_btn" id="submit_btn">수정완료</button>
		  	<button type="reset" class="cancel_btn" id="list_btn">취소</button>
		  </div> <!-- end detail_bottom-->
	  </form>
	  
      </div> <!-- end content-->
      
   </div> <!-- end container-->
   
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
                                 <li>
                                   <span class="dd">스케블러</span>
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

  </div>
  
 <!-- end wrap -->

</body>

</html>