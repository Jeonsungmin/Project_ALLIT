package com.prj.edu.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.prj.edu.dao.BoardDAO;
import com.prj.edu.dto.BoardDTO;
import com.prj.edu.dto.CmtDTO;

@Service
public class BoardService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired BoardDAO dao;
	
	

	public HashMap<String, Object> list(HashMap<String, String> params) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String board_category = params.get("board_category");
		
		logger.info("board_category : "  + board_category);
			
		int cnt = Integer.parseInt(params.get("cnt"));
		int page = Integer.parseInt(params.get("page"));
		logger.info("보여줄 페이지 : " + page);
		int allCnt = dao.allCount(board_category);
		logger.info("allCnt:" + allCnt);
		int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
		//총갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
		//464				5								= 93pages (마지막페이지 cnt=4)
		//464/5=92.8나옴.	
		
		logger.info("pages : " + pages);
		//currPage = pages
		//currPage가 pages보다 크면 currPage를 pages로 맞춰준다?
		if(page > pages) {
			page = pages;
		}
		
		map.put("pages", pages);		//만들 수 있는 최대 페이지 수
		map.put("currPage", page); //현재 페이지
	
		
		int offset = (page-1) * cnt;
		logger.info("offset : " + offset);
		// page  :  (cnt)     =    offset
		// 1			0~4				0		
		// 2			5~9				5
		// 3			10~14			10
		// 4			15~19			15
		// 5			20	~24			20 
		// 6 			25	~29			25
		//1씩 증가하면 5씩 증가?
		
		
		
		ArrayList<BoardDTO> list = dao.list(cnt, offset, board_category);
		map.put("list", list);
		
		return map;
	}



	public BoardDTO boarddetail(String board_idx) {
		BoardDTO dto = null;
		logger.info(board_idx + "상세보기 서비스 요청");
		dto = dao.boarddetail(board_idx);
		logger.info("content : " + dto.getBoard_content());
		return dto;
	}
	
	
	public boolean write(HashMap<String, String> params) {
		logger.info("글쓰기 서비스");
		boolean success = false;
		
		if(dao.write(params)>0) {
			success = true;
		}
		
		return success;
	}



	public void board_update(HashMap<String, String> params) {
		logger.info("업데이트 서비스 요청");
		int row = dao.board_update(params);
		logger.info("수정된 데이터 수 : " +row);
		
	}



	public void board_hits(String board_idx) {
		logger.info("조회수 증가? " + board_idx);
		dao.board_hits(board_idx);
	}



	public String writerId(Object mb_id) {
		return dao.writerId(mb_id);
	}



	public ArrayList<CmtDTO> cmt(String board_idx) {
		
		return dao.cmtlist(board_idx);
	}



	public boolean cmt_write(HashMap<String, String> params) {
		
		boolean success = false;
		
		if(dao.cmtwrite(params)>0) {
			success = true;
		}
		
		return success;
	}



	public void cmtdel(String cmt_idx, String loginId) {
		dao.cmtdel(cmt_idx, loginId);
		
	}



	

	



	
}