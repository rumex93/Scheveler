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
<title>상세 문의 내역</title>
<!--아이콘 링크 -->
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>   
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<link rel="stylesheet" type="text/css" href="css/message.css">



<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{

		/* 메인페이지 외 상단바 */
		// $('.logo a, .right-menu').css('color','black');
		/* header 변수 */
		var header = $('#header').offset();

		/* header 상단바 scroll 시 고정 스크립트 */
		$(window).scroll(function()
		{
			if ($(document).scrollTop() > header.top)
			{
				$('#header').addClass('headerFixed');
			} else
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
			<nav class="sub_navbar">
				<b>문의 내역</b>

				<!-- right-menu -->
				
				<!-- end right-menu -->
			</nav>
			<!-- end navbar -->
		</div>
		<!-- end header -->

		<div id="container">

			<div class="ct_left_menu">

				<!-- <a href="qnaanswerform.action">
					<button style="width: 50%; height: 40px;">답변 작성</button>
				</a> -->

				<hr>

				<ul>
					<li>
						<dl>
							<dd>
								<c:choose>
									<c:when test="${isMyPage eq 1 }">
										<a href="qnalist.action">- 목록으로</a>
									</c:when>
									<c:otherwise>
										<a href="qnaanswerprocesspage.action">- 목록으로</a>
									</c:otherwise>

								</c:choose>
								
							</dd>
							
						</dl>
					</li>
				</ul>

				

			</div>
			<!-- ct_left_menu -->
			
			<!-- msgList -->
			<div id="msgList">

				<!-- list_top -->
				<div class="list_top">

					<div class="delCheck-btns">
						<br />
						<br />
						<br />
					</div>
				</div>

				<!-- end list_top -->

				<!-- realMsgList -->
				<div id="msgInsert">

						<div>
							<table class='table'>
								<tr>
									<th colspan="4">문의 내역</th>
								</tr>
								<tr>
									<th style="width: 100px;">문의자  : </th>
									<td style="text-align: left;">
										${dto.questioner_id }
									</td>
									<td><input type="hidden" name="qna_question_code" value="${dto.qna_question_code }" /></td>
								</tr>
								
								<tr>
									<th style="width: 100px;">문의 시간  : </th>
									<td colspan="3" style="text-align: left;">
										${dto.qna_question_date }
									</td>
	
								</tr>
								
								<tr>
									<th style="width: 100px;">문의 제목  : </th>
									<td colspan="3" style="text-align: left;">
										${dto.qna_question_title}
									</td>
	
								</tr>
								
								<tr>
									<td colspan="4">
										<textarea name="content" cols="10" rows="17" style="resize: none; width:98%;" readonly="readonly" >${dto.qna_question_content }</textarea>
									</td>
								</tr>
								
								
							</table>
						</div>
						<br />
						<c:choose>
							<c:when test="${dto.qna_answer_date eq null }"> <!-- 답변이 없을 경우 답변 입력폼 출력 -->
								<form action="qnaanswer.action" name="qnaAnswerForm">
									<table class="table">
										<input type="hidden" name="qna_question_code" value="${dto.qna_question_code }"/>
										<tr>
											<th colspan="4">답변하기</th>
										</tr>
										<tr>
											<th style="width: 100px;">답변 제목  : </th>
											<td colspan="3" style="text-align: left;">
												<input type="text" name="title" style="width: 100%;"/>
											</td>
										<tr>
											<td colspan="4">
												<textarea name="content" cols="10" rows="17" style="resize: none; width:98%;" ></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<button style="width:70%;">답변 하기</button>		
											</td>
											
										</tr>
									</table>
								</form>
							</c:when>
							<c:otherwise> <!-- 답변이 이미 있는 경우 답변 내용 출력 -->
								<table class='table'>
								<tr>
									<th colspan="4">답변 내역</th>
								</tr>
								
								
								<tr>
									<th style="width: 100px;">답변자  : </th>
									<td style="text-align: left;">
										${dto.admin_id }
									</td>
								</tr>
								
								<tr>
									<th style="width: 100px;">답변 시간  : </th>
									<td colspan="3" style="text-align: left;">
										${dto.qna_answer_date }
									</td>
	
								</tr>
								
								
								<tr>
									<th style="width: 100px;">문의 제목  : </th>
									<td colspan="3" style="text-align: left;">
										${dto.qna_answer_title}
									</td>
	
								</tr>
								
								<tr>
									<td colspan="4">
										<textarea name="content" cols="10" rows="17" style="resize: none; width:98%;" readonly="readonly" >${dto.qna_answer_content }</textarea>
									</td>
								</tr>
								
								
							</table>
							</c:otherwise>
						</c:choose>
						
						
				</div>
				<!-- end realMsgList -->


			</div>
			<!-- end msgList -->


		</div>
		<!-- end container-->



	</div>
	<!-- end wrap -->

</body>
</html>
