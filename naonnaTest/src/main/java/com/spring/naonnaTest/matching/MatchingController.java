package com.spring.naonnaTest.matching;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MatchingController {

	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping(value = "/print_matching.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String MatchingGET() {

		ArrayList<MatchingVO> list = matchingService.getMatching();
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
	
		try {
			str = mapper.writeValueAsString(list);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	
	@RequestMapping(value = "/searchMatching.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String MatchingSearchGET(MatchingVO vo) {
		ArrayList<MatchingVO> list = matchingService.getMatchingSearch(vo);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(list);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
}
