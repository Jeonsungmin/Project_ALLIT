package com.prj.edu.dao;

import java.sql.Date;
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

	int joinedu(HashMap<String, Object> params);

	int allCount();

	int eduCount();

	ArrayList<UserDTO> list(int cnt, int offset);

	ArrayList<UserDTO> edulist(int cnt, int offset);

	UserDTO userDetail(String mb_id);

	UserDTO eduDetail(String mb_id);

	UserDTO userInfo(String id);

	void delete(String mb_id);

	UserDTO eduInfo(String id);

	int userupdate(HashMap<String, Object> params);

	int userCategory(String loginId);

	int blackCount();

	ArrayList<UserDTO> blackList(int cnt, int offset);

	int qnaallCount(String name);

 	int mbStop(HashMap<String, Object> params);

	Date stopdate(String loginId);

	UserDTO userdto(String loginId);

	int cate(String mb_id, int i);

	int usallCount(String loginId);


}
