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

import com.storycafe.board.model.BoardDto;
import com.storycafe.board.model.ReboardDto;
import com.storycafe.board.service.BoardService;
import com.storycafe.common.service.CommonService;
import com.storycafe.member.model.MemberDto;
import com.storycafe.util.BoardConstance;
import com.storycafe.util.PageNavigation;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private CommonService commonService;
		
	@RequestMapping("/list.cafe")
	public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<BoardDto> list = boardService.listArticle(map);
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
		mav.setViewName("/WEB-INF/board/list");
		return mav;
	}
	
	@RequestMapping(value="/write.cafe", method=RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("querystring", map);
		mav.setViewName("/WEB-INF/board/write");
		return mav;
	}
	
	@RequestMapping(value="/write.cafe", method=RequestMethod.POST)
	public ModelAndView write(BoardDto boardDto, 
			@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = commonService.getNextSeq();
			boardDto.setSeq(seq);
			boardDto.setId(memberDto.getMid());
			boardDto.setName(memberDto.getMname());
			boardDto.setMno(memberDto.getMno());
			int cnt = boardService.writeArticle(boardDto);
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			mav.setViewName("/WEB-INF/board/list");
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
			BoardDto boardDto = boardService.viewArticle(seq);
			
			mav.addObject("querystring", map);
			mav.addObject("article", boardDto);
			mav.setViewName("/WEB-INF/board/view");
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
			BoardDto boardDto = boardService.viewArticle(seq);
			
			mav.addObject("querystring", map);
			mav.addObject("article", boardDto);
			mav.setViewName("/WEB-INF/board/modify");
		} else {
			mav.setViewName("/log/login");
		}
		return mav;
	}
	
	@RequestMapping(value="/modify.cafe", method=RequestMethod.POST)
	public ModelAndView modify(@RequestParam Map<String, String> map,
			HttpSession session, BoardDto boardDto) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = Integer.parseInt(map.get("seq"));
			
			boardDto.setSeq(seq);
			boardDto.setId(memberDto.getMid());
			boardDto.setName(memberDto.getMname());
			boardDto.setMno(memberDto.getMno());
			
			int cnt = boardService.modifyArticle(boardDto);		
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			mav.setViewName("/WEB-INF/board/list");
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
			boardService.deleteArticle(seq);			
			mav.setViewName("/WEB-INF/reboard/list");
		}
		return mav;
	}
}