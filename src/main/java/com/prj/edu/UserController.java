package com.prj.edu;

import java.util.HashMap;
import java.util.Set;

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

import com.prj.edu.dto.UserDTO;
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

	@RequestMapping(value = "/msdetail.go")
	public String msdetail(Model model) {
		logger.info("Q&A 답변 페이지");
		return "msqnaDetail";
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
		HttpSession session = request.getSession();
		session.setAttribute("loginId", loginId);
		if(loginId != null) {
			page = "userList";
			msg = loginId+"님 반갑습니다.";	
			if(service.cnt(mb_id)>0) {
				msg="정지된 회원입니다.";
				page="login";
			} else {
					
				
			}
		}
		model.addAttribute("msg", msg);
		logger.info("세션에 저장된 아이디 : {}",session.getAttribute("loginId"));
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		service.join(params); 
		service.joinedu(params);
		map.put("msg", 1);
		return map;
	}
    
    @RequestMapping("/mslist.ajax")
    @ResponseBody
    public HashMap<String, Object> mslist(@RequestParam HashMap<String, String> params) {
       logger.info("리스트 요청!!! : {}",params);
       return service.mslist(params);
    }
    
    @RequestMapping(value = "/logout")
    public String logout(Model model, HttpSession session) {
       logger.info("로그아웃 페이지");
       session.removeAttribute("loginId");
       String msg = "로그아웃 되었습니다.";
       model.addAttribute("msg",msg);
       return "login";
    }
    
    @RequestMapping(value = "/userList.go")
    public String userList( Model model) {
       logger.info("로그인후 페이지");
       return "userList";
    }
    
    @RequestMapping(value = "/eduList.go")
    public String eduList( Model model) {
       logger.info("로그인후 페이지");
       return "eduList";
    }
    
  //리스트 아작스 요청
    @RequestMapping("user/list.ajax")
    @ResponseBody
    public HashMap<String, Object> list1(
          @RequestParam HashMap<String, String> params
          ) {
       logger.info("일반회원 리스트 요청!!! : {}",params);
       return service.list(params);
    }
    //리스트 아작스 요청
    @RequestMapping("edu/list.ajax")
    @ResponseBody
    public HashMap<String, Object> list2(
          @RequestParam HashMap<String, String> params
          ) {
       logger.info("교육기관회원 리스트 요청!!! : {}",params);
       return service.list(params);
    }

    @RequestMapping(value = "user/detail.go")
    public String userDetail(Model model, HttpSession session, @RequestParam String mb_id) {
       logger.info("상세보기 요청 : " + mb_id);   
       UserDTO dto = service.userDetail(mb_id);
       model.addAttribute("dto", dto);
       return "userDetail";
    }
    @RequestMapping(value = "edu/detail.go")
    public String eduDetail(Model model, HttpSession session, @RequestParam String mb_id) {
       logger.info("상세보기 요청 : " + mb_id);   
       UserDTO dto = service.eduDetail(mb_id);
       model.addAttribute("dto", dto);
       return "eduDetail";
    }
    
    

}
