package bit.com.a.controller;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;

import bit.com.a.model.CGVMemberDto;
import bit.com.a.model.CGVNoMemberDto;
import bit.com.a.model.CGVPayDto;
import bit.com.a.model.CGVReserveDto;
import bit.com.a.service.CGVMemberService;
import bit.com.a.service.CGVPayService;
import bit.com.a.service.CGVReserveService;

@Controller
public class CGVReserveController {

	@Autowired
	CGVReserveService cgvReserveService;
	
	@Autowired
	CGVMemberService cgvMemberService;
	
	@Autowired
	CGVPayService cgvPayService;
	
	private static Logger logger = LoggerFactory.getLogger(CGVInfoController.class);
	@RequestMapping(value="moveReserve.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String moveReserve() {
		logger.info("moveReserve");
		return "reserve";
	}
	
	// 비회원 예매	
	@RequestMapping(value="moveReserveNoMember.do", method = {RequestMethod.POST})
	public String moveReserveNoMember(Model model, CGVNoMemberDto noMemberDto) {
		logger.info("moveReserve");
		
		System.out.println("moveReserveNoMember noMemberDto: " + noMemberDto.toString());
		
		cgvMemberService.createNoMember(noMemberDto);
		model.addAttribute("noMember", noMemberDto);
		
		
		return "reserve";
	}
	
	
	@RequestMapping(value="moveSeat.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String moveSeat(Model model, CGVReserveDto dto) {
		
		System.out.println("moveSeat dto: " + dto.toString());
		logger.info("moveSeat");
		model.addAttribute("reserve", dto);
		
		return "seat";
	}
	

	@RequestMapping(value="moveKakao.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String moveKakao(Model model, CGVReserveDto dto, CGVPayDto payDto, HttpSession session) {	
		System.out.println(dto.toString());
		logger.info("moveKakao");
		
		// 비회원 기준 : view에서 reserve DTO에 이미 id값이 있는 경우는 비회원으로 분류
		// 회원인 경우
		if(StringUtils.isEmpty(dto.getId())) {
			CGVMemberDto login =(CGVMemberDto)session.getAttribute("login");
			dto.setId(login.getId());
		}
		
		boolean isSuccess = cgvReserveService.CGVReserve(dto);
		System.out.println(isSuccess);
		model.addAttribute("reserve", dto);
		model.addAttribute("pay", payDto);
		if(isSuccess == false) {
			System.out.println("오류가 났어요...");
			return "redirect:/moveMain.do";
		}
		return "kakao";
	}
	
	@RequestMapping(value="payKakao.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String payKakao(Model model, CGVReserveDto dto, CGVPayDto payDto, HttpSession session) {	
		
		logger.info("moveKakao");
		// 비회원 기준 : view에서 reserve DTO에 이미 id값이 있는 경우는 비회원으로 분류
		// 회원인 경우
		if(StringUtils.isEmpty(dto.getId())) {
			CGVMemberDto login =(CGVMemberDto)session.getAttribute("login");
			dto.setId(login.getId());
		}
		
		 System.out.println(dto.toString() +"이것이 dto다");
		 List<CGVReserveDto> list = cgvReserveService.getCGVReserve(dto);
		/* CGVReserveDto cgvReserveDto = cgvReserveService.getCGVReserve(dto); */
//		if(cgvReserveDto != null) {
			System.out.println("여기있다");
//			System.out.println(cgvReserveDto.toString());
//		}
		payDto.setId(list.get(0).getId());
		payDto.setReserveSequence(list.get(0).getReserveSequence());
		System.out.println("문제찾기");
		System.out.println(payDto.toString());
		boolean isSuccess = cgvPayService.payTicket(payDto);
		System.out.println(isSuccess);
		if(isSuccess == false) {
			System.out.println("오류가 났어요...");
			return "redirect:/moveMain.do";
		}
		model.addAttribute("type", "reserve");
		model.addAttribute("isSuccess", isSuccess);
		/*
		 * model.addAttribute("reserve", dto); model.addAttribute("pay", payDto);
		 */
		
		return "process";
	}
	
	@RequestMapping(value="moveMypage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String moveMain(Model model, CGVReserveDto reserveDto, CGVPayDto payDto, HttpSession session) {
		CGVMemberDto login =(CGVMemberDto)session.getAttribute("login");
		CGVMemberDto param = new CGVMemberDto();
		 
		reserveDto.setId(login.getId());
		param.setId(login.getId());
		
		List<CGVReserveDto> list = cgvReserveService.getPayJoinTable(reserveDto);
		
		// 회원정보 조회
		CGVMemberDto user = cgvMemberService.getMemberInfo(param);
		model.addAttribute("user", user);
		
		
		System.out.println("moveMypage list : : : " + list.toString());

		if(list != null) {
			for(CGVReserveDto dto : list) {
				System.out.println(dto.toString());
				model.addAttribute("reserveList", list);
			}
			
		}else {
			System.out.println("이것이 오류다");
		}
		
		
		return "myPage";
	}
	
	// 영화 내역 수정 페이지로 이동
	@RequestMapping(value = "moveModifyMovie.do", method = { RequestMethod.GET })
	public String moveModifyMovie(Model model, HttpSession session, @RequestParam("reserveSeq")int reserveSeq) {
		logger.info("moveReserve");
//		logger.info("moveModifyMovie");
		
		CGVReserveDto reserveDto = new CGVReserveDto();
		CGVMemberDto login =(CGVMemberDto)session.getAttribute("login");
		reserveDto.setReserveSequence(reserveSeq);
		reserveDto.setId(login.getId());
		
		CGVReserveDto movie = cgvReserveService.getReserveMovie(reserveDto);
		
		model.addAttribute("movie", movie);

		return "moveMypage";
//		return "modifyMovie";

	}
	
	// 영화 내역 수정 페이지에서 수정버튼 클릭시 데이터를 update 한다. 
	@RequestMapping(value = "moveModifyMovie.do", method = { RequestMethod.POST })
//	@RequestMapping(value = "modifyMovie.do", method = { RequestMethod.POST })
	public String modifyMovie(Model model, CGVReserveDto dto, HttpSession session) {
		logger.info("moveReserve");
//		logger.info("modify");
		
		boolean isSuccess = cgvReserveService.modifyMovie(dto);
		
		return "redirect:/moveMain.do";

	}
	
	// 영화 내역 삭제
	@RequestMapping(value = "deleteMovie.do", method = { RequestMethod.GET })
	public String deleteMovie(Model model, HttpSession session, @RequestParam("reserveSeq")int reserveSeq) {
		logger.info("delete");
		
		cgvReserveService.deleteMoviePay(reserveSeq);
		boolean isSuccess = cgvReserveService.deleteMovie(reserveSeq);
		
		return "redirect:/moveMain.do";

	}
	
	// 비회원 로그인
	@RequestMapping(value = "moveNoMemberReserved.do", method = { RequestMethod.GET })
	public String moveNoMemberReserved() {
		logger.info("moveNoMemberReserved");
		
		return "noMemberReserved";
	}
		
	// 비회원 영화 예매내역 조회
	@RequestMapping(value="noMemberPage.do", method = {RequestMethod.POST})
	public String moveNoMemberReserved(Model model, CGVNoMemberDto noMemberDto) {
		
		// 비회원 정보 조회
		int isNoMember = cgvMemberService.isNoMember(noMemberDto);
		
		if(isNoMember > 0) {
			CGVReserveDto reserveDto = new CGVReserveDto();
			reserveDto.setId(noMemberDto.getPhoneNumber());
			List<CGVReserveDto> list = cgvReserveService.getPayJoinTable(reserveDto);
			
			if(list != null) {
				model.addAttribute("reserveList", list);
				
			}else {
				System.out.println("이것이 오류다");
			}
		} 
		
		model.addAttribute("isNoMember", isNoMember);
		model.addAttribute("phoneNumber", noMemberDto.getPhoneNumber());
		
		return "noMemberPage";
	}
	
	// 영화 내역 수정 페이지로 이동
	@RequestMapping(value = "moveNoMemberModifyMovie.do", method = { RequestMethod.GET })
	public String moveNoMemberModifyMovie(Model model, @RequestParam("reserveSeq")int reserveSeq) {
		logger.info("moveReserve");
//		logger.info("moveNoMemberModifyMovie");
		
		CGVReserveDto reserveDto = new CGVReserveDto();
		reserveDto.setReserveSequence(reserveSeq);
		
		CGVReserveDto movie = cgvReserveService.getReserveMovie(reserveDto);
		
		System.out.println("movie : : : " + movie.toString());
		
		model.addAttribute("movie", movie);
		
		return "moveMypage";

	}
	
	// 비회원 영화 내역 삭제
	@Transactional
	@RequestMapping(value = "deleteMovieNoMember.do", method = { RequestMethod.GET })
	public String deleteMovieNoMember(Model model, HttpSession session, @RequestParam("reserveSeq")int reserveSeq, @RequestParam("phoneNumber")String phoneNumber) {
		logger.info("delete");
		
		CGVNoMemberDto dto = new CGVNoMemberDto();
		dto.setPhoneNumber(phoneNumber);
		
		cgvReserveService.deleteMoviePay(reserveSeq);
		cgvMemberService.deleteNoMember(dto);
		boolean isSuccess = cgvReserveService.deleteMovie(reserveSeq);
		
		return "redirect:/moveMain.do";

	}
	// 0829 장, moveDetail 처리 - 
			@RequestMapping(value="moveDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
			public String moveDetail(@RequestParam("midx") String midx, HttpServletRequest request, HttpServletResponse response) {		
				HttpSession session = request.getSession();
				session.setAttribute("midx", midx);
				logger.info("moveDetail : midx = "+ midx);
				
				return "detail";
			}
	@ResponseBody
	@RequestMapping(value = "reserveSeat.do", method = { RequestMethod.GET, RequestMethod.POST })
			public ArrayList<String> getReserve(String movieDate, String runningTime, String selectedLocation, String selectedTheater) {
				System.out.println("getReserve start. . ."+ movieDate+ ", "+runningTime+", "+selectedLocation+", "+selectedTheater);
				CGVReserveDto dto = new CGVReserveDto(movieDate, runningTime, selectedLocation, selectedTheater);
				List<CGVReserveDto> list = cgvReserveService.getReserveSeats(dto);
				ArrayList<String> reserveSeats = new ArrayList<String>();
				for(int i=0; i<list.size(); i++) {
					CGVReserveDto temp = list.get(i);
					if(temp.getRunningTime().equals(runningTime)) {
						if(temp.getMovieDate().equals(movieDate)) {
							String selectedSeat = temp.getSelectedSeat();
							String[] str = selectedSeat.split(",");
							for(int j=0; j<str.length; j++) {
								reserveSeats.add(str[j]);
								System.out.println(str[j]);
							}
						}
					}
				}
				logger.info("getReserve : " + reserveSeats);
				return reserveSeats;
			}
		}


