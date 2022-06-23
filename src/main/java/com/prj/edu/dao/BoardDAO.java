package com.prj.edu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.prj.edu.dto.BoardDTO;

public interface BoardDAO {

	

	int allCount(String board_category);

	ArrayList<BoardDTO> list(int cnt, int offset, String board_category);

	BoardDTO detail(String board_idx);

	int write(HashMap<String, String> params);

	int board_update(HashMap<String, String> params);

	void board_hits(String board_idx);

	

	



}
