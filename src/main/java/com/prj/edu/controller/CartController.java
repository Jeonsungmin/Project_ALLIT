package com.prj.edu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.prj.edu.dto.CartDTO;
import com.prj.edu.dto.UserDTO;
import com.prj.edu.service.CartService;

@Controller
public class CartController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CartService service;
	
	
	// 찜 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
	 logger.info("get cart list");
	 
	 UserDTO member = (UserDTO)session.getAttribute("member");
	 String mb_id = member.getMb_id();
	 logger.info("mb_id");
	 
	 List<CartDTO> cartList = service.cartList(mb_id);
	 
	 model.addAttribute("cartList", cartList);
	 
	}

}
