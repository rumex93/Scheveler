/*
 * IOneOnOneDAO.java
 * - 인터페이스
 * - 1대1 문의 답변처리 마이바티스용
 */
package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IOneOnOneDAO
{
	public OneOnOneDTO searchByCode(String qna_question_code) throws SQLException ;	// 1대1 문의 상세보기
	public ArrayList<OneOnOneDTO> list() throws SQLException;						// 1대1 문의 전체 리스트 
	public int addAnswer(OneOnOneDTO oneOnOneDTO) throws SQLException;				// 답변 추가
	
	public ArrayList<OneOnOneDTO> myPageList(@Param("member_code")String member_code, @Param("start")int start, @Param("end")int end) throws SQLException;	
	public int getDataCount(String member_code) throws SQLException;
}
