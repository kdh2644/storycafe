package com.storycafe.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.storycafe.board.model.AlbumDto;
import com.storycafe.board.service.AlbumService;
import com.storycafe.common.service.CommonService;
import com.storycafe.member.model.MemberDto;
import com.storycafe.util.BoardConstance;
import com.storycafe.util.PageNavigation;


@Controller
@RequestMapping("/album")
public class AlbumController {

	@Autowired
	private AlbumService albumService;

	@Autowired
	private CommonService commonService;
	
	private String upFolder;

	public AlbumController() {
		this.upFolder = "D:\\prog\\web\\studyspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\StoryCafe\\upload";
	}	
	
	@RequestMapping("/list.cafe")
	public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<AlbumDto> list = albumService.listArticle(map);
		map.put("listsize", BoardConstance.ALBUM_LIST_SIZE + "");
		PageNavigation navigation = commonService.makePageNavigation(map);
		navigation.setRoot(request.getContextPath());
		navigation.setBcode(Integer.parseInt(map.get("bcode")));
		navigation.setKey(map.get("key"));
		navigation.setWord(map.get("word"));
		navigation.setNavigator();
		mav.addObject("articlelist", list);
		mav.addObject("navigator", navigation);
		mav.addObject("querystring", map);
		mav.setViewName("/WEB-INF/album/list");
		return mav;
	}
	
	@RequestMapping(value="/write.cafe", method=RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("querystring", map);
		mav.setViewName("/WEB-INF/album/write");
		return mav;
	}
	
	@RequestMapping(value="/write.cafe", method=RequestMethod.POST)
	public ModelAndView write(AlbumDto albumDto, 
			@RequestParam Map<String, String> map,
			HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = commonService.getNextSeq();
			albumDto.setSeq(seq);
			albumDto.setId(memberDto.getMid());
			albumDto.setName(memberDto.getMname());
			albumDto.setMno(memberDto.getMno());

			DateFormat df = new SimpleDateFormat("yyMMdd");
			String saveFolder = df.format(new Date());
			String uploadPath = upFolder + File.separator + saveFolder;
			File folder = new File(uploadPath);
			if(!folder.exists())
				folder.mkdirs();
			albumDto.setSaveFolder(saveFolder);
			
			List<MultipartFile> list = albumDto.getUpfile();
			for (MultipartFile multipartFile : list) {
				if(!multipartFile.isEmpty()) {
					String ofile = multipartFile.getOriginalFilename();
					albumDto.setOriginPicture(ofile);
					String savePicture = UUID.randomUUID().toString() + ofile.substring(ofile.lastIndexOf("."));
					albumDto.setSavePicture(savePicture);
					multipartFile.transferTo(new File(uploadPath, savePicture));
				}
			}			
			
			int cnt = albumService.writeArticle(albumDto);
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			mav.setViewName("/WEB-INF/album/list");
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
			AlbumDto albumDto = albumService.viewArticle(seq);
			
			mav.addObject("querystring", map);
			mav.addObject("article", albumDto);
			mav.setViewName("/WEB-INF/album/view");
		} else {
			mav.setViewName("/log/login");
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
			albumService.deleteArticle(seq);			
			mav.setViewName("/WEB-INF/album/list");
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
			AlbumDto albumDto = albumService.viewArticle(seq);
			
			mav.addObject("querystring", map);
			mav.addObject("article", albumDto);
			mav.setViewName("/WEB-INF/album/modify");
		} else {
			mav.setViewName("/log/login");
		}
		return mav;
	}
	
	@RequestMapping(value="/modify.cafe", method=RequestMethod.POST)
	public ModelAndView modify(@RequestParam Map<String, String> map,
			HttpSession session, AlbumDto albumDto) {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = Integer.parseInt(map.get("seq"));
			
			albumDto.setSeq(seq);
			albumDto.setId(memberDto.getMid());
			albumDto.setName(memberDto.getMname());
			albumDto.setMno(memberDto.getMno());
			
			int cnt = albumService.modifyArticle(albumDto);		
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			mav.setViewName("/WEB-INF/album/list");
		} else {
			mav.setViewName("/log/login");
		}
		return mav;
	}	
}