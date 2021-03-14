package kr.co.bookstore.domain;

import org.springframework.web.util.UriComponentsBuilder;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

/**
 * 검색 VO
 */
public class SearchVO {

   private int pageNum;		// 페이지 번호
   private int amount;		// 한 페이지당 게시물 수	
   private String type;		// 검색 항목 (책 제목, 글쓴이, 출판사)
   private String keyword;	// 검색어
   private String genre;	// 책 장르
    
   
   /* 1페이지당 게시물 수 9개로 지정 */
   public SearchVO() {
      this(1,9); 
   }

   public SearchVO(int pageNum, int amount) {
      this.pageNum = pageNum;
      this.amount = amount;
   }

   public String[] getTypeArr() {
     
      return type == null ? new String[] {} : type.split("");

   }

   public String getListLink() {
      UriComponentsBuilder builder 
      = UriComponentsBuilder.fromPath("")
      .queryParam("pageNum", this.pageNum)
      .queryParam("amount", this.getAmount())
      .queryParam("type", this.getType())
      .queryParam("keyword", this.getKeyword());

      return builder.toUriString();

   }

}