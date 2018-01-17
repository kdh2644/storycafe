package com.storycafe.admin.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.storycafe.admin.member.service.MemberAdminService;
import com.storycafe.common.service.CommonService;
import com.storycafe.member.model.MemberDetailDto;
import com.storycafe.member.model.MemberDto;
import com.storycafe.util.BoardConstance;
import com.storycafe.util.PageNavigation;

@Controller
@RequestMapping("/memberadmin")
public class MemberAdminController {

		@Autowired
		private MemberAdminService memberAdminService;

		@Autowired
		private CommonService commonService;
		
		@RequestMapping("/memberlist.cafe")
		public ModelAndView memberlist(@RequestParam Map<String, String> map, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			List<MemberDetailDto> list = memberAdminService.memberList(map);
			map.put("listsize", BoardConstance.MEMBER_LIST_SIZE + "");
			mav.addObject("memberList", list);
			mav.addObject("querystring", map);
			mav.setViewName("/WEB-INF/memberadmin/memberlist");			
			return mav;
		}
		
		@RequestMapping(value="/memberinsert.cafe", method=RequestMethod.GET)
		public ModelAndView memberinsert(@RequestParam Map<String, String> map) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("querystring", map);
			mav.setViewName("/WEB-INF/memberadmin/memberinsert");
			return mav;
		}
		
		@RequestMapping(value="/memberinsert.cafe", method=RequestMethod.POST)
		public ModelAndView memberinsert(MemberDetailDto memberDetailDto) {
			ModelAndView mav = new ModelAndView();
			
			int cnt = memberAdminService.registerMember(memberDetailDto);
			String viewName = "/index";
			if (cnt != 0) {
				mav.addObject("registerInfo", memberDetailDto);
				viewName = "/WEB-INF/memberadmin/memberlist";
			}
			mav.setViewName(viewName);
			
			return mav;
		}
		
		@RequestMapping(value="/memberupdate.cafe", method=RequestMethod.POST)
		public ModelAndView memberupdate(MemberDetailDto memberDetailDto) {
			ModelAndView mav = new ModelAndView();
			
			int cnt = memberAdminService.updateMemberCode(memberDetailDto);
			String viewName = "/index";
			if (cnt != 0) {
				mav.addObject("registerInfo", memberDetailDto);
				viewName = "/WEB-INF/memberadmin/memberlist";
			}
			mav.setViewName(viewName);
			
			return mav;
		}
		
		@RequestMapping(value="/memberdelete.cafe", method=RequestMethod.POST)
		public String memberdelete(@RequestParam(value="mno") int mno, HttpSession session) {
			MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");

			memberAdminService.deleteMember(mno);
			session.removeAttribute("userInfo");
			
			return "/WEB-INF/memberadmin/memberlist";
		}
}
