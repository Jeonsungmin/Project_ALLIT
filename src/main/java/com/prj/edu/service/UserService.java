package com.prj.edu.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.prj.edu.dao.BoardDAO;
import com.prj.edu.dao.PhotoDAO;
import com.prj.edu.dao.QnaDAO;
import com.prj.edu.dao.UserDAO;
import com.prj.edu.dto.BoardDTO;
import com.prj.edu.dto.EduDTO;
import com.prj.edu.dto.QnaDTO;
import com.prj.edu.dto.UserDTO;

@Service
public class UserService {
	@Autowired UserDAO dao;
	@Autowired QnaDAO qnadao;
	@Autowired BoardDAO boarddao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String login(String mb_id, String mb_pass) {
		logger.info("로그인이 잘 들어왔나?");
		return dao.login(mb_id,mb_pass);
	}

	public HashMap<String, Object> join(HashMap<String, Object> params) {
		logger.info("회원가입 이동이 되나?");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.join(params);
		boolean msg = row>0?true:false;
		map.put("msg", msg);
		return map;
	}

	public String idsearch(String mb_email, String mb_tel) {
		logger.info("아이디 찾기가 잘 되는가?");
		return dao.idsearch(mb_email, mb_tel);
	}

	public String pwsearch(String mb_id, String mb_email, String mb_tel) {
		logger.info("비밀번호 찾기가 잘 되는가?");
		return dao.pwsearch(mb_id,mb_email,mb_tel);
	}

	public int newpass(String mb_pass1) {
		logger.info("비밀번호 변경이 잘 되는가?");
		return dao.newpass(mb_pass1);
	}

	/*public int edujoin(MultipartFile[] photos, HashMap<String, Object> params) {
	    logger.info("교육기관 회원 이동이 잘되는지?");  
	    int row = dao.save(dto); 

	    int photo_pr_num = dto.getEdu_idx();

	    for(MultipartFile photo:photos) {
	         String photo_original = photo.getOriginalFilename();
	         logger.info("photo name: " + photo.getOriginalFilename());

	         if(!photo.getOriginalFilename().equals("")) {
	            logger.info("업로드 진행");
	            String ext = photo_original.substring(photo_original.lastIndexOf(".")).toLowerCase();
	            String photo_copy = System.currentTimeMillis() + ext;
	            String photo_category = "사업자 등록증";

	            logger.info(photo_original + photo_copy + photo_category);            

	            PhotoDAO.fileWrite(photo_original, photo_copy, photo_pr_num, photo_category);
	            logger.info(photo_copy + "save ok");      
	         }
	      }                
	      return dao.eduJoin(params);
	   }*/

	public HashMap<String, Object> overlay(String chkId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String ID = dao.overlay(chkId);
		boolean msg = ID==null?false:true;
		map.put("msg",msg);
		return map;
	}

	public int cnt(String mb_id) {
		logger.info("정지된 회원인지?");
		return dao.cnt(mb_id);
	}

	public int joinedu(HashMap<String, Object> params) {
		logger.info("교육기관 회원가입 되는지?");
		return dao.joinedu(params);
	}

	public HashMap<String, Object> list(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("일반 회원 페이지");
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : " + page);
		int allCnt = dao.allCount();
		logger.info("allCnt:" + allCnt);
		int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
		logger.info("pages : " + pages);
		if(page > pages) {
			page = pages;
		} 
		map.put("pages", pages);      //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		int offset = (page-1) * cnt;
		logger.info("offset : " + offset);            
		ArrayList<UserDTO> list = dao.list(cnt, offset);

		map.put("list", list);
		return map;
	}

	public HashMap<String, Object> edulist(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("교육기관 회원 페이지");
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : " + page);
		int allCnt = dao.eduCount();
		logger.info("allCnt:" + allCnt);
		int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
		logger.info("pages : " + pages);
		if(page > pages) {
			page = pages;
		} 
		map.put("pages", pages);      //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		int offset = (page-1) * cnt;
		logger.info("offset : " + offset);            
		ArrayList<UserDTO> list = dao.edulist(cnt, offset);
		logger.info("{} ",list);
		map.put("list", list);
		return map;
	}

	public HashMap<String, Object> mslist(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("Q&A 답변 페이지");
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : " + page);
		int msCnt = qnadao.msCount();
		logger.info("msCnt:" + msCnt);
		int pages = msCnt%cnt > 0 ? (msCnt/cnt)+1 : (msCnt/cnt);
		logger.info("pages : " + pages);
		if(page > pages) {
			page = pages;
		} 
		map.put("pages", pages);      //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		int offset = (page-1) * cnt;
		logger.info("offset : " + offset);            
		ArrayList<QnaDTO> list = qnadao.mslist(cnt, offset);
		logger.info("{}, ",list);
		map.put("list", list);

		return map;
	}

	public UserDTO userDetail(String mb_id) {
		UserDTO dto = null;
		logger.info(mb_id + "일반회원 상세보기 서비스 요청");
		dto = dao.userDetail(mb_id);

		return dto;
	}

	public UserDTO eduDetail(String mb_id) {
		UserDTO dto = null;
		logger.info(mb_id + "교육기관회원 상세보기 서비스 요청");
		dto = dao.eduDetail(mb_id);

		return dto;
	}

	public UserDTO userInfo(String id) {
		UserDTO dto = null;
		logger.info(id + "개인정보 조회 서비스 요청");
		dto = dao.userInfo(id);

		return dto;
	}
	public void delete(String mb_id) {
		logger.info("탈퇴 서비스 요청");
		dao.delete(mb_id);
	}

	public UserDTO eduInfo(String id) {
		UserDTO dto = null;
		logger.info(id + "개인정보 조회 서비스 요청");
		dto = dao.eduInfo(id);

		return dto;
	}

	public HashMap<String, Object> userupdate(HashMap<String, Object> params) {
		logger.info("{} : 수정하기 확인");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int num = dao.userupdate(params);
		map.put("msg",num);
		return map;
	}

	public int userCategory(String loginId) {
		return dao.userCategory(loginId);
	}

	public HashMap<String, Object> reportList(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("신고 회원 리스트 페이지");
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : " + page);
		int rpCnt = boarddao.reportCount();
		logger.info("rpCnt:" + rpCnt);
		int pages = rpCnt%cnt > 0 ? (rpCnt/cnt)+1 : (rpCnt/cnt);
		logger.info("pages : " + pages);
		if(page > pages) {
			page = pages;
		} 
		map.put("pages", pages);      //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		int offset = (page-1) * cnt;
		logger.info("offset : " + offset);            
		ArrayList<BoardDTO> list = boarddao.reportList(cnt, offset);
		logger.info("{} ",list);
		map.put("list", list);
		return map;
	}

	public String loginok(String mb_id, int num) {
		String page = "login";
		switch(num) {
		case 1: page = "redirect:/userInfo.go?mb_id="+mb_id;
		break;
		case 2: page = "redirect:/eduInfo.go?mb_id="+mb_id;
		break;
		case 3: page = "userList";
		break;
		case 4: page = "userList";
		break;  
		default : page = "login";
		break;
		}
		return page;
	}

	public HashMap<String, Object> blackList(HashMap<String, String> params) {
	       HashMap<String, Object> map = new HashMap<String, Object>();
	         logger.info("정지 회원 리스트 페이지");
	         int cnt = Integer.parseInt(params.get("cnt"));
	         int page = Integer.parseInt(params.get("page"));
	         logger.info("보여줄 페이지 : " + page);
	         int blCnt = dao.blackCount(); //bl = black
	         logger.info("blCnt:" + blCnt);
	         int pages = blCnt%cnt > 0 ? (blCnt/cnt)+1 : (blCnt/cnt);
	         logger.info("pages : " + pages);
	         if(page > pages) {
	            page = pages;
	         } 
	         map.put("pages", pages);      //만들 수 있는 최대 페이지 수
	         map.put("currPage", page); //현재 페이지
	         int offset = (page-1) * cnt;
	         logger.info("offset : " + offset);            
	         ArrayList<UserDTO> list = dao.blackList(cnt, offset);
	         logger.info("{} ",list);
	         map.put("list", list);
	         return map;
	   }

	public HashMap<String, Object> usqnalist(HashMap<String, String> params, String name) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("작성한 Q&A 확인 페이지");
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		int allCnt = dao.allCount();
		int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
		if(page > pages) {
			page = pages;
		} 
		map.put("pages", pages);      //만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
		int offset = (page-1) * cnt;
		logger.info("offset : " + offset);            
		ArrayList<QnaDTO> list = qnadao.usqnalist(cnt, offset, name);
		
		map.put("list", list);
		return map;
	}

	public void blind(String board_idx, String blindYn, String report_idx , String report_state) {
		boarddao.blind(board_idx, blindYn);
		boarddao.report_state(report_idx, report_state);
		logger.info("업데이트 요청한 report : " + report_idx + " / " + report_state);
	}
	
}
