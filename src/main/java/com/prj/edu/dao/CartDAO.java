package com.prj.edu.dao;

import java.util.List;

import com.prj.edu.dto.CartDTO;

public interface CartDAO {

	List<CartDTO> cartList(String mb_id);

}
