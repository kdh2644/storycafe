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
		mav.addObject("cateList", list);
		mav.setViewName("/WEB-INF/categoryadmin/catelist");			
		return mav;
	}

}
	
