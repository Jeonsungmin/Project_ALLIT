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
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
	
		return "boardList";
	}

	//리스트 아작스 요청
	@RequestMapping("list.ajax")
	@ResponseBody
	public HashMap<String, Object> list(
			@RequestParam HashMap<String, String> params
			) {
	
		logger.info("리스트 요청!!!!!!!!! : {}",params);
		return service.list(params);
	}
	
	//상세보기 이동
	@RequestMapping(value = "/detail.go")
	public String detail(Model model, HttpSession session, @RequestParam String board_idx) {
		
		
		logger.info("상세보기 요청 : " + board_idx);
		
		BoardDTO dto = service.detail(board_idx);
		model.addAttribute("dto", dto);
		
		
		return "detail";
	}
	
	//리스트로 돌아가기
	@RequestMapping(value = "/list.go", method = RequestMethod.GET)
	public String listgo(Model model) {
	
		return "boardList";
	}
	
	
	
}
