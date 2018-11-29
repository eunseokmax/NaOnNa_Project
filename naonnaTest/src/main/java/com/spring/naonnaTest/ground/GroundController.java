package com.spring.naonnaTest.ground;

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
public class GroundController {

	@Autowired
	private GroundService groundService;
		
	@RequestMapping(value = "/getGroundJSON.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String GroundJSONGET() {
		ArrayList<GroundVO> list = groundService.getGroundJson();
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
	
	@RequestMapping(value = "/filter_ground_dao.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String Ground_DAO_JSON(GroundVO vo) {
		ArrayList<GroundVO> list = groundService.Ground_DAO_Json(vo);
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
	
	@RequestMapping(value = "/time_ground_dao.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String Ground_Time_JSON(GroundVO groundvo, BookingVO bookingvo) {
		System.out.println("bookingvo.getGameDate() = " + bookingvo.getStartTime());
		System.out.println("bookingvo.getGameTime() = " + bookingvo.getAssign());
		System.out.println("bookingvo.getEndTime()" + bookingvo.getEndTime());
//		bookingvo.setEndTime(endTime);
		
		ArrayList<GroundVO> list = groundService.Ground_Time_Json(groundvo, bookingvo);

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
	
	@RequestMapping(value = "/ground_detail.do", method = RequestMethod.GET)
	public ModelAndView That_Ground_Info(GroundVO vo) {
		String Ground_Name = vo.getGround_Name();
		System.out.println("Ground_Name = " + Ground_Name);
		vo = groundService.That_Ground_Info(Ground_Name);
		System.out.println("ground_detail complete");

		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		result.setViewName("ground_detail");
		System.out.println("불러오기  complete??");
		return result;
		
	}
	
	@RequestMapping(value = "/insertGround.do", method = RequestMethod.POST)
	public ModelAndView Insert_Ground_Info(GroundVO vo ,MultipartHttpServletRequest multiRequest)  throws Exception {
		  MultipartFile mf1 = multiRequest.getFile("imgfile1");
		  MultipartFile mf2 = multiRequest.getFile("imgfile2");
		  MultipartFile mf3 = multiRequest.getFile("imgfile3");

	      String uploadPath = "C:\\BigDeep\\upload\\";
	      
	      String originalFileExtension = mf1.getOriginalFilename().substring(mf1.getOriginalFilename().lastIndexOf("."));
	      String storedFileName1 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	      String storedFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	      String storedFileName3= UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	      System.out.println("storedFileName1 : " + storedFileName1);
	      System.out.println("storedFileName2 : " + storedFileName2);
	      System.out.println("storedFileName3 : " + storedFileName3);
	      System.out.println("uploadPath : " + uploadPath);
	      
	      if(mf1.getSize() != 0) {	        
	         mf1.transferTo(new File(uploadPath + storedFileName1));
	      }
	      if(mf2.getSize() != 0) {		        
		         mf2.transferTo(new File(uploadPath + storedFileName2));
		  }
	      if(mf3.getSize() != 0) {		        
		         mf3.transferTo(new File(uploadPath + storedFileName3));
		  }
	      
	      
	      //vo.setPhoto(storedFileName);
	      vo.setPhoto1(storedFileName1);
	      vo.setPhoto2(storedFileName2);
	      vo.setPhoto3(storedFileName3);
	      

		System.out.println("Groundphoto in b2 변경사항 ");
		

		
		groundService.insertGround(vo);
		
		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		//result.setViewName("ground_search");
		result.setViewName("manager_index");
		System.out.println("추가 complete??");
		return result;		
		
	}
	
	@RequestMapping(value = "/ground_updating.do", method = RequestMethod.GET)
	public ModelAndView That_Ground_Updating(String Ground_admin) {
		GroundVO vo = null;
		String Ground_Admin = vo.getGround_admin();
		System.out.println("Ground_Admin = " + Ground_Admin);
		vo = groundService.That_Ground_Info(Ground_admin);
		System.out.println("ground_update complete");

		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		result.setViewName("ground_update");
		System.out.println("불러오기  complete??");
		return result;
		
	}
	
	@RequestMapping(value = "/getAdminGroundJSON.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String AdminGroundJSONGET(String ad) {
		
		GroundVO vo = groundService.getAdminGroundJson(ad);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(vo);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}

}