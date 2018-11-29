package com.spring.naonnaTest.matching;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("matchingService")
public class MatchingServiceImpl implements MatchingService	{

	@Autowired
	private SqlSession sqlSession;
	
//	@Autowired(required=false) 		//@Autowired는 필드 생성자 메소드에 사용 가능
//	private MathcingDAO matchingDAO = null;		//new UserDAO()객체가 자동으로 생성되어서 대입된다.
//	
	
	@Override
	public ArrayList<MatchingVO> getMatching() {
		ArrayList<MatchingVO> matchingList = null;

		MatchingMapper matchingMapper = sqlSession.getMapper(MatchingMapper.class);
		matchingList = matchingMapper.getMatchingList();

		System.out.println(matchingList);
		
		return matchingList;
	}
	
	@Override
	public ArrayList<MatchingVO> getMatchingSearch(MatchingVO vo) {
		ArrayList<MatchingVO> matchingList = null;
		try {
			MatchingMapper matchingMapper = sqlSession.getMapper(MatchingMapper.class);
			matchingList = matchingMapper.searchMatchingList(vo);
		}
		catch(Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		return matchingList;
	}
	
}
