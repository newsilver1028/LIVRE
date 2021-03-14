package kr.co.bookstore.mapper;

import java.util.List;

import kr.co.bookstore.domain.BuyList;
import kr.co.bookstore.domain.CartVO;

/**
 * 주문 내역 Mapper
 */
public interface OrderlistMapper {

	public void orderlistAdd(CartVO vo);			// 구매 (주문내역에 추가) 기능
	
	public List<Long> buy2(String userName);		// 구매한 상품번호 불러오기

	public List<BuyList> buylist();					// 구매내역 불러오기

}
