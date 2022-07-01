package com.prj.edu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.prj.edu.dto.BoardDTO;

public interface RecruitDAO {

	int allCount(String recruit_category);

	ArrayList<BoardDTO> list(int cnt, int offset, String recruit_category);

	void upHit(String idx);

	BoardDTO recruitDetail(String idx);

	int closeYn();

	int update(HashMap<String, String> params);

	int allCount1();

	ArrayList<BoardDTO> list1(int cnt, int offset);

	ArrayList<BoardDTO> hotList();

	int updateDate();

	BoardDTO writeList(String id);

	String findCateId(String cateId);

	int delete(String idx);

	int write(HashMap<String, String> params);

	
	
	int rewrite(BoardDTO dto);

//	ArrayList<BoardDTO> writeList(String id);

}
