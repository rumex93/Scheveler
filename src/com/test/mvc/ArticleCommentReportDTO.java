package com.test.mvc;

public class ArticleCommentReportDTO
{
	// 신고 들어올 때
	private String article_comment_rep_in_code, rep_type_detail, article_comment_code,article_code;
	private String article_comment_rep_in_content, reporter_code, reporter_id, article_comment_rep_in_date, writer_id, writer_code; //신고자 코드, 신고자 아이디
	private int bno;
	
	
	// 신고 나갈 때
	private String article_comment_rep_out_code, article_comment_rep_out_date, arti_comment_rep_out_process;


	// getter / setter 구성
	public String getArticle_comment_rep_in_code()
	{
		return article_comment_rep_in_code;
	}

	public void setArticle_comment_rep_in_code(String article_comment_rep_in_code)
	{
		this.article_comment_rep_in_code = article_comment_rep_in_code;
	}

	public String getRep_type_detail()
	{
		return rep_type_detail;
	}

	public void setRep_type_detail(String rep_type_detail)
	{
		this.rep_type_detail = rep_type_detail;
	}

	public String getArticle_comment_code()
	{
		return article_comment_code;
	}

	public void setArticle_comment_code(String article_comment_code)
	{
		this.article_comment_code = article_comment_code;
	}

	public String getArticle_code()
	{
		return article_code;
	}

	public void setArticle_code(String article_code)
	{
		this.article_code = article_code;
	}

	public String getArticle_comment_rep_in_content()
	{
		return article_comment_rep_in_content;
	}

	public void setArticle_comment_rep_in_content(String article_comment_rep_in_content)
	{
		this.article_comment_rep_in_content = article_comment_rep_in_content;
	}

	public String getReporter_code()
	{
		return reporter_code;
	}

	public void setReporter_code(String reporter_code)
	{
		this.reporter_code = reporter_code;
	}

	public String getReporter_id()
	{
		return reporter_id;
	}

	public void setReporter_id(String reporter_id)
	{
		this.reporter_id = reporter_id;
	}

	public String getArticle_comment_rep_in_date()
	{
		return article_comment_rep_in_date;
	}

	public void setArticle_comment_rep_in_date(String article_comment_rep_in_date)
	{
		this.article_comment_rep_in_date = article_comment_rep_in_date;
	}

	public String getWriter_id()
	{
		return writer_id;
	}

	public void setWriter_id(String writer_id)
	{
		this.writer_id = writer_id;
	}

	public String getWriter_code()
	{
		return writer_code;
	}

	public void setWriter_code(String writer_code)
	{
		this.writer_code = writer_code;
	}

	public int getBno()
	{
		return bno;
	}

	public void setBno(int bno)
	{
		this.bno = bno;
	}

	public String getArticle_comment_rep_out_code()
	{
		return article_comment_rep_out_code;
	}

	public void setArticle_comment_rep_out_code(String article_comment_rep_out_code)
	{
		this.article_comment_rep_out_code = article_comment_rep_out_code;
	}

	public String getArticle_comment_rep_out_date()
	{
		return article_comment_rep_out_date;
	}

	public void setArticle_comment_rep_out_date(String article_comment_rep_out_date)
	{
		this.article_comment_rep_out_date = article_comment_rep_out_date;
	}

	public String getArti_comment_rep_out_process()
	{
		return arti_comment_rep_out_process;
	}

	public void setArti_comment_rep_out_process(String arti_comment_rep_out_process)
	{
		this.arti_comment_rep_out_process = arti_comment_rep_out_process;
	}

}
