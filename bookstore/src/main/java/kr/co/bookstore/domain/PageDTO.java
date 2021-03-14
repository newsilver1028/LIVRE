package kr.co.bookstore.domain;

import lombok.Getter;
import lombok.ToString;

/**
 * 페이징 처리 DTO
 */
@Getter
@ToString
public class PageDTO {
	private int startPage;			// 시작 페이지
	private int endPage;			// 끝 페이지
	private boolean prev, next;		// 이전 페이지, 다음 페이지
	private int total;				// 전체 페이지 개수
	private SearchVO cri;			// searchVO 생성자

	
	/* 페이징 처리 */
	public PageDTO(SearchVO cri, int total) {

		this.cri = cri;					// 현재 페이지
		this.total = total;				// 전체 페이지 개수

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 9.0)) * 10;			// 한 페이지당 게시물 9개

		this.startPage = this.endPage - 9;										// 1
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

}
