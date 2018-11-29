package com.spring.naonnaTest.team;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.naonnaTest.ground.GroundVO;

@Service("teamService")
public class TeamServiceImpl implements TeamService {

	@Autowired
	private SqlSession sqlSession;	

	@Override
	public ArrayList<TeamVO> getTeamlistJson(TeamVO teamvo){
		ArrayList<TeamVO> teamlist = null;
		TeamMapper teamMapper = sqlSession.getMapper(TeamMapper.class);
		teamlist = teamMapper.getTeamlist(teamvo);
		
		return teamlist;
	}
	
	@Override
	public ArrayList<TeamVO> getTeamfindson(TeamVO teamvo) {
		ArrayList<TeamVO> teamlist = null;
		try {
			TeamMapper teamMapper = sqlSession.getMapper(TeamMapper.class);
			teamlist = teamMapper.findTeam(teamvo);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return teamlist;
		
	}
	
	@Override
	public void insertTeam(TeamVO teamvo) {
		TeamMapper teamMapper = sqlSession.getMapper(TeamMapper.class);
		int res = teamMapper.addTeam(teamvo);
		System.out.println("res = " + res);
				
		
	}
	
	@Override
	public TeamVO That_Team_Info(String Team_Name) {
		
		TeamVO ThatTeamInfo = new TeamVO();
		TeamMapper teamMapper = sqlSession.getMapper(TeamMapper.class);
		ThatTeamInfo = teamMapper.getThatTeamInfo(Team_Name);
		
		return ThatTeamInfo;
	}

}
