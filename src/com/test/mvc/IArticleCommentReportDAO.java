/*
 * IArticleCommentReportDAO.java
 *댓글 신고 처리 인터페이스
 */

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IArticleCommentReportDAO
{
	//**댓글
	//들어온 댓글 신고 조회
	public ArrayList<ArticleCommentReportDTO> lists() throws SQLException;

	//게시글 신고 처리 메소드
	public int reportCommentProcess(@Param("article_comment_rep_in_code")String article_comment_rep_in_code, @Param("memberCode")String memberCode, @Param("arti_comment_rep_out_process")String arti_comment_rep_out_process) throws SQLException;
	
	// 특정 유저가 신고 당한 횟수
	public int totalCommentReportedById(@Param("id")String id) throws SQLException;


}
