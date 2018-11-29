package com.spring.naonnaTest.team;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TeamController {
	
	@Autowired
	private TeamService teamService;
		
	@RequestMapping(value = "/getTeamlistJSON.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			
	public String TeamlistJSONGET(TeamVO teamvo ) {
		ArrayList<TeamVO> list = teamService.getTeamlistJson(teamvo);
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
	
	@RequestMapping(value = "/getTeamfindJSON.do",  method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody		 	
	public String TeamfindJSONGET(TeamVO teamvo) {
		ArrayList<TeamVO> list = teamService.getTeamfindson(teamvo);
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

	@RequestMapping(value = "/insertTeam.do",  method = RequestMethod.POST)
	public ModelAndView Insert_Team_Info(TeamVO teamvo , MultipartHttpServletRequest multiRequest) throws Exception {
		
		 MultipartFile mf = multiRequest.getFile("emblem2");
		 
		 String uploadPath = "C:\\BigDeep\\upload\\";
	      
	      String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
	      String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	      System.out.println("storedFileName : " + storedFileName);
	    
	      if(mf.getSize() != 0) {	         
	    	  mf.transferTo(new File(uploadPath + storedFileName));
	      }
	      
	      
	      teamvo.setEmblem(storedFileName);

		System.out.println("emblem in ?");
		
		teamService.insertTeam(teamvo);
				
		ModelAndView result = new ModelAndView();
		result.addObject("teamvo", teamvo);
		result.setViewName("team_search");
		System.out.println("추가 complete??");
		return result; 
	}
	
	@RequestMapping(value = "/team_detail.do", method =RequestMethod.GET)
	public ModelAndView That_Team_Info(TeamVO vo, String team_name) {
		String Team_Name = vo.getTeam_name();
		System.out.println("Team_Name = " + Team_Name);
		System.out.println(team_name);
		vo = teamService.That_Team_Info(Team_Name);
		System.out.println("team_detail complete");

		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		result.setViewName("team_detail");
		System.out.println("불러오기  complete??");
		return result;
	}
	
}
