package com.storycafe.common.service;

import java.util.Map;

import com.storycafe.util.PageNavigation;

public interface CommonService {
	int getNextSeq();
	PageNavigation makePageNavigation(Map<String, String> map);
	int reboardCnt(int mno);
	int albumCnt(int mno);
	int bbsCnt(int mno);
	PageNavigation makePageNavigate(Map<String, String> map);
}
