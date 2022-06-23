package com.prj.edu;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.prj.edu.service.UserService;

@Controller
public class UserController {
	@Autowired UserService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@RequestMapping(value = "/")
	public String home(Model model) {
		logger.info("사이트 정상 진입");
		return "main";
	}

	@RequestMapping(value = "/login.go")
	public String login( Model model) {
		logger.info("비회원 로그인 페이지");
		return "login";
	}
	@RequestMapping(value = "/joinForm.go")
	public String joinForm1( Model model) {
		logger.info("비회원 회원가입 페이지");
		return "joinForm";
	}

	@RequestMapping(value = "/joinForm")
	public String joinForm(Model model) {
		logger.info("회원가입 페이지 들어갔는지");
		return "joinForm";
	}

	@RequestMapping(value = "/login")
	public String login(Model model, HttpServletRequest request) {
		logger.info("로그인 페이지");
		String mb_id = request.getParameter("mb_id");
		String mb_pass = request.getParameter("mb_pw");
		logger.info(mb_id+"/"+mb_pass);
		String loginId = service.login(mb_id,mb_pass);
		logger.info("로그인 아이디 : "+loginId);
		String msg = "아이디 또는 비밀번호를 확인 하세요";
		String page = "login";
		logger.info("{}",service.cnt(mb_id));
		HttpSession session = request.getSession();
		session.setAttribute("loginId", loginId);
		if(service.cnt(mb_id)>0) {
			msg="정지된 회원입니다.";
			page="login";
		}else if(loginId != null) {
			page = "main";
			msg = loginId+"님 반갑습니다.";	
		}
		model.addAttribute("msg", msg);
		return page;
	}

	@RequestMapping(value = "/edujoin.go")
	public String eduJoin( Model model) {
		logger.info("교육기관 회원가입 페이지");
		return "eduJoin";
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
			model.addAttribute("msg","회원님의 비밀번호는 "+service.pwsearch(mb_id,mb_email,mb_tel)+" 입니다.");
		}else {
			model.addAttribute("msg","올바른 정보를 입력해주세요.");
		}
		return path;
	}
	@RequestMapping(value = "/pwequl.ajax")
	@ResponseBody
	public HashMap<String, Object> pwequl(@RequestParam String pass, @RequestParam String pw) {
		logger.info("비밀번호 일치 하는지?");
		logger.info(pass,pw);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("equl",pass.equals(pw));
		return map;
	}

	@RequestMapping("/overlay.ajax")
	@ResponseBody
	public HashMap<String, Object> overaly(@RequestParam String chkId) {
		logger.info("아이디 중복 체크 : "+chkId);
		return service.overlay(chkId);
	}


	@RequestMapping(value = "/newPass")
	public String newPass(Model model, HttpServletRequest request) {
		String mb_pass1 = request.getParameter("mb_pass1");
		String mb_pass2 = request.getParameter("mb_pass2");
		logger.info("비밀번호 변경 페이지 설정");
		logger.info(mb_pass1+"/"+mb_pass2);
		if(mb_pass1.equals(mb_pass2)) {
			service.newpass(mb_pass1);
			model.addAttribute("msg","비밀번호가 변경되었습니다.");
		}else {
			model.addAttribute("msg","비밀번호가 일치하지 않습니다.");
		}
		return "login";
	}

	@RequestMapping("/join.ajax")
	@ResponseBody
	public HashMap<String, Object> join(@RequestParam HashMap<String, Object> params){
		logger.info("회원가입: "+params);
		return service.join(params);
	}
}
