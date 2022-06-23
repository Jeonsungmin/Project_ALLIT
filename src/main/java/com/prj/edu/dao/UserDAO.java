package com.prj.edu.dao;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.prj.edu.dto.EduDTO;

public interface UserDAO {

	String login(String mb_id, String mb_pass);
	
	

	int join(HashMap<String, Object> params);

	String idsearch(String mb_email, String mb_tel);

	String pwsearch(String mb_id, String mb_email, String mb_tel);

	int save(EduDTO dto);

	int eduJoin(HashMap<String, Object> params);

	String delete(HttpSession session);

	
}
