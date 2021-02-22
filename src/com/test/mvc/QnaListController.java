package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class QnaListController implements Controller
{
	
	private SqlSession sqlSession;
	private IPaging pdao;
	
	public void setPdao(IPaging pdao)
	{
		this.pdao = pdao;
	}

	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리 과정 추가(관리자 로그인에 대한 확인 과정 추가) ----------------------------------------
		HttpSession session = request.getSession();
		
		/*
		 * if(session.getAttribute("name")!=null) { // 만약 로그인되어있는 상황인데 회원가입 페이지로 들어올 경우
		 * mav.setViewName("redirect:main.action"); }
		 */
		
		// ---------------------------------------- 세션 처리 과정 추가(관리자 로그인에 대한 확인 과정 추가)
		
		
		// 세션에서 회원코드 데이터 수신
		String member_code = (String)session.getAttribute("membercode");
		
		ArrayList<OneOnOneDTO> list = new ArrayList<OneOnOneDTO>();
		IOneOnOneDAO dao = sqlSession.getMapper(IOneOnOneDAO.class);
		
		// 페이징 처리 사전 작업
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		int dataCount = dao.getDataCount(member_code);
		
		int numPerPage = 10;
		int totalPage = pdao.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		
		
		
		
		
		try
		{
			list = dao.myPageList(member_code, start, end);
			
			
			mav.addObject("list",list);
			String listUrl = "qnalist.action";
			String pageIndexList = pdao.getIndexList(currentPage, totalPage, listUrl);
			
			mav.addObject("pageIndexList", pageIndexList);
			mav.setViewName("MyPage_QnaList");
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		return mav;
	}	
	
}	
