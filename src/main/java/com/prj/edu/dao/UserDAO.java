package com.prj.edu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.prj.edu.dto.EduDTO;
import com.prj.edu.dto.UserDTO;

public interface UserDAO {

	String login(String mb_id, String mb_pass);

	int join(HashMap<String, Object> params);

	String idsearch(String mb_email, String mb_tel);

	String pwsearch(String mb_id, String mb_email, String mb_tel);

	int newpass(String mb_pass1);

	int save(EduDTO dto);

	int eduJoin(HashMap<String, Object> params);

	String overlay(String chkId);

	int cnt(String mb_id);

	HashMap<String, Object> joinedu(HashMap<String, Object> params);
	
	int allCount();

	ArrayList<UserDTO> list(int cnt, int offset);
	
	
}
