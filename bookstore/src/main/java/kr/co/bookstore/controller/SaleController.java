package kr.co.bookstore.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bookstore.domain.CartVO;
import kr.co.bookstore.domain.DataListVO;
import kr.co.bookstore.domain.GettingBookPhoto;
import kr.co.bookstore.domain.LoginVO;
import kr.co.bookstore.domain.PageDTO;
import kr.co.bookstore.domain.SaleVO;
import kr.co.bookstore.domain.SearchVO;
import kr.co.bookstore.service.BookService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


/**
 * 판매 처리 컨트롤러
 * 게시물의 권한 처리, 데이터 전달.
 */
@Log4j
@Controller
@RequestMapping("/bookstore/*")
@AllArgsConstructor

public class SaleController {

	private BookService service;

	/*
	 * 판매자가 게시물을 올리면 관리자만 볼 수 있게 권한 처리.
	 * boolean 타입 setTf값을 0으로 하여
	 * 관리자 페이지에서만 보임.
	 */
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/salebook")
	public String salebook(SaleVO sale, RedirectAttributes rttr) {
		log.info(sale);
		sale.setTf("0");
		service.register(sale);
		return "home";

	}

	/* 사용자 ID 전달 */
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/salebook")
	public void UserName(Principal principal, Model model) {
		model.addAttribute("userName", principal.getName());
		return;

	}

	/* 페이징 처리에 필요한 pageDTO 매핑 */
	@GetMapping("/list")
	public void list(Model model, SearchVO vo) {
		int total = service.getTotal(vo);
		log.info("total" + total);
		model.addAttribute("list", service.getList(vo));
		model.addAttribute("pageMaker", new PageDTO(vo, total));

	}

	/* 게시물 사진 매핑 */
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bNo, @RequestParam("url") String uRl, Model model) {
		log.info("/get");
		model.addAttribute("salebook", service.get(bNo));
		model.addAttribute("url", service.getbnophoto(bNo));
		model.addAttribute("urlone", uRl);

	}

	/* 책 정보와 로그인 정보를 주문내역에 매핑 */
	@GetMapping("/MyPage")
	public void currentUserName(Principal principal, Model model) {
		model.addAttribute("bookInfo", service.getfindbooks(principal.getName()));
		model.addAttribute("logInfo", service.getfindusers(principal.getName()));
		return;
	}

	/* 책 정보를 마이페이지 게시물 수정에 매핑 */
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") Long bNo, Model model) {

		model.addAttribute("salebook", service.get(bNo));

	}

	/* 책 정보를 관리자페이지 게시물 수정에 매핑 */
	@GetMapping("/Adminmodify")
	public void Adminmodify(@RequestParam("bno") Long bNo, Model model) {
		log.info(service.get(bNo).getTf());

		model.addAttribute("salebook", service.get(bNo));

	}

	/* 사용자 정보를 마이페이지 내가쓴글 수정에 매핑 */
	@GetMapping("/modifyinfo")
	public void modifyinfo(@RequestParam("userName") String username, Model model) {

		log.info("/modifyinfo");
		model.addAttribute("userinfo", service.getfindusers(username));
		String[] a = service.getfindusers(username).getUsermail().split("@");
		model.addAttribute("usermail1", a[0]);
		model.addAttribute("usermail2", a[1]);

	}

	/* 사용자 정보를 마이페이지 사용자정보 수정에 매핑 */
	@PostMapping("/membershipModify")
	public String membershipModify(LoginVO vo, RedirectAttributes rttr) {
		log.info(vo);
		service.modifyInfo(vo);
		return "redirect:/bookstore/MyPage";
	}

	/* 게시물 사진을 배열로 가져와 매핑 */
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<GettingBookPhoto>> getAttachList(Long bno) {
		log.info("getAttachList: " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}

	/* 게시물 쓰기 매핑 */
	@PostMapping("/updatebook")
	public String updatebook(SaleVO sale, RedirectAttributes rttr) {
		log.info(sale);
		service.updatebook(sale);
		service.modify(sale);
		return "redirect:/bookstore/MyPage";

	}

	/* 관리자 게시물 쓰기 매핑 */
	@PostMapping("/adminupdatebook")
	public String adminupdatebook(SaleVO sale, RedirectAttributes rttr) {
		log.info(sale);
		service.up2list(sale);
		service.modify(sale);
		return "redirect:/bookstore/AdminPage";

	}

	/* 장바구니 추가기능 매핑 */
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	@ResponseBody
	public String cart(Long bno, Principal principal) throws Exception {

		CartVO cart = new CartVO();
		cart.setBno(bno);
		cart.setUserName(principal.getName());
		return service.cartAdd(cart);
	}

	/* 장바구니 페이지 매핑 */
	@GetMapping("/Cart")
	public void cartList(Principal principal, Model model) {
		model.addAttribute("list", service.cartLists(principal.getName()));
	}

	/* 장바구니 삭제 기능 매핑 */
	@RequestMapping(value = "/removecart", method = RequestMethod.POST)
	@ResponseBody
	public String deletecart(Long bno, Principal principal) throws Exception {

		CartVO cart = new CartVO();
		cart.setBno(bno);
		cart.setUserName(principal.getName());
		service.removecart(cart);
		return "redirect:/bookstore/Cart";
	}

	/* 내가쓴글 삭제기능 매핑 */
	@RequestMapping(value = "/mypagedelete", method = RequestMethod.POST)
	@ResponseBody
	public String mypagedelete(@RequestParam("bno") Long bno) throws Exception {

		return service.mypagedelete(bno);
	}

	/* 주문내역 매핑 */
	@GetMapping("/OrderList")
	public void orderList(Model model, Principal principal) {
		log.info(service.getorderlistAdd(principal.getName()));
		model.addAttribute("list", service.getorderlistAdd(principal.getName()));

	}

	/* 관리자페이지 매핑*/
	@GetMapping("/AdminPage")
	public void AdminPage(Model model) {
		model.addAttribute("adminList", service.getAdminList());
	}

	/* 바로구매 기능 매핑 */
	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	@ResponseBody
	public String mybuy(Long bno, Principal principal) throws Exception {
		CartVO vo = new CartVO();
		vo.setBno(bno);
		vo.setUserName(principal.getName());
		return service.orderlistAdd(vo);
	}

	/* 반품 기능 매핑 */
	@RequestMapping(value = "/refundorder", method = RequestMethod.POST)
	@ResponseBody
	public String refundorder(@RequestParam(value = "dataList[]") List<String> dataList,
			@RequestParam(value = "bno[]") List<Long> bno) throws Exception {
		DataListVO vo = new DataListVO();
		for (int i = 0; i < dataList.size(); i++) {
			vo.setBno(bno.get(i));
			vo.setDataList(dataList.get(i));
			service.refundorder(vo);
		}

		return "succeed";
	}

	/* 관리자페이지 반품처리 기능 매핑 */
	@GetMapping("/AdminRefund")
	public void AdminRefund(Model model) {

		model.addAttribute("list", service.refundorderList());
		model.addAttribute("list2", service.refundorderList2());
	}

	/* 관리자페이지 배송관리 기능 매핑 */
	@GetMapping("/AdminShipping")
	public void AdminShipping(Model model) {

		model.addAttribute("list", service.shippingList());
	}

	/* 관리자페이지 수취처리 기능 매핑 */
	@GetMapping("/AdminReceive")
	public void AdminReceive(Model model) {
		log.info("수취 처리");
		model.addAttribute("list", service.receiveList());
	}

	/* 사용자 송장번호입력 기능 매핑*/
	@RequestMapping(value = "/snsubmit", method = RequestMethod.POST)
	@ResponseBody
	public String snsubmit(@RequestParam("bno") Long bno, @RequestParam("shippingNumber") String shippingNumber)
			throws Exception {
		log.info("상품번호 = " + bno + "송장번호 = " + shippingNumber);
		DataListVO vo = new DataListVO();
		vo.setBno(bno);
		vo.setDataList(shippingNumber);
		service.snsubmit2(vo);
		return null;
	}

	/* 게시물 장르 매핑 */
	@GetMapping("/submenulist")
	public void Submenulist(@RequestParam(value = "hiddenmenu") String hiddenmanu, Model model, SearchVO vo)
			throws Exception {
		vo.setGenre(hiddenmanu);
		log.info("hiddenmanu =" + hiddenmanu);
		int total = service.getGenreCounts(vo);
		log.info("total" + total);
		model.addAttribute("list", service.getGenreList(vo));
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		model.addAttribute("genre", hiddenmanu);
	}

}