package com.storycafe.board.controller;

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

import com.storycafe.board.model.ReboardDto;
import com.storycafe.board.service.ReboardService;
import com.storycafe.common.service.CommonService;
import com.storycafe.member.model.MemberDto;
import com.storycafe.util.BoardConstance;
import com.storycafe.util.PageNavigation;


@Controller
@RequestMapping("/reboard")
public class ReboardController {

	@Autowired
	private ReboardService reboardService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/list.cafe")
	public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<ReboardDto> list = reboardService.listArticle(map);
		map.put("listsize", BoardConstance.BOARD_LIST_SIZE + "");
		PageNavigation navigation = commonService.makePageNavigation(map);
		navigation.setRoot(request.getContextPath());
		navigation.setBcode(Integer.parseInt(map.get("bcode")));
		navigation.setKey(map.get("key"));
		navigation.setWord(map.get("word"));
		navigation.setNavigator();
		mav.addObject("articlelist", list);
		mav.addObject("navigator", navigation);
		mav.addObject("querystring", map);
		mav.setViewName("/WEB-INF/reboard/list");
		return mav;
	}
	
	@RequestMapping(value="/write.cafe", method=RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("querystring", map);
		mav.setViewName("/WEB-INF/reboard/write");
		return mav;
	}
	
	@RequestMapping(value="/write.cafe", method=RequestMethod.POST)
	public ModelAndView write(ReboardDto reboardDto, 
			@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = commonService.getNextSeq();
			reboardDto.setSeq(seq);
			reboardDto.setId(memberDto.getMid());
			reboardDto.setName(memberDto.getMname());
			reboardDto.setMno(memberDto.getMno());
			reboardDto.setRef(seq);
			int cnt = reboardService.writeArticle(reboardDto);
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			mav.setViewName("/WEB-INF/reboard/list");
		} else {
			mav.setViewName("/log/login");
		}
		return mav;
	}
	
	@RequestMapping(value="/view.cafe", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam Map<String, String> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = Integer.parseInt(map.get("seq"));
			ReboardDto reboardDto = reboardService.viewArticle(seq);
			
			mav.addObject("querystring", map);
			mav.addObject("article", reboardDto);
			mav.setViewName("/WEB-INF/reboard/view");
		} else {
			mav.setViewName("/log/login");
		}
		return mav;
	}
	
	@RequestMapping(value="/modify.cafe", method=RequestMethod.GET)
	public ModelAndView modify(@RequestParam Map<String, String> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = Integer.parseInt(map.get("seq"));
			ReboardDto reboardDto = reboardService.viewArticle(seq);
			
			mav.addObject("querystring", map);
			mav.addObject("article", reboardDto);
			mav.setViewName("/WEB-INF/reboard/modify");
		} else {
			mav.setViewName("/log/login");
		}
		return mav;
	}
	
	@RequestMapping(value="/modify.cafe", method=RequestMethod.POST)
	public ModelAndView modify(@RequestParam Map<String, String> map,
			HttpSession session, ReboardDto reboardDto) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = Integer.parseInt(map.get("seq"));
			
			reboardDto.setSeq(seq);
			reboardDto.setId(memberDto.getMid());
			reboardDto.setName(memberDto.getMname());
			reboardDto.setMno(memberDto.getMno());
			
			int cnt = reboardService.modifyArticle(reboardDto);		
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			mav.setViewName("/WEB-INF/reboard/list");
		} else {
			mav.setViewName("/login/login");
		}
		return mav;
	}
	
	@RequestMapping(value="/delete.cafe", method=RequestMethod.GET)
	public ModelAndView delete(@RequestParam Map<String, String> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = Integer.parseInt(map.get("seq"));		
			reboardService.deleteArticle(seq);			
			mav.setViewName("/WEB-INF/reboard/list");
		}
		return mav;
	}
	
	@RequestMapping(value="/reply.cafe", method=RequestMethod.GET)
	public ModelAndView reply(@RequestParam Map<String, String> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = Integer.parseInt(map.get("seq"));
			ReboardDto reboardDto = reboardService.viewArticle(seq);
			
			mav.addObject("querystring", map);
			mav.addObject("article", reboardDto);
			mav.setViewName("/WEB-INF/reboard/reply");
		} else {
			mav.setViewName("/log/login");
		}
		return mav;
	}
	
	@RequestMapping(value="/reply.cafe", method=RequestMethod.POST)
	public ModelAndView reply(@RequestParam Map<String, String> map,
			HttpSession session, ReboardDto reboardDto) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = commonService.getNextSeq();
			reboardDto.setSeq(seq);
			reboardDto.setId(memberDto.getMid());
			reboardDto.setName(memberDto.getMname());
			reboardDto.setMno(memberDto.getMno());
			
			int cnt = reboardService.replyArticle(reboardDto);
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			mav.setViewName("/WEB-INF/reboard/list");
		} else {
			mav.setViewName("/log/login");
		}
		return mav;
	}
	
}