package com.spring.naonnaTest.matching;

import java.util.ArrayList;

public interface MatchingService {

	ArrayList<MatchingVO> getMatching();
	ArrayList<MatchingVO> getMatchingSearch(MatchingVO vo);
	
}
