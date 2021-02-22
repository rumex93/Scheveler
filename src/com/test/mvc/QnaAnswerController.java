/*
 * QnaAnswerProcessPageController
 * - 관리자 1대1 문의 답변 페이지 컨트롤러
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class QnaAnswerController implements Controller
{
	
	private SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		IOneOnOneDAO dao = sqlSession.getMapper(IOneOnOneDAO.class);
		HttpSession session = request.getSession();
		
		OneOnOneDTO dto = new OneOnOneDTO();
		
		dto.setQna_question_code(request.getParameter("qna_question_code"));
		dto.setQna_answer_title(request.getParameter("title"));
		dto.setQna_answer_content(request.getParameter("content"));
		dto.setMember_code((String)session.getAttribute("membercode"));
		
		
		try
		{
			dao.addAnswer(dto);
			
			
			// 답변 작성 폼 뷰
			mav.setViewName("redirect:qnaanswerprocesspage.action");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
}
