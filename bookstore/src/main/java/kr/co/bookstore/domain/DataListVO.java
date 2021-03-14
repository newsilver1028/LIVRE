package kr.co.bookstore.domain;

import lombok.Data;

/**
 * 게시물 상태 VO
 */
@Data
public class DataListVO {

	private String dataList;	// 게시물 상태 목록
	private Long bno;			// 상품번호
}
