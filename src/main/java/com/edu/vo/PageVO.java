package com.edu.vo;
/**
 * 이 클래스는 공통(회원관리,게시물관리)으로 사용하는 페이징처리+검색기능의 클래스.
 * @author 김영제
 * PS이 클래스는 오라클이든, MySql(마리아DB) 어디서든 공통으로 사용하는 Get/Set 
 */
public class PageVO {
	private int queryStartNum;	//쿼리 전용 출력되는 페이지의 시작점
	private int queryPerPageNum;//쿼리 전용 한 페이지에 출력되는 개수.
	private Integer page;		//jsp에서 선택한 페이지 번호값이 들어가는 변수
	private int perPageNum;		//리스트 하단에 보이는 페이지번호의 개수(계산 필요)
	private int totalCount;		//계산식의 기초값으로 전체개수가 구해진 이후 페이징등의 계산식이 진행됩니다.
	private int startPage;		//jsp에서 페이징 리스트 시작 번호
	private int endPage;		//jsp에서 페이징 리스트의 끝 번호.
	private boolean prev;		//UI하단 리스트에 이전 페이지의 가능여부
	private boolean next;		//UI하단 리스트에 다음 페이지의 가능여부
	
	//이후는 검색을 위한 변수
	private String search_keyword;	//jsp에서 받은 검색어. 쿼리전용 변수.
	private String search_type;		//검색 조건에 해당하는 쿼리전용 변수.
	
	
	
	@Override
	public String toString() {
		return "PageVO [queryStartNo=" + queryStartNum + ", queryPerPageNum=" + queryPerPageNum + ", page=" + page
				+ ", perPageNum=" + perPageNum + ", totalCount=" + totalCount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", search_keyword=" + search_keyword
				+ ", search_type=" + search_type + "]";
	}
	public int getQueryStartNum() {
		//this.page-1은 jsp에서는 1부터 시작하는데, query에서는 0부터 시작하기 때문에.
		queryStartNum = queryPerPageNum*(this.page-1);
		return queryStartNum;
	}
	public void setQueryStartNum(int queryStartNo) {
		this.queryStartNum = queryStartNo;
	}
	public int getQueryPerPageNum() {
		return queryPerPageNum;
	}
	public void setQueryPerPageNum(int queryPerPageNum) {
		this.queryPerPageNum = queryPerPageNum;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		//totalCount변수값을 지정한 이후 계산식 실행.
		calcPage();
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	
	private void calcPage() {
		// 이 매서드는 totalCount를 기반으로 prev, next, startPage, endPage등등을 구현하게 됩니다.
		int tempEnd = (int) (Math.ceil(page/(double)this.perPageNum)*this.perPageNum);
		//jsp에서 클릭한 페이지번호 예로 1 을 기준으로 끝 페이지를 계산한다(위)
		//예) < 1 2 3 4 5 6 7 8 9 10(tempEnd) > 페이징 리스트의 시작1 과 끝10 값이 바뀌게 됩니다.
		//예) < 11 12 13 14 15 16 17 18 19 20(tempEnd) > 시작 11 과 끝 20
		this.startPage = (tempEnd-this.perPageNum)+1;
		//totalPage = 101이고 11페이지가 눌렸을 때.perPageNum=10
		if(tempEnd*queryPerPageNum > this.totalCount)
			this.endPage = (int)(Math.ceil(this.totalCount/(double)this.queryPerPageNum));
		else {
			this.endPage = tempEnd;
		}
		this.prev = (this.startPage > perPageNum);//startPage가 endPage+1보다 크면 prev=true(prev와 next를 queryPerPageNum단위로 옮길 예정.)
		this.next = this.endPage*this.queryPerPageNum < this.totalCount;//next를 활성화하는 공식인데 위와 동일.
	}
}
