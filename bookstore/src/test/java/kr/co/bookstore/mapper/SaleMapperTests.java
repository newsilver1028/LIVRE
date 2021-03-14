package kr.co.bookstore.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.bookstore.domain.SaleVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SaleMapperTests {
	@Setter(onMethod_ = @Autowired)
	private SaleMapper mapper;

	@Test
	public void testInsert() {
		SaleVO sale = new SaleVO();
		sale.setBookName("책 이름");
		sale.setAuthor("글쓴이");
		sale.setPublisher("출판사");
		sale.setShippingNumber("송장번호");
		sale.setWriter("게시자");
		log.info(sale);
		mapper.sale(sale);
	}

}
