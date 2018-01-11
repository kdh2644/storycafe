package com.storycafe.board.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.storycafe.board.model.BbsDto;
import com.storycafe.board.service.BbsService;
import com.storycafe.common.service.CommonService;
import com.storycafe.member.model.MemberDto;
import com.storycafe.util.BoardConstance;
import com.storycafe.util.PageNavigation;

@Controller
@RequestMapping("/bbs")
public class BbsController {

	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private CommonService commonService;
	
	private String upFolder;

	public BbsController() {
		this.upFolder = "D:\\prog\\web\\studyspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\StoryCafe\\upload";
	}	
	
	@RequestMapping("/list.cafe")
	public ModelAndView list(@RequestParam Map<String, String> map, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<BbsDto> list = bbsService.listArticle(map);
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
		mav.setViewName("/WEB-INF/bbs/list");
		return mav;
	}	
	
	@RequestMapping(value="/write.cafe", method=RequestMethod.GET)
	public ModelAndView write(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("querystring", map);
		mav.setViewName("/WEB-INF/bbs/write");
		return mav;
	}
	
	@RequestMapping(value="/write.cafe", method=RequestMethod.POST)
	public ModelAndView write(BbsDto bbsDto, 
			@RequestParam Map<String, String> map,
			HttpSession session) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			int seq = commonService.getNextSeq();
			bbsDto.setSeq(seq);
			bbsDto.setId(memberDto.getMid());
			bbsDto.setName(memberDto.getMname());
			bbsDto.setMno(memberDto.getMno());

			DateFormat df = new SimpleDateFormat("yyMMdd");
			String saveFolder = df.format(new Date());
			String uploadPath = upFolder + File.separator + saveFolder;
			File folder = new File(uploadPath);
			if(!folder.exists())
				folder.mkdirs();
			bbsDto.setSaveFolder(saveFolder);
			
			List<MultipartFile> list = bbsDto.getUpfile();
			for (MultipartFile multipartFile : list) {
				if(!multipartFile.isEmpty()) {
					String ofile = multipartFile.getOriginalFilename();
					bbsDto.setOriginFile(ofile);
					String savefile = UUID.randomUUID().toString() + ofile.substring(ofile.lastIndexOf("."));
					bbsDto.setSaveFile(savefile);
					long filesize = multipartFile.getSize();
					bbsDto.setFileSize(filesize);
					multipartFile.transferTo(new File(uploadPath, savefile));

				}
			}					
			int cnt = bbsService.writeArticle(bbsDto);
			mav.addObject("querystring", map);
			mav.addObject("seq", seq);
			mav.setViewName("/WEB-INF/bbs/list");
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
			BbsDto bbsDto = bbsService.viewArticle(seq);
			
			mav.addObject("querystring", map);
			mav.addObject("article", bbsDto);
			mav.setViewName("/WEB-INF/bbs/view");
		} else {
			mav.setViewName("/log/login");
		}
		return mav;
	}
	
	@RequestMapping(value="/fileDownload.cafe", method=RequestMethod.GET)
	public void fileDownload(@RequestParam(value="bseq") int bseq, 
			HttpServletResponse response) throws Exception {
		BbsDto bbsDto = bbsService.filePathInfo(bseq);
		
		String saveFolder = bbsDto.getSaveFolder();
		String saveFile = bbsDto.getSaveFile();
		
		String fileFullPath = "D:\\prog\\web\\studyspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\StoryCafe\\upload\\" + saveFolder + "\\" + saveFile;		
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(fileFullPath));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(saveFile,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}