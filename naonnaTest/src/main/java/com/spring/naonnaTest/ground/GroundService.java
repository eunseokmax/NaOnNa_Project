package com.spring.naonnaTest.ground;

import java.util.ArrayList;
import java.util.HashMap;

public interface GroundService {
	
	ArrayList<GroundVO> getGroundJson();
	ArrayList<GroundVO> Ground_DAO_Json(GroundVO vo);
	ArrayList<GroundVO> Ground_Time_Json(GroundVO groundvo, BookingVO bookingvo);	
	GroundVO That_Ground_Info(String Ground_Name);
	GroundVO That_Ground_Updating(String Ground_admin);
	public void insertGround(GroundVO vo);
	GroundVO getAdminGroundJson(String ad);
	
	
	//ArrayList<GroundVO> That_Ground_Info_JSON(GroundVO vo);
	//public void insertGround2(HashMap<String, String> map);
	
	/* public void saveImage(Map<String, Object> hmap) throws SQLException;
	 public Map<String, Object> getByteImage();*/
}
