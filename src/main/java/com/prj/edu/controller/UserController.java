package com.prj.edu.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.prj.edu.service.UserService;

@Controller
public class UserController {
	@Autowired UserService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@RequestMapping(value = "/")
	public String home(Model model) {
		logger.info("사이트 정상 진입");
		return "login";
	}
	
	
	 @RequestMapping(value = "/login")
	   public String login(Model model,
	         @RequestParam String mb_id,@RequestParam String mb_pw,
	         HttpSession session ) {
	      
	      logger.info("로그인 요청");
	      logger.info(mb_id+ " / " +mb_pw);
	      String msg = "아이디 또는 비밀번호를 확인 하세요";
	      String page = "login";
	      
	      String loginId = service.login(mb_id,mb_pw);
	     
	      
	      if(loginId != null) {
	      
	         session.setAttribute("loginId", loginId);
	         
	         logger.info("로그인 아이디 : "+loginId);
	         page = "home";//redirect 는 데이터를 실어 보낼 수 없다.
	         msg = loginId+"님 반갑습니다.";   
	      }
	      model.addAttribute("msg", msg);
	      return page;
	   }
	

	
   @RequestMapping(value = "/action.do")
   public String eduJoin( Model model) {
      logger.info("교육기관 회원가입 페이지");
      return "edujoin";
   }
   
   @RequestMapping(value = "/idFind.go")
   public String idFind( Model model) {
      logger.info("아이디 찾기 페이지");
      return "idFind";
   }
   
   @RequestMapping(value = "/idsearch")
   public String idsearch(Model model, HttpServletRequest request) {
	  String mb_email = request.getParameter("mb_email");
	  String mb_tel = request.getParameter("mb_tel");
	  logger.info("아이디 찾기 페이지 설정");
	  logger.info(mb_email+"/"+mb_tel);
	  if(service.idsearch(mb_email,mb_tel)!=null) { 
		  model.addAttribute("msg","당신의 아이디는 : "+service.idsearch(mb_email,mb_tel)+"입니다.");
	  }else {
		  model.addAttribute("msg","올바른 정보를 입력해주세요.");
	  }
      return "login";
   }
   
   @RequestMapping(value = "/pwFind.go")
   public String pwFind( Model model) {
      logger.info("비밀번호 찾기 페이지");
      return "pwFind";
   }
   
   @RequestMapping(value = "/pwsearch")
   public String pwsearch(Model model, HttpServletRequest request) {
	  String mb_id = request.getParameter("mb_id");
	  String mb_email = request.getParameter("mb_email");
	  String mb_tel = request.getParameter("mb_tel");
	  logger.info("비밀번호 찾기 페이지 설정");
	  logger.info(mb_id+"/"+mb_email+"/"+mb_tel);
	  logger.info(service.pwsearch(mb_id,mb_email,mb_tel));
	  String path="login";
	  if(service.pwsearch(mb_id,mb_email,mb_tel)!=null) { 
		path="newPw";
	  }else {
		  model.addAttribute("msg","올바른 정보를 입력해주세요.");
	  }
      return path;
   }
   
   @RequestMapping(value = "/joinForm")
   public String joinForm(Model model) {
		logger.info("회원가입 페이지 들어갔는지");
		return "joinForm";
   }
    
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, @RequestParam HashMap<String, Object> params) {
		logger.info("회원가입 페이지");
		logger.info("params : {}",params);
		int cnt = service.join(params);
		String msg = "회원가입에 실패했습니다.";
		if(cnt>0) {
			msg = "회원가입에 성공했습니다.";
		}
		logger.info(msg);
		model.addAttribute("msg",msg);
		return "login";
	}
	
	@RequestMapping(value = "/edujoin", method = RequestMethod.POST)
	public String edujoin(Model model, MultipartFile[] photos, @RequestParam HashMap<String, Object> params) {
		logger.info("회원가입 페이지 시작");
		logger.info("params : {}",params);
		
		int cnt = service.edujoin(photos, params);
		String msg = "회원가입에 실패했습니다.";
		if(cnt>0) {
			msg = "회원가입에 성공했습니다.";
		}
		logger.info(msg);
		model.addAttribute("msg",msg);
		return "login";
	}
		
	/*@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request) {
		
		//session.getAttribute("mb_id");
		logger.info("탈퇴 시작");
		HttpSession session = request.getSession();
		String mb_id = (String)session.getAttribute("mb_id");
		//request.getParameter("mb_id");
		logger.info("탈퇴 요청" + mb_id);
		service.delete(mb_id);
		
		return "login";
	}*/
	
	@RequestMapping(value = "/delete")
	public String delete(HttpSession session) {		
		String msg = session.getId();
		logger.info("탈퇴 시작 : "+msg);
		//service.delete(session);
		return "login";
	}
}
