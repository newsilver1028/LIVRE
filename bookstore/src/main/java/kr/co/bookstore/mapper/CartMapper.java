package kr.co.bookstore.mapper;

import java.util.List;

import kr.co.bookstore.domain.CartVO;

/**
 * 장바구니 Mapper
 */
public interface CartMapper {
	
	public List<CartVO> cartList();				// 장바구니 리스트

	public void cartadd(CartVO vo);				// 장바구니 추가 기능

	public List<Long> cart(String username);	// 장바구니 목록 불러오기

	public void delete(CartVO vo);				// 장바구니 삭제 기능
}