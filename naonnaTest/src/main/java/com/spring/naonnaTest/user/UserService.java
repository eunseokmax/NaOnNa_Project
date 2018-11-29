package com.spring.naonnaTest.user;

public interface UserService {
	
	UserVO distMember(String forPerson);
	void insertUser(UserVO vo);
	UserVO printUser(String forPerson);
	UserVO goMyPage(String nickname);
	void updateInfo(UserVO vo);
	void updateProfile(UserVO vo);
}
