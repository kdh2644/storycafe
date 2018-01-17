package com.storycafe.admin.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.storycafe.admin.board.model.BoardListDto;
import com.storycafe.admin.board.model.CategoryDto;
import com.storycafe.admin.board.service.BoardAdminService;
import com.storycafe.member.model.MemberDetailDto;

@Controller
@RequestMapping("/boardadmin")
public class BoardAdminController {

	@Autowired
	private BoardAdminService boardAdminService;
	
	@RequestMapping("/boardmenu.cafe")
	public String boardMenu(HttpServletRequest request) {
		List<BoardListDto> list = boardAdminService.boardMenu();
		System.out.println("boardmenu list >>> " + list.size());
		ServletContext context = request.getServletContext();
		context.setAttribute("boardmenu", list);
		return "redirect:/community/community-header.jsp";
	}
	
	@RequestMapping("/catelist.cafe")
	public ModelAndView catelist() {
		ModelAndView mav = new ModelAndView();
		List<MemberDetailDto> list = boardAdminService.cateList();
		List<MemberDetailDto> clist = boardAdminService.typeList();
		List<MemberDetailDto> calist = boardAdminService.caList();
		mav.addObject("cateList", list);
		mav.addObject("typeList", clist);
		mav.addObject("caList", calist);
		mav.setViewName("/WEB-INF/categoryadmin/catelist");			
		return mav;
	}
	
	@RequestMapping(value="/cateinsert.cafe", method=RequestMethod.GET)
	public ModelAndView cateinsert() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/categoryadmin/cateinsert");			
		return mav;
	}
	
	@RequestMapping(value="/cateinsert.cafe", method=RequestMethod.POST)
	public ModelAndView cateinsert(CategoryDto categoryDto) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = boardAdminService.cateinsert(categoryDto);
		if (cnt != 0) {
			mav.addObject("cateInfo", categoryDto);
			mav.setViewName("/WEB-INF/categoryadmin/cateinsert");			
		} else {
			mav.setViewName("/WEB-INF/categoryadmin/cateinsert");			
		}
		
		return mav;
	}
	
	@RequestMapping(value="/listinsert.cafe", method=RequestMethod.POST)
	public ModelAndView listinsert(BoardListDto boardListDto) {
		ModelAndView mav = new ModelAndView();
		int cnt = boardAdminService.listinsert(boardListDto);
		if (cnt != 0) {
			mav.addObject("cateInfo", boardListDto);
			mav.setViewName("/WEB-INF/categoryadmin/catelist");			
		} else {
			mav.setViewName("/WEB-INF/categoryadmin/catelist");			
		}	
		return mav;
	}
	
	
	@RequestMapping(value="/catedelete.cafe", method=RequestMethod.GET)
	public ModelAndView catedelete() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/categoryadmin/catedelete");				
		return mav;
	}
	
	@RequestMapping(value="/listdelete.cafe", method=RequestMethod.POST)
	public ModelAndView listdelete(BoardListDto boardListDto) {
		ModelAndView mav = new ModelAndView();
		boardAdminService.listdelete(boardListDto);
		mav.addObject("boardListInfo", boardListDto);
		mav.setViewName("/WEB-INF/categoryadmin/catelist");		
		return mav;
	}
	
	@RequestMapping(value="/cateupdate.cafe", method=RequestMethod.GET)
	public ModelAndView cateupdate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/categoryadmin/cateupdate");					
		return mav;
	}

}
	
