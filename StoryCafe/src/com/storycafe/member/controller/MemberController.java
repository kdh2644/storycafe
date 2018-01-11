package com.storycafe.member.controller;


import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.storycafe.board.service.BoardService;
import com.storycafe.member.model.MemberDetailDto;
import com.storycafe.member.model.MemberDto;
import com.storycafe.member.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value="/join.cafe", method=RequestMethod.GET)
	public String join() {
		return "redirect:/member/join.jsp";
	}
	
	@RequestMapping(value="/join.cafe", method=RequestMethod.POST)
	public ModelAndView join(MemberDetailDto memberDetailDto) {
		ModelAndView modelAndView = new ModelAndView();
		
		int cnt = memberService.registerMember(memberDetailDto);
		String viewName = "/index";
		if (cnt != 0) {
			modelAndView.addObject("registerInfo", memberDetailDto);
			viewName = "/WEB-INF/member/joinok";
		}
		modelAndView.setViewName(viewName);
		
		return modelAndView;
	}
	
	@RequestMapping("/idcheck.cafe")
	public @ResponseBody String idCheck(@RequestParam("sid") String sid) {
		int cnt = memberService.idCheck(sid);
		
		JSONObject json = new JSONObject();
		json.put("idcount", cnt);
		json.put("sid", sid);
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="/login.cafe", method=RequestMethod.GET)
	public String login() {
		return "redirect:/log/login.jsp";
	}
	
	@RequestMapping(value="/login.cafe", method=RequestMethod.POST)
	public String login(@RequestParam(value="mid", required=true) String mid, 
			@RequestParam(value="mpass", required=true) String mpass, HttpSession session) {
		
		MemberDto memberDto = memberService.login(mid, mpass);
		session.setAttribute("userInfo", memberDto);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/logout.cafe")
	public String logout(HttpSession session) {
		
		session.removeAttribute("userInfo");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/mypage.cafe")
	public String mypage() {
		return "redirect:/member/mypage_header.jsp";
	}
	
	@RequestMapping("/outofuser.cafe")
	public String outofuser() {
		return "redirect:/member/outofuser.jsp";
	}
	
	@RequestMapping(value="/modify.cafe", method=RequestMethod.GET)
	public String modify() {
		return "redirect:/member/modify.jsp";
	}
	
	@RequestMapping(value="/modify.cafe", method=RequestMethod.POST)
	public ModelAndView modify(@RequestParam("mpass") String mpass, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		String viewName = "/index";
		
		if (memberDto != null) {
			if (mpass.equals(memberDto.getMpass())) {
				viewName = "/member/usermodify";
				modelAndView.setViewName(viewName);
			} 
		} else {
			modelAndView.setViewName(viewName);
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/usermodify.cafe", method=RequestMethod.POST)
	public ModelAndView usermodify(@RequestParam("mno") int mno, @RequestParam("mpass") String mpass, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		String viewName = "/index";
		
		if (memberDto != null) {
			memberDto.setMno(mno);
			memberDto.setMpass(mpass);
			memberService.modifyUserInfo(memberDto);
			viewName = "/member/mypage_header";
			modelAndView.setViewName(viewName);
		} else {
			modelAndView.setViewName(viewName);
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/outOfUser.cafe", method=RequestMethod.POST)
	public ModelAndView outOfUser(@RequestParam("mno") int mno, @RequestParam("mpass") String mpass, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		String viewName = "/index";
		if (memberDto != null) {
			if (mpass.equals(memberDto.getMpass())) {
				memberDto.setMno(mno);
				memberService.outOfUser(mno);
				session.removeAttribute("userInfo");
				modelAndView.setViewName(viewName);			
			} else {
				viewName = "/member/outofuser";
				modelAndView.setViewName(viewName);				
			}
			
		} else {
			modelAndView.setViewName(viewName);
		}
		return modelAndView;
	}
}
