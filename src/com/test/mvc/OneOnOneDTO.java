/*
 * OneOnOneDTO.java 
 * - 1대1문의 답변 처리  마이바티스용 DTO
 * 
 */

package com.test.mvc;

public class OneOnOneDTO
{
	
	private String qna_answer_date, qna_answer_content, qna_answer_title, admin_id, admin_code;
	private String qna_answer_code, member_code;
	
	
	private String qna_question_code, qna_type_code, qna_type_detail;
	private String questioner_code, questioner_id, qna_question_title;
	private String qna_question_content, qna_question_date;
	
	
	
	
	public String getQna_answer_code()
	{
		return qna_answer_code;
	}
	public void setQna_answer_code(String qna_answer_code)
	{
		this.qna_answer_code = qna_answer_code;
	}
	public String getMember_code()
	{
		return member_code;
	}
	public void setMember_code(String member_code)
	{
		this.member_code = member_code;
	}
	public String getQna_answer_date()
	{
		return qna_answer_date;
	}
	public void setQna_answer_date(String qna_answer_date)
	{
		this.qna_answer_date = qna_answer_date;
	}
	public String getQna_answer_content()
	{
		return qna_answer_content;
	}
	public void setQna_answer_content(String qna_answer_content)
	{
		this.qna_answer_content = qna_answer_content;
	}
	public String getQna_answer_title()
	{
		return qna_answer_title;
	}
	public void setQna_answer_title(String qna_answer_title)
	{
		this.qna_answer_title = qna_answer_title;
	}
	public String getAdmin_id()
	{
		return admin_id;
	}
	public void setAdmin_id(String admin_id)
	{
		this.admin_id = admin_id;
	}
	public String getAdmin_code()
	{
		return admin_code;
	}
	public void setAdmin_code(String admin_code)
	{
		this.admin_code = admin_code;
	}
	public String getQna_question_code()
	{
		return qna_question_code;
	}
	public void setQna_question_code(String qna_question_code)
	{
		this.qna_question_code = qna_question_code;
	}
	public String getQna_type_code()
	{
		return qna_type_code;
	}
	public void setQna_type_code(String qna_type_code)
	{
		this.qna_type_code = qna_type_code;
	}
	public String getQna_type_detail()
	{
		return qna_type_detail;
	}
	public void setQna_type_detail(String qna_type_detail)
	{
		this.qna_type_detail = qna_type_detail;
	}
	public String getQuestioner_code()
	{
		return questioner_code;
	}
	public void setQuestioner_code(String questioner_code)
	{
		this.questioner_code = questioner_code;
	}
	public String getQuestioner_id()
	{
		return questioner_id;
	}
	public void setQuestioner_id(String questioner_id)
	{
		this.questioner_id = questioner_id;
	}
	public String getQna_question_title()
	{
		return qna_question_title;
	}
	public void setQna_question_title(String qna_question_title)
	{
		this.qna_question_title = qna_question_title;
	}
	public String getQna_question_content()
	{
		return qna_question_content;
	}
	public void setQna_question_content(String qna_question_content)
	{
		this.qna_question_content = qna_question_content;
	}
	public String getQna_question_date()
	{
		return qna_question_date;
	}
	public void setQna_question_date(String qna_question_date)
	{
		this.qna_question_date = qna_question_date;
	}
	
	
}
