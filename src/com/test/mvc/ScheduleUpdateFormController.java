/*
 *  PlannerUpdateFormController.java
 * - 1차 페이지 수정
 */

package com.test.mvc;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;



public class ScheduleUpdateFormController implements Controller
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
		
		IPlannerDAO plannerDAO = sqlSession.getMapper(IPlannerDAO.class);
		IScheduleDAO scheduleDAO = sqlSession.getMapper(IScheduleDAO.class);
		
		
		// 플래너 코드 가져오기
		String planner_code = request.getParameter("planner_code");
		
		// 해당 플래너 정보와 해당 플래너에 속한 스케쥴 정보 가져오기
		PlannerDTO plannerDTO = plannerDAO.searchByCode(planner_code);
		
		
		int maxDay = scheduleDAO.getMaxDay(planner_code);
		int dataCount = scheduleDAO.getDataCount(planner_code);
		
		
		ArrayList<ScheduleDTO> schedules = scheduleDAO.searchByPlannerCode(planner_code);
		
	
		
		
		try 
		{
			
			String date1 = plannerDTO.getPlanner_start_date();
	        String date2 = plannerDTO.getPlanner_end_date();
	          
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	          
	        Date startdate = sdf.parse(date1);
	        Date enddate = sdf.parse(date2);
	          
	        long diffDay = (enddate.getTime() - startdate.getTime()) / (24*60*60*1000) + 1;
	
	           
	        mav.addObject("calDateDays", diffDay);
	
		
			
			
			mav.addObject("planner", plannerDTO);
			mav.addObject("schedules", schedules);
			mav.addObject("maxDay", maxDay);
			mav.addObject("dataCount" , dataCount);
			mav.setViewName("Planner_Main_Update");		
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		
		
		
		return mav;
	}
	
	

}
