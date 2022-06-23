package com.prj.edu.dao;

import java.util.HashMap;

<<<<<<< HEAD
import javax.servlet.http.HttpSession;

=======
>>>>>>> origin/master
import com.prj.edu.dto.EduDTO;

public interface UserDAO {

	String login(String mb_id, String mb_pass);
<<<<<<< HEAD
	
	
=======
>>>>>>> origin/master

	int join(HashMap<String, Object> params);

	String idsearch(String mb_email, String mb_tel);

	String pwsearch(String mb_id, String mb_email, String mb_tel);

<<<<<<< HEAD
=======
	int newpass(String mb_pass1);

>>>>>>> origin/master
	int save(EduDTO dto);

	int eduJoin(HashMap<String, Object> params);

<<<<<<< HEAD
	String delete(HttpSession session);

	
=======
	String overlay(String chkId);

	int cnt(String mb_id);
>>>>>>> origin/master
}
