package com.storycafe.admin.board.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.storycafe.admin.board.model.BoardListDto;
import com.storycafe.admin.board.service.BoardAdminService;

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
	public @ResponseBody String catelist(@RequestParam(value="bcode", defaultValue="") int bcode) {
		List<BoardListDto> list = boardAdminService.categoryList(bcode);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray();
		for (BoardListDto catelist : list) {
			JSONObject jsn = new JSONObject(); 
			jsn.put("cname", catelist.getCname());
			jsn.put("bname", catelist.getBname());
			jarray.add(jsn);
		}
		json.put("catelist", jarray);
		
		return json.toJSONString();
	}	
	
	@RequestMapping(value="/boardlist.cafe", method=RequestMethod.GET)
	public String boardlist() {		
		return "redirect:/admin/board/boardlist.jsp";
	}
	@RequestMapping(value="/albumlist.cafe", method=RequestMethod.GET)
	public String albumlist() {		
		return "redirect:/admin/board/albumlist.jsp";
	}
	@RequestMapping(value="/reboardlist.cafe", method=RequestMethod.GET)
	public String reboardlist() {		
		return "redirect:/admin/board/reboardlist.jsp";
	}
	@RequestMapping(value="/bbslist.cafe", method=RequestMethod.GET)
	public String bbslist() {		
		return "redirect:/admin/board/bbslist.jsp";
	}
}
