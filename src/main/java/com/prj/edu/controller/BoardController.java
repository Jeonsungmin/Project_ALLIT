package com.prj.edu.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

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
import com.prj.edu.service.BoardService;


@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardService service;
	
<<<<<<< HEAD
	@RequestMapping(value = "/board", method = RequestMethod.GET)
=======

	@RequestMapping(value = "/", method = RequestMethod.GET)
>>>>>>> origin/master
	public String home(Model model) {
	
		return "boardList";
	}

	//리스트 아작스 요청
	@RequestMapping("list.ajax")
	@ResponseBody
	public HashMap<String, Object> list1(
			@RequestParam HashMap<String, String> params
			) {
	
		logger.info("리스트 요청!!!!!!!!! : {}",params);
		return service.list(params);
	}
	
	
	//상세보기 이동
	@RequestMapping(value = "/detail.go")
	public String detail(Model model, HttpSession session, @RequestParam String board_idx) {
		
		service.board_hits(board_idx);
		
		logger.info("상세보기 요청 : " + board_idx);
		
		BoardDTO dto = service.detail(board_idx);
		model.addAttribute("dto", dto);
		
		
		return "detail";
	}
	
	//수정하기 이동(수정 상세보기이동)
	@RequestMapping(value = "/boardUpdate.go")
	public String board_updatego(@RequestParam String board_idx, Model model) {
		logger.info("수정 상세보기 요청 완료" + board_idx);
		BoardDTO dto = service.detail(board_idx);
		model.addAttribute("dto", dto);
		
		return "boardUpdate";
	}
	
	
	//수정하기
	@RequestMapping(value = "/board_update.do", method = RequestMethod.POST)
	public String board_update (HttpSession session, Model model, 
			@RequestParam HashMap<String, String> params) {
		
		logger.info("params : {} " + params);
		String page = "redirect:/detail.go?board_idx=" +params.get("board_idx");
		logger.info(page);
		
		 service.board_update(params);
		
		return page;
	}
	
	//리스트로 돌아가기
	@RequestMapping(value = "/list.go", method = RequestMethod.GET)
	public String listgo(Model model) {
	
		return "boardList";
	}
	
	@RequestMapping(value = "/boardWrite.go")
	public String writeForm() {
		logger.info("글쓰기 페이지 이동");
		return "boardWrite";
	}
	
	@RequestMapping(value = "/board_write.do")
	public String board_write(Model model, @RequestParam HashMap<String, String> params) {
		 
		
		logger.info("글쓰기 요청");
		logger.info("param : {}",params);
		
//		String subject = request.getParameter("subject");
//		String content = request.getParameter("content");
//		String user_name= request.getParameter("user_name");
//		
//		logger.info(subject + "/" + content + "/" + user_name);
		service.write(params);
		
		return "redirect:/list.go";
	}
	
	
	
}
