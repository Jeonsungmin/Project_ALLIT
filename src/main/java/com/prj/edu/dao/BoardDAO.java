package com.prj.edu.dao;

import java.util.ArrayList;

import com.prj.edu.dto.BoardDTO;

public interface BoardDAO {

	

	int allCount();

	ArrayList<BoardDTO> list(int cnt, int offset);

	BoardDTO detail(String board_idx);

}
