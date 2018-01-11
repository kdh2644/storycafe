package com.storycafe.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.storycafe.board.model.MemoDto;
import com.storycafe.board.service.MemoService;
import com.storycafe.member.model.MemberDto;
import com.storycafe.util.StringEncoder;


@Controller
@RequestMapping("/memo")
public class MemoController {

	@Autowired
	private MemoService memoService;
	
	@RequestMapping("/write.cafe")
	public @ResponseBody String write(MemoDto memoDto, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		memoDto.setMmid(memberDto.getMid());
		memoDto.setMmname(memberDto.getMname());
		memoService.writeMemo(memoDto);
		
		JSONObject json = getMemolist(memoDto.getSeq());		
		return json.toJSONString();
	}
	
	
	@RequestMapping("list.cafe")
	public @ResponseBody String list(@RequestParam("seq") int seq) {
		JSONObject json = getMemolist(seq);		
		return json.toJSONString();
	}	

	private JSONObject getMemolist(int seq) {
		List<MemoDto> list = memoService.listMemo(seq);
		JSONObject json = new JSONObject(); 
		
		JSONArray jarray = new JSONArray();
		for (MemoDto memo : list) {
			JSONObject jsn = new JSONObject(); 
			jsn.put("mseq", memo.getMseq());
			jsn.put("seq", memo.getSeq());
			jsn.put("id", memo.getMmid());
			jsn.put("name", StringEncoder.urlUtf(memo.getMmname()).replaceAll("\\+", "%20"));
			jsn.put("mcontent", StringEncoder.urlUtf(memo.getMcontent()).replaceAll("\\+", "%20"));
			jsn.put("mtime", memo.getMtime());
			
			jarray.add(jsn);
		}
		json.put("memolist", jarray);
		
		return json;
	}
	
	@RequestMapping("/delete.cafe")
	public @ResponseBody String delete(@RequestParam("seq") int seq, @RequestParam("mseq") int mseq) {
		memoService.deleteMemo(mseq);	
		JSONObject json = getMemolist(seq);		
		return json.toJSONString();
	}
	
	
	
}