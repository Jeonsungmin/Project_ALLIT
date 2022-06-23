package com.prj.edu.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.edu.dao.CartDAO;
import com.prj.edu.dto.CartDTO;

@Service
public class CartService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CartDAO dao;

	public List<CartDTO> cartList(String mb_id) {
		logger.info("찜리스트 요청");
		return dao.cartList(mb_id);
	}

}
