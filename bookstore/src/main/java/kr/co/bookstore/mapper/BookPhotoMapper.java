package kr.co.bookstore.mapper;

import java.util.List;

import kr.co.bookstore.domain.GettingBookPhoto;
import kr.co.bookstore.domain.SaleVO;

/**
 * 게시물 사진 Mapper
 */
public interface BookPhotoMapper {

	public void insert(GettingBookPhoto photo);				// 게시물 사진 삽입
	
	public void delete(String uuid);						// 게시물 사진 삭제

	public List<GettingBookPhoto> findBybno(Long bno);		// 게시물 사진 검색

	public void deleteAll(Long bno);						// 게시물 사진 삭제

	public List<GettingBookPhoto> getOldFiles();			// 

	public List<GettingBookPhoto> getPhoto();				// 

}
