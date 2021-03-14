package kr.co.bookstore.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 게시물 VO
 */
@Data
public class SaleVO {

	private String publisher;					// 출판사
	private String bookName;					// 책 이름
	private String author;						// 글쓴이
	private Long bno;							// 상품 번호
	private String shippingNumber;				// 송장 번호
	private String etc;							// 기타 사항
	private String writer;						// 사용자 ID
	private Date regdate;						// 게시물 쓴 날짜
	private Date updateDate;					// 게시물 수정한 날짜
	private List<GettingBookPhoto> photoList;	// 게시물 사진 리스트
	private String url;							// 게시물 사진 업로드 경로
	private Long price;							// 상품 가격
	private List<String> urlList;				// 게시물 사진 업로드 경로 리스트
	private String tf;							// 게시물 권한
	private String dataList;					// 게시물 상태
	private String genre;						// 책 장르

}
