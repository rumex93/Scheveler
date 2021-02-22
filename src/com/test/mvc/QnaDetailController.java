/*
 * QnaAnswerProcessPageController
 * - 관리자 1대1 문의 답변 페이지 컨트롤러
 */

package com.test.mvc;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class QnaDetailController implements Controller
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
		String qna_question_code = request.getParameter("qna_question_code");
		OneOnOneDTO dto = dao.searchByCode(qna_question_code);
		
		String isMyPage = request.getParameter("isMyPage");
		
		try
		{
			
			
			mav.addObject("isMyPage", isMyPage);
			mav.addObject("dto", dto);
			mav.setViewName("QnaDetail");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
}
