package com.prj.edu.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.prj.edu.dto.BoardDTO;
import com.prj.edu.dto.CmtDTO;
import com.prj.edu.service.BoardService;


@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardService service;
	

	@RequestMapping(value = "/boardlist.go", method = RequestMethod.GET)
	public String home(Model model) {
	
		return "boardList";
	}

	//리스트 아작스 요청
	@RequestMapping("/boardlist.ajax")
	@ResponseBody
	public HashMap<String, Object> list1(
			@RequestParam HashMap<String, String> params, HttpSession session) {
		
	
		logger.info("session loginId" + session.getAttribute("loginId"));
	
		logger.info("params  : {}" + params);
		
		return service.list(params);
	}
	
	
	//상세보기 이동
	@RequestMapping(value = "/boarddetail.go")
	public String detail(Model model, HttpSession session, @RequestParam String board_idx) {
	
		String page = "boardList"; //redirect:/
		logger.info("상세보기 요청 : " + board_idx);
		
		if(session.getAttribute("loginId") != null) {
			service.board_hits(board_idx); //조회수
			BoardDTO dto = service.boarddetail(board_idx);
			if(dto != null) {
				model.addAttribute("dto", dto);
				page = "boarddetail";
				
				//댓글 리스트 출력, DTO만 따로 씀 DAO, mapper 동일함.
				ArrayList<CmtDTO> cmtlist =  service.cmt(board_idx);
				logger.info("댓글? : " + cmtlist.size());
				model.addAttribute("cmtlist", cmtlist);
				model.addAttribute("cmtsize", cmtlist.size());
								
				
			}
		}else {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다,");
		}
			
		
		return page;
	}
	
	//수정하기 이동(수정 상세보기이동)
	@RequestMapping(value = "/boardUpdate.go")
	public String board_updatego(@RequestParam String board_idx, Model model, HttpSession session) {
		logger.info("수정 상세보기 요청 완료" + board_idx);
		logger.info("로그인 아이디 확인 : " + session.getAttribute("loginId"));
		
		//String mb_idchk = service.writerId(session.getAttribute("loginId"));
		//logger.info("작성자 아이디 : " + mb_idchk);
		
		String page = "boarddetail";
		//if(session.getAttribute("loginId").equals(mb_idchk)) {
			BoardDTO dto = service.boarddetail(board_idx);
			model.addAttribute("dto", dto);
			page = "boardUpdate";
		//}else {
			model.addAttribute("msg", "작성자 본인만 수정 가능합니다.");
		//}
		return page;
	}
	
	
	//수정하기
	@RequestMapping(value = "/board_update.do", method = RequestMethod.POST)
	public String board_update (HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		
		logger.info("params : {} " + params);
		String page = "redirect:/boarddetail.go?board_idx=" +params.get("board_idx");
		logger.info(page);
		
		 service.board_update(params);
		
		return page;
	}
	
	/*
	//리스트로 돌아가기
	@RequestMapping(value = "/list.go", method = RequestMethod.GET)
	public String listgo(Model model) {
	
		return "boardList";
	}
	*/
	
	
	@RequestMapping(value = "/boardWrite.go")
	public String writeForm() {
		logger.info("글쓰기 페이지 이동");
		
		return "boardWrite";
	}
	
	//글쓰기
	@RequestMapping(value = "/board_write.do")
	public String board_write(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {
		 
		logger.info("session loginId" + session.getAttribute("loginId"));
		
		
		
		logger.info("글쓰기 요청");
		logger.info("param : {}",params);
		
		service.write(params);
		
		return "redirect:/boardlist.go";
	}
	
	//댓글쓰기
	@RequestMapping(value = "/cmt_write.do")
	public String cmt_write(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("params : {} " , params);
		
		String loginId = (String) session.getAttribute("loginId");
		
		logger.info("게시글번호 : {}", params.get("board_idx"));
		
		params.put("mb_id", loginId);
		
		logger.info("작성자 아이디? : {} " , params.get("mb_id"));
		
		service.cmt_write(params);
		
		return "redirect:/boarddetail.go?board_idx="+params.get("board_idx");
		
	}
	
	@RequestMapping(value = "/cmt_del.do")
	public String cmt_del(@RequestParam String board_idx, @RequestParam String cmt_idx, HttpSession session) {
		
		logger.info("댓글 번호 : {}", cmt_idx);
		String loginId = (String) session.getAttribute("loginId");
		
		//원본 댓글 작성자 아이디를 구해와서 세션과 비교해서 일치할 때만 DB 삭제 진행 하는 로직이 있을 것이고,

		//아니면 무조건 보내서 DB조건에서  거는 로직이 있을 것이다.
		//아이디, cmt_idx
		service.cmtdel(cmt_idx, loginId);
		
		
		
		return "redirect:/boarddetail.go?board_idx="+board_idx;
	}
	
	
}
