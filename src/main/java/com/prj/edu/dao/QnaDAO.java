package com.prj.edu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.prj.edu.dto.QnaDTO;

public interface QnaDAO {


	int allCount();

	ArrayList<QnaDTO> list(int cnt, int offset);

	int write(HashMap<String, String> params);

	QnaDTO detail(String qna_idx);

	int answer(HashMap<String, String> params);

	QnaDTO dbdetail(String qna_idx);



}
