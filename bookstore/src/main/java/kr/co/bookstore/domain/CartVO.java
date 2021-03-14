package kr.co.bookstore.domain;

import lombok.Data;

/**
 * 장바구니 VO
 */
@Data
public class CartVO {
	private Long bno;			// 상품번호
	private String userName;	// 사용자 ID

}