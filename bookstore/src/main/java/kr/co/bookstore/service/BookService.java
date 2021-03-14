package kr.co.bookstore.service;

import java.util.List;
import java.util.Map;

import kr.co.bookstore.domain.CartVO;
import kr.co.bookstore.domain.DataListVO;
import kr.co.bookstore.domain.GettingBookPhoto;
import kr.co.bookstore.domain.LoginVO;
import kr.co.bookstore.domain.NoticePWVO;
import kr.co.bookstore.domain.SaleVO;
import kr.co.bookstore.domain.SearchVO;
import kr.co.bookstore.domain.findIDVO;
import kr.co.bookstore.domain.findPWVO;

public interface BookService {

	public void register(SaleVO sale);						// 게시물 사진에 Null값 입력 방지.

	public List<SaleVO> getlist();							// 사용자가 업로드한 게시물 사진들을 리스트로 저장.

	public List<SaleVO> getAdminList();						// 관리자가 업로드한 게시물 사진들을 리스트로 저장.
	
	public void member(LoginVO vo);							// 아이디와 비밀번호 일치 여부 확인.

	public String findID(findIDVO vo);						// 아이디 찾기 VO 데이터 가져오기.

	public int idCheck(String memberId) throws Exception;	// 아이디 식별 기능
	
	public String findPW(findPWVO vo);						// 비밀번호 찾기 기능

	public static String getPw(Map<String, Object> paramMap) {
		return null;
	}														// 비밀번호 찾기에 필요한 pw 가져오기.

	public void update(NoticePWVO pw);						// 비밀번호 변경 기능

	public SaleVO get(Long bno);							// SaleVO 데이터 가져오기.

	public List<String> getbnophoto(Long bno);				// 상품번호와 맞는 상품사진 가져오기.

	public void modifyInfo(LoginVO vo);						// 사용자 정보수정 기능

	public List<SaleVO> getfindbooks(String name);			// ID와 맞는 상품 가져오기.

	public List<GettingBookPhoto> getAttachList(Long bno);	// 게시물 번호 전달

	public boolean updatebook(SaleVO vo);					// 게시물 올리기 기능

	public LoginVO getfindusers(String name);				// 사용자 ID 찾기에 필요한 이름 가져오기.

	public String cartAdd(CartVO vo);						// 장바구니에 상품 추가 기능

	public List<SaleVO> cartLists(String userName);			// 장바구니에 상품별 사진을 리스트로 추가.

	public boolean modify(SaleVO board);					// 게시물 수정 기능 (관리자페이지)

	public void removecart(CartVO vo);						// 장바구니에서 상품 삭제 기능

	public String mypagedelete(Long bno);					// 내가 쓴 글 삭제 기능

	public boolean up2list(SaleVO vo);						// 상품 정보 업데이트 기능

	public String orderlistAdd(CartVO bno);					// 주문내역 업데이트 기능

	public List<SaleVO> getorderlistAdd(String userName);	// 주문내역에 상품사진 리스트로 업데이트

	public String refundorder(DataListVO vo);				// 판매 중인 게시물 전체 공개로 변경

	public List<SaleVO> refundorderList();					// 관리자페이지에 교환 요청, 교환 승인, 교한 완료 상품 불러오기

	public List<SaleVO> refundorderList2();					// 관리자페이지에 반품 요청, 반품 승인, 반품 완료 상품 불러오기

	public List<SaleVO> receiveList();						// 관리자페이지에 수취 요청, 수취 승인, 수취 완료 상품 불러오기

	public List<SaleVO> shippingList();						// 관리자페이지에 상품 준비중, 배송 중, 배송 완료 상품 불러오기

	public void snsubmit2(DataListVO vo);					// 관리자 페이지에 판매자가 입력한 송장번호 업데이트

	public int getTotal(SearchVO cri);						// 전체 게시물 개수

	public List<SaleVO> getList(SearchVO cri);				// 게시물 사진 페이징 처리 기능

	public int getGenreCounts(SearchVO cri);				// 장르별 게시물 개수

	public List<SaleVO> getGenreList(SearchVO cri);			// 사용자가 입력한 장르 별로 게시물 리스트 생성
}