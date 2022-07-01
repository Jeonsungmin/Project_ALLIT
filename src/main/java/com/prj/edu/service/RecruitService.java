package com.prj.edu.service;

import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.prj.edu.dao.PhotoDAO;
import com.prj.edu.dao.RecruitDAO;
import com.prj.edu.dto.BoardDTO;
import com.prj.edu.dto.PhotoDTO;

@Service
public class RecruitService {	

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RecruitDAO dao;
	@Autowired PhotoDAO photodao;

	public HashMap<String, Object> list(HashMap<String,String> params) {
	      
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      String recruit_category = params.get("recruit_category");
	      
	      logger.info("recruit_category : " + recruit_category);
	      
	      int cnt = Integer.parseInt(params.get("cnt"));
	      int page = Integer.parseInt(params.get("page"));
	      logger.info("보여줄 페이지 : " + page);
	      
	      int allCnt;
	      
	      if (recruit_category.equals("all")) { //전체보기를 위한 if 문
	    	  allCnt = dao.allCount1();
	      } else {
	    	  allCnt = dao.allCount(recruit_category);
	      }
	      
	      logger.info("allCnt:" + allCnt);
	      int pages = allCnt%cnt > 0 ? (allCnt/cnt)+1 : (allCnt/cnt);
	      //총갯수(allCnt) / 페이지당 보여줄 갯수(cnt) = 생성 가능한 페이지(pages)
	      //464            5                        = 93pages (마지막페이지 cnt=4)
	      //464/5=92.8나옴.   
	      
	      logger.info("pages : " + pages);
	      //currPage = pages
	      //currPage가 pages보다 크면 currPage를 pages로 맞춰준다?
	      if(page > pages) {
	         page = pages;
	      }
	      
	      map.put("pages", pages);      //만들 수 있는 최대 페이지 수
	      map.put("currPage", page); //현재 페이지
	   
	      
	      int offset = (page-1) * cnt;
	      logger.info("offset : " + offset);
	      // page  :  (cnt)     =    offset
	      // 1         0~4            0      
	      // 2         5~9            5
	      // 3         10~14         10
	      // 4         15~19         15
	      // 5         20   ~24         20 
	      // 6          25   ~29         25
	      //1씩 증가하면 5씩 증가?
	      
	      if (recruit_category.equals("all")) { //전체보기를 위한 if 문
	    	  ArrayList<BoardDTO> list = dao.list1(cnt, offset);
	    	  map.put("list", list);
	      } else {
	    	  ArrayList<BoardDTO> list = dao.list(cnt, offset, recruit_category);
	    	  map.put("list", list);
	      }
	      
	      return map;
	   }
	

	public String write(MultipartFile[] r_photo, HashMap<String, String> params) {
		logger.info("글쓰기 서비스 요청");
		
		logger.info("사진" + r_photo);

		int success = dao.write(params);

		logger.info("글 db에 성공하면 1:"+ success);
		
		String id = params.get("recruit_idx"); //글번호 받아오기
		logger.info("방금 넣은 글번호" + id);
		
		int recruit_idx = Integer.parseInt(id); //string을 int로 변환
		logger.info("int로 바꿔줌" + recruit_idx);
		
		if(success>0) { //글작성 성공하면 사진업로드 진행
			photoSave(r_photo, recruit_idx);			
		}
		
			
		logger.info("글쓰기 성공 여부 : " + success);
		
		return "redirect:/recruit/detail.do?idx=" + recruit_idx;

	}
	
	public void photoSave(MultipartFile[] r_photo, int recruit_idx) {
		// 파일 업로드
		for(MultipartFile photo:r_photo) {
			String photo_original = photo.getOriginalFilename(); //3-1파일명 추출
			logger.info("photo name: " + photo.getOriginalFilename());
			
			if(!photo.getOriginalFilename().equals("")) {
				logger.info("업로드 진행");
				
				//3-2 확장자 분리
				String ext = photo_original.substring(photo_original.lastIndexOf(".")).toLowerCase();
				
				//3-3 새 이름 만들기
				String photo_copy = System.currentTimeMillis() + ext;
				
				
				logger.info(photo_original + photo_copy );				
							
				photodao.photoSave(photo_original, photo_copy, recruit_idx);
				logger.info(photo_copy + "save ok");		
			
			}
		}		
						

	}



	public void upHit(String idx) {
		logger.info(idx + " 번 게시물 조회수 up");
		dao.upHit(idx);
	}


	public void recruitDetail(Model model ,String idx) {
		logger.info("상세보기 서비스 요청");
		
		
		BoardDTO dto = dao.recruitDetail(idx);
		ArrayList<PhotoDTO>list=photodao.photoList(idx);
		logger.info("반허?" + idx);
		
		model.addAttribute("recruit", dto);
		model.addAttribute("list", list);
	
	}

	public void closeYn() {
		logger.info("모집여부 검사 서비스 요청");
		int result = dao.closeYn();
		logger.info("모집여부 수정 데이터 수 : " + result);
	}


	public String update(MultipartFile[] r_photo, HashMap<String, String> params) {
		
		int recruit_idx = Integer.parseInt(params.get("recruit_idx"));
		logger.info("수정 요청 서비스");
		int row = dao.update(params);
		
		if(row>0) {
			photoSave(r_photo, recruit_idx);
		}
		logger.info("수정된 데이터 수 : " + row);
		
		return "redirect:/recruit/detail.do?idx="+recruit_idx;
	}


	public ArrayList<BoardDTO> hotList() {
		logger.info("핫 리스트 서비스 요청");
		return dao.hotList();
	}


	public void updateDate() {
		logger.info("날짜 업데이트 서비스 요청");
		int result = dao.updateDate();
		logger.info("날짜 업데이트 데이터 수 : " + result);
	}


	public BoardDTO writeList(String id) {
		logger.info("글쓰기 데이터 자동입력 서비스 요청");
		logger.info("받아온 아이디 : " + id);
		return dao.writeList(id);
	}


	public String findCateId(String cateId) {
		logger.info("카테고리 아이디 찾기 서비스 요청");
		return dao.findCateId(cateId);
	}


	public int delete(String idx) {
		logger.info("삭제 요청 서비스");
		return dao.delete(idx);
	}

//	public String findCateId(String cateId) {
//		logger.info("카테고리 아이디 찾기 서비스 요청");
//		dao.findCateId(cateId);
//	}

	
}
