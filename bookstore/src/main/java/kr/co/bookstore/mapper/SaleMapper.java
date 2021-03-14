package kr.co.bookstore.mapper;

import java.util.List;

import kr.co.bookstore.domain.DataListVO;
import kr.co.bookstore.domain.SaleVO;
import kr.co.bookstore.domain.SearchVO;

/**
 * 구매 Mapper
 */
public interface SaleMapper {
	
	public void sale(SaleVO sale);								// 게시물에 입력한 정보 업데이트
	
	public List<SaleVO> findbook(String name);					// 내가 쓴글 불러오기

	public void delete(Long bno);								// 내가 쓴글 삭제

	public boolean update(SaleVO sale);							// 내가 쓴글 수정

	public SaleVO read(Long bno);								// 검색한 게시물 최신순으로 불러오기

	public List<SaleVO> getList();								// 게시물 목록 최신순으로 불러오기

	public boolean up2list(SaleVO sale);						// 상품번호와 일치하는 상품 정보 업데이트 (관리자 페이지)

	public void updatelist(DataListVO vo);						// 상품의 상태 변경

	public void orderdatalist(Long bno);						// '결제 완료' 상태인 상품은 관리자만 읽을 수 있도록 변경

	public List<SaleVO> getlistlist();							// 관리자페이지의 '교환'관리

	public List<SaleVO> getlistlist2();							// 관리자페이지의 '반품'관리

	public List<SaleVO> getlistlist3();							// 관리자페이지의 '배송'관리

	public List<SaleVO> getlistlist5();							// 관리자페이지의 '수취'관리

	public void snsubmit(DataListVO vo);						// 상품의 수취번호 업데이트
	
	public int getTotalCount(SearchVO cri);						// 상품의 총 개수 검색

	public List<SaleVO> getListWithPaging(SearchVO cri);		// 게시물 페이징 처리

	public int getGenreCount(SearchVO cri);						// 각 장르별 상품 개수 검색
	
	public List<SaleVO> getListGenrePaging(SearchVO cri);		// 각 장르별 게시물 페이징 처리

	public void tfchange(DataListVO bno);						// 상품의 게시물 읽기 권한 변경 (관리자->모든 사용자)

}