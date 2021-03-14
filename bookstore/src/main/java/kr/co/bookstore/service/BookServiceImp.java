package kr.co.bookstore.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.bookstore.domain.BuyList;
import kr.co.bookstore.domain.CartVO;
import kr.co.bookstore.domain.DataListVO;
import kr.co.bookstore.domain.GettingBookPhoto;
import kr.co.bookstore.domain.LoginVO;
import kr.co.bookstore.domain.NoticePWVO;
import kr.co.bookstore.domain.SaleVO;
import kr.co.bookstore.domain.SearchVO;
import kr.co.bookstore.domain.findIDVO;
import kr.co.bookstore.domain.findPWVO;
import kr.co.bookstore.mapper.BookPhotoMapper;
import kr.co.bookstore.mapper.CartMapper;
import kr.co.bookstore.mapper.MemberMapper;
import kr.co.bookstore.mapper.OrderlistMapper;
import kr.co.bookstore.mapper.SaleMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BookServiceImp implements BookService {

	String[] PhothoListURL = null;
	@Setter(onMethod_ = @Autowired)
	private SaleMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BookPhotoMapper photoMapper;

	@Setter(onMethod_ = @Autowired)
	private MemberMapper membermapper;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Setter(onMethod_ = @Autowired)
	private CartMapper cartmapper;

	@Setter(onMethod_ = @Autowired)
	private OrderlistMapper orderlistmapper;

	/* 게시물 사진에 Null값 입력 방지. */
	@Transactional
	@Override
	public void register(SaleVO sale) {
		log.info("register......" + sale);
		mapper.sale(sale);

		if (sale.getPhotoList() == null || sale.getPhotoList().size() <= 0) {

			return;
		}
		log.info("saleInfo" + sale);
		sale.getPhotoList().forEach(sales -> {
			sales.setBno(sale.getBno());
			photoMapper.insert(sales);

		});

	}

	/* 사용자가 업로드한 게시물 사진들을 리스트로 저장. */
	@Override
	public List<SaleVO> getlist() {
		List<SaleVO> mList = mapper.getList();
		List<SaleVO> readList = new ArrayList<SaleVO>();
		for (int i = 0; i < mList.size(); i++) {
			if (mList.get(i).getTf().equals("1")) {
				readList.add(mList.get(i));
			}
		}

		for (int i = 0; i < readList.size(); i++) {

			List<GettingBookPhoto> pList = photoMapper.findBybno(readList.get(i).getBno());

			String[] day = pList.get(0).getUploadPath().split("\\\\");
			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + pList.get(0).getUuid() + "_"
					+ pList.get(0).getFileName();
			readList.get(i).setUrl(f);

		}

		return readList;
	}

	/* 관리자가 업로드한 게시물 사진들을 리스트로 저장. */
	public List<SaleVO> getAdminList() {
		List<SaleVO> mList = mapper.getList();
		for (int i = 0; i < mList.size(); i++) {
			List<GettingBookPhoto> pList = photoMapper.findBybno(mList.get(i).getBno());

			String[] day = pList.get(0).getUploadPath().split("\\\\");
			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + pList.get(0).getUuid() + "_"
					+ pList.get(0).getFileName();
			mList.get(i).setUrl(f);

		}

		return mList;

	}

	/* 아이디와 비밀번호 일치 여부 확인. */
	@Override
	public void member(LoginVO vo) {
		String str = vo.getUserpw();

		vo.setUserpw(pwencoder.encode(str));
		membermapper.join(vo);
		membermapper.userauth(vo.getUserName());

	}

	/* 아이디 찾기 VO 데이터 가져오기 */
	@Override
	public String findID(findIDVO vo) {

		return membermapper.findid(vo);

	}

	/* 아이디 식별 기능 가져오기 */
	@Override
	public int idCheck(String memberId) throws Exception {

		return membermapper.idCheck(memberId);
	}

	/* 비밀번호 찾기 기능 가져오기 */
	@Override
	public String findPW(findPWVO vo) {
		if (membermapper.findpw(vo) != null) {
			return "Yes";
		}
		return null;

	}

	/* 비밀번호 변경 기능 가져오기 */
	@Override
	public void update(NoticePWVO pw) {

		pw.setUserpw(pwencoder.encode(pw.getUserpw()));
		log.info(pw);
		membermapper.update(pw);

	}
	
	/* SaleVO 데이터 가져오기 */
	public SaleVO get(Long bno) {

		return mapper.read(bno);
	}


	/* 상품번호와 맞는 상품사진 가져오기 */
	public List<String> getbnophoto(Long bno) {
		List<GettingBookPhoto> gList = photoMapper.findBybno(bno);
		List<String> str = new ArrayList<>();
		for (int i = 0; i < gList.size(); i++) {
			String[] day = gList.get(i).getUploadPath().split("\\\\");
			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(i).getUuid() + "_"
					+ gList.get(i).getFileName();
			str.add(f);

		}
		return str;
	}

	/* ID와 맞는 상품 가져오기 */
	@Override
	public List<SaleVO> getfindbooks(String name) {
		List<SaleVO> sale = mapper.findbook(name);

		for (int j = 0; j < sale.size(); j++) {
			List<GettingBookPhoto> gList = photoMapper.findBybno(sale.get(j).getBno());

			for (int i = 0; i < gList.size(); i++) {
				String[] day = gList.get(i).getUploadPath().split("\\\\");

				String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(i).getUuid() + "_"
						+ gList.get(i).getFileName();
				sale.get(j).setUrl(f);
			}

		}

		return sale;
	}

	/*
	 * 게시물 번호를 전달하고, 
	 * 게시물 번호와 일치하는 첨부파일을 모두 리턴.
	 */
	public List<GettingBookPhoto> getAttachList(Long bno) {

		return photoMapper.findBybno(bno);

	}

	/* 게시물 올리기 기능 */
	@Override
	public boolean updatebook(SaleVO vo) {

		return mapper.update(vo);

	}

	/* 상품 정보 업데이트 기능 */
	public boolean up2list(SaleVO vo) {

		return mapper.up2list(vo);

	}

	/* 사용자 ID 찾기에 필요한 이름 가져오기. */
	@Override
	public LoginVO getfindusers(String name) {
		return membermapper.loginfo(name);
	}

	/* 
	 * 사용자 정보수정 기능에서
	 * 생년월일을 변경하지 않는다면 수정 전 정보로,
	 * 생년월일은 변경한다면 수정 한 정보로 업데이트.
	 */
	@Override
	public void modifyInfo(LoginVO vo) {
		if (vo.getBirth() == null) {
			membermapper.modifyinfo2(vo);
		} else {
			membermapper.modifyinfo(vo);
		}
	}

	/* 
	 * 장바구니에 상품 담기.
	 * 새로 추가되는 상품과
	 * 전체 장바구니 상품을 비교하여
	 * 중복한다면 추가할 수 없게 함.
	 */
	@Override
	public String cartAdd(CartVO vo) {
		List<CartVO> cartList = cartmapper.cartList();
		log.info(cartList);
		int a = 0;
		for (int i = 0; i < cartList.size(); i++) {

			if (cartList.get(i).getUserName().equals(vo.getUserName())) {
				log.info("이름이 같습니다");
				log.info(cartList.get(i).getBno());
				log.info(vo.getBno());
				if (vo.getBno().equals(cartList.get(i).getBno())) {
					a++;
				}
			}
		}

		if (a > 0) {
			return "fail";
		} else {

			cartmapper.cartadd(vo);

			return "succeed";
		}
	}

	/* 장바구니에 상품별 사진을 리스트로 추가. */
	@Override
	public List<SaleVO> cartLists(String userName) {
		List<Long> cartbno = cartmapper.cart(userName);
		List<SaleVO> sale = new ArrayList<SaleVO>();

		for (int i = 0; i < cartbno.size(); i++) {
			List<GettingBookPhoto> gList = photoMapper.findBybno(cartbno.get(i));

			String[] day = gList.get(0).getUploadPath().split("\\\\");

			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(0).getUuid() + "_"
					+ gList.get(0).getFileName();

			SaleVO vo = mapper.read(cartbno.get(i));
			
			vo.setUrl(f);
			sale.add(vo);
		}

		return sale;
	}

	/* 게시물 수정 기능 (관리자페이지) */
	public boolean modify(SaleVO board) {
		log.info("modify......" + board);
		photoMapper.deleteAll(board.getBno()); 				/* DB에서 첨부파일 정보 삭제. */
		boolean modifyResult = false; 						/* 게시물 수정 성공 여부. */
		modifyResult = mapper.update(board) == true;
		int attachList = 0; 								/* 첨부파일 갯수. */
		if (board.getPhotoList() != null)
			attachList = board.getPhotoList().size();
		if (modifyResult && attachList > 0) {
			board.getPhotoList().forEach(attach -> {
				attach.setBno(board.getBno());
				photoMapper.insert(attach);
			});
		}
		return modifyResult;
	}

	/* 장바구니에서 상품 삭제 기능 */
	public void removecart(CartVO vo) {
		cartmapper.delete(vo);
	}

	/* 내가 쓴 글 삭제 기능 */
	public String mypagedelete(Long bno) {
		photoMapper.deleteAll(bno);
		mapper.delete(bno);

		return "success";
	}

	/* 주문내역 업데이트 기능 */
	@Override
	public String orderlistAdd(CartVO bno) {
		orderlistmapper.orderlistAdd(bno);
		mapper.orderdatalist(bno.getBno());

		return "succeed";
	}

	/* 주문내역에 상품사진 리스트로 업데이트 */
	@Override
	public List<SaleVO> getorderlistAdd(String userName) {
		List<Long> bno = orderlistmapper.buy2(userName);
		List<SaleVO> sale = new ArrayList<SaleVO>();

		for (int i = 0; i < bno.size(); i++) {
			List<GettingBookPhoto> gList = photoMapper.findBybno(bno.get(i));

			String[] day = gList.get(0).getUploadPath().split("\\\\");

			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(0).getUuid() + "_"
					+ gList.get(0).getFileName();

			SaleVO vo = mapper.read(bno.get(i));
			vo.setUrl(f);
			sale.add(vo);
		}

		return sale;

	}

	/* 판매 중인 게시물 전체 공개로 변경 */
	@Override
	public String refundorder(DataListVO vo) {
		mapper.updatelist(vo);
		if (vo.getDataList().equals("판매 중")) {
			mapper.tfchange(vo);
		}
		return "succeed";
	}

	/* 관리자페이지에 교환 요청, 교환 승인, 교한 완료 상품 불러오기 */
	@Override
	public List<SaleVO> refundorderList() {
		List<BuyList> list = orderlistmapper.buylist();
		List<SaleVO> sale = mapper.getlistlist();

		for (int i = 0; i < sale.size(); i++) {
			for (int j = 0; j < list.size(); j++) {
				if (sale.get(i).getBno().equals(list.get(j).getBno())) {
					sale.get(i).setWriter(list.get(j).getUserName());
				}
			}
			log.info("교환");
			List<GettingBookPhoto> gList = photoMapper.findBybno(sale.get(i).getBno());
			String[] day = gList.get(0).getUploadPath().split("\\\\");

			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(0).getUuid() + "_"
					+ gList.get(0).getFileName();

			sale.get(i).setUrl(f);

		}

		return sale;
	}

	/* 관리자페이지에 반품 요청, 반품 승인, 반품 완료 상품 불러오기 */
	@Override
	public List<SaleVO> refundorderList2() {
		List<BuyList> list = orderlistmapper.buylist();

		List<SaleVO> sale = mapper.getlistlist2();
		log.info(list);
		for (int i = 0; i < sale.size(); i++) {

			for (int j = 0; j < list.size(); j++) {
				log.info("sale = " + sale.get(i).getBno());
				log.info("list = " + list.get(j).getBno());
				if (sale.get(i).getBno().equals(list.get(j).getBno())) {
					sale.get(i).setWriter(list.get(j).getUserName());
				}
			}
			log.info("sale = " + sale);
			List<GettingBookPhoto> gList = photoMapper.findBybno(sale.get(i).getBno());
			String[] day = gList.get(0).getUploadPath().split("\\\\");

			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(0).getUuid() + "_"
					+ gList.get(0).getFileName();

			sale.get(i).setUrl(f);

		}

		return sale;
	}

	/* 관리자페이지에 수취 요청, 수취 승인, 수취 완료 상품 불러오기 */
	@Override
	public List<SaleVO> receiveList() {
		List<SaleVO> sale = mapper.getlistlist5();

		for (int i = 0; i < sale.size(); i++) {
			log.info("수취");
			List<GettingBookPhoto> gList = photoMapper.findBybno(sale.get(i).getBno());
			String[] day = gList.get(0).getUploadPath().split("\\\\");

			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(0).getUuid() + "_"
					+ gList.get(0).getFileName();

			sale.get(i).setUrl(f);

		}

		return sale;
	}

	/* 관리자페이지에 상품 준비중, 배송 중, 배송 완료 상품 불러오기 */
	@Override
	public List<SaleVO> shippingList() {
		List<SaleVO> sale = mapper.getlistlist3();

		for (int i = 0; i < sale.size(); i++) {
			log.info("주문내역");
			List<GettingBookPhoto> gList = photoMapper.findBybno(sale.get(i).getBno());
			String[] day = gList.get(0).getUploadPath().split("\\\\");

			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(0).getUuid() + "_"
					+ gList.get(0).getFileName();

			sale.get(i).setUrl(f);

		}

		return sale;
	}

	/* 관리자 페이지에 판매자가 입력한 송장번호 업데이트 */
	@Override
	public void snsubmit2(DataListVO vo) {
		mapper.snsubmit(vo);

	}

	/* 전체 게시물 개수 */
	public int getTotal(SearchVO cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	/* 게시물 사진 페이징 처리 기능 */
	@Override
	public List<SaleVO> getList(SearchVO cri) {
		log.info("getListWithPaging....." + cri);
		List<SaleVO> sale = mapper.getListWithPaging(cri);
		for (int i = 0; i < sale.size(); i++) {
			log.info("페이징");
			List<GettingBookPhoto> gList = photoMapper.findBybno(sale.get(i).getBno());
			String[] day = gList.get(0).getUploadPath().split("\\\\");

			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(0).getUuid() + "_"
					+ gList.get(0).getFileName();

			sale.get(i).setUrl(f);

		}

		return sale;
	}

	/* 장르별 게시물 개수 */
	public int getGenreCounts(SearchVO cri) {
		return mapper.getGenreCount(cri);

	}

	/* 사용자가 입력한 장르 별로 게시물 리스트 생성 */
	public List<SaleVO> getGenreList(SearchVO cri) {
		List<SaleVO> sale = mapper.getListGenrePaging(cri);
		for (int i = 0; i < sale.size(); i++) {
			log.info("장르");
			List<GettingBookPhoto> gList = photoMapper.findBybno(sale.get(i).getBno());
			String[] day = gList.get(0).getUploadPath().split("\\\\");

			String f = day[0] + "\\" + day[1] + "\\" + day[2] + "\\" + gList.get(0).getUuid() + "_"
					+ gList.get(0).getFileName();

			sale.get(i).setUrl(f);

		}

		return sale;

	}

}