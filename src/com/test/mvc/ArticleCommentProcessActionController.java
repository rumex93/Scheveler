/*
 * ArticleCommentProcessActionController.java
 * - 관리자 댓글 신고 처리 액션 컨트롤러
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ArticleCommentProcessActionController implements Controller
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
		
		IArticleCommentReportDAO dao = sqlSession.getMapper(IArticleCommentReportDAO.class);
		HttpSession session = request.getSession();
		
		String memberCode = (String)session.getAttribute("membercode");
		String article_comment_rep_in_code = request.getParameter("article_comment_rep_in_code");
		String arti_comment_rep_out_process = request.getParameter("arti_comment_rep_out_process");
		
		try
		{
			ArrayList<ArticleCommentReportDTO> lists = dao.lists();
			dao.reportCommentProcess(article_comment_rep_in_code, memberCode, arti_comment_rep_out_process);
			mav.setViewName("redirect:commentreportprocess.action");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
}
