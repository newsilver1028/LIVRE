package kr.co.bookstore.domain;

import lombok.Data;

/**
 * 구매내역 VO
 */
@Data
public class BuyList {
	private Long bno;			// 상품번호
	private String userName;	// 사용자 ID
}
