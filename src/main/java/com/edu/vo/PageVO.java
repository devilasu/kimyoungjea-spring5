package com.edu.vo;
/**
 * 이 클래스는 공통(회원관리,게시물관리)으로 사용하는 페이징처리+검색기능의 클래스.
 * @author 김영제
 * PS이 클래스는 오라클이든, MySql(마리아DB) 어디서든 공통으로 사용하는 Get/Set 
 */
public class PageVO {
	private int queryStartNo;	//쿼리 전용 출력되는 페이지의 시작점
	private int queryPerPageNum;//쿼리 전용 한 페이지에 출력되는 게시물 수.
	private Integer page;		//jsp에서 선택한 페이지 번호값이 들어가는 변수
	private int perPageNum;		//리스트 하단에 보이는 페이지번호의 개수(계산 필요)
	private int startPage;		//jsp에서 페이징 리스트 시작 번호
	private int endPage;		//jsp에서 페이징 리스트의 끝 번호.
	
	//이후는 검색을 위한 변수
	private String search_keyword;	//jsp에서 받은 검색어. 쿼리전용 변수.
	private String search_type;		//검색 조건에 해당하는 쿼리전용 변수.
	
	
	
	public int getQueryStartNo() {
		return queryStartNo;
	}
	public void setQueryStartNo(int queryStartNo) {
		this.queryStartNo = queryStartNo;
	}
	public int getQueryPerPageNum() {
		return queryPerPageNum;
	}
	public void setQueryPerPageNum(int queryPerPageNum) {
		this.queryPerPageNum = queryPerPageNum;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

}
