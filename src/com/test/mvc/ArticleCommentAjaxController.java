/*==========================
  CommentAjaxController.java
==========================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ArticleCommentAjaxController implements Controller
{
	private IArticleDAO dao;

	public void setDao(IArticleDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 데이터 가져오기
		String articleCommentCode = request.getParameter("articleCommentCode");
		
		HttpSession session = request.getSession();
		String memberCode = (String)session.getAttribute("membercode");
		
		int count = 0;
		
		try
		{
			count = dao.getMemberCommentCount(articleCommentCode, memberCode);
			
			mav.addObject("count", count);
			mav.setViewName("ArticleCommentReportForm");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
