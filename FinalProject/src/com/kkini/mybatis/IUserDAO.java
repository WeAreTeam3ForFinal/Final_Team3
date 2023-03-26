package com.kkini.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kkini.dto.MemaDTO;
import com.kkini.dto.UserDTO;
import com.sun.org.glassfish.gmbal.ParameterNames;

public interface IUserDAO
{
	
	public List<Map<String,String>>getChalist();
	
	public List<Map<String,String>>getTalklist();
	
	public List<Map<String,String>>getIntlist();
	
	public List<Map<String,String>>getSpeedlist();
	
	public void userRegister(UserDTO dto);
	
	public String regionSearch(String user_addr);
	
	public void addintregion(@Param("user_region")String user_region,@Param("user_code") String user_code);
	
	public void addinterest(@Param("user_interest") String user_interest, @Param("user_code") String user_code);
	
	public void addcharacter(@Param("user_character") String user_character, @Param("user_code") String user_code);
	
	public String intregionSearch(String user_region);
	
	public UserDTO loginMember(UserDTO dto); //로그인 성공시 회원 닉네임, 회원코드를 받아오는 함수
	
	public int idOverlapCheck(String id); //아이디 중복검사
	
	public int nickNameOverlapCheck(String nickname); //닉네임 중복 검사
	
	public UserDTO getScore(String user_code); // 메인 페이지 요청시 회원의 값 가져오기
	
	public int checkJoinRoomList(String user_code);  //참가중인 방이 있는지 확인하기 이거 안하면 리스트에 null떠서 에러남
	
	public int checkOpenRoomList(String user_code);   //본인이 개설한 방이 있는지 확인 이거 안하면 리스트에 null떠서 메인페이지 안들어가짐
	
	public ArrayList<MemaDTO> getJoinRoomList(String user_code);  //메인 페이지 요청시 본인이 참가중인 방 가져오기
	
	public ArrayList<MemaDTO> getOpenRoomList(String user_code); //메인 페이지 요청시 본인이 개설한 방 가져오기
	
	public void region_InOut(UserDTO dto); //사용자가 입력한 지역 정보가 지역테이블에 존재하면 코드값을 없다면 삽입후 코드값을 반환하는 함수

	public UserDTO userGenderAge(@Param("nickName") String nickName); // 로그인 유저 성별 및 나이 정보
	
	public ArrayList<String> userIntregions(@Param("userCode") String userCode); // 로그인 유저 관심지역 정보
	
	public UserDTO getUserInfo (@Param("userCode") String userCode); // 마이페이지용 회원정보 불러오기 (id, 연락처, 자기소개) 
	
	public String getUserTalk (@Param("userCode") String userCode); // 회원 대화량
	public String getUserSpeed (@Param("userCode") String userCode); // 회원 식사속도 
	public ArrayList<String> getUserCha (@Param("userCode") String userCode); // 회원 성격 
	public ArrayList<String> getUserInt (@Param("userCode") String userCode); // 회원 관심사
	//complete feedback dropout join applying 
	
	// 수정 기능 모음 =============================================================================================================
	public int checkPw(@Param("userCode") String userCode, @Param("user_pw") String user_pw); // 수정 페이지 진입 전 비밀번호 확인
	public int updateIntroduce(@Param("userCode") String userCode, @Param("introduce") String introduce); // 자기소개 수정
	public int updateAddr(@Param("userCode") String userCode, @Param("user_addr") String user_addr); // 거주지 수정
	public int deleteIntregions(@Param("userCode") String userCode); // 관심지역 삭제
	public int updatePrivateInfo(@Param("userCode") String userCode, @Param("nickName") String nickName, @Param("user_phonenumber") String user_phonenumber, @Param("user_pw") String user_pw); // 닉네임, 비밀번호, 전화번호 수정
	public int countRegion(@Param("region") String region); // 지역 세기 (임시)
	public int createRegion(@Param("region") String region); // 지역 생성 (임시)
	public int deleteCha(@Param("userCode") String userCode); // 관심사 삭제
	public int deleteInt(@Param("userCode") String userCode); // 성격 삭제
	public int updateSpeedTalk(@Param("userCode") String userCode, @Param("user_eatSpeed") String user_eatSpeed, @Param("user_talk") String user_talk); // 식사속도, 대화량 업데이트
	//=============================================================================================================================
	
	
	public List<Map<String, String>> userRecord(String userCode); //나의 이력 페이지
	public List<Map<String, String>> userRecordSortDate(@Param("userCode") String userCode); //나의 이력 개설일순 정렬
	public List<Map<String, String>> userRecordSortClose(@Param("userCode") String userCode); //나의 이력 마감순 정렬
	
	
	
	
	public List<Map<String, String>> userRecord_complete(String userCode); //나의 이력 페이지 참여완료
	public List<Map<String, String>> userRecord_completeSortDate(String userCode); //나의 이력 페이지 참여완료
	public List<Map<String, String>> userRecord_completeSortClose(String userCode); //나의 이력 페이지 참여완료

	public List<Map<String, String>> userRecord_join(String userCode); //나의 이력 페이지 참여완료
	public List<Map<String, String>> userRecord_joinSortDate(String userCode); //나의 이력 페이지 참여완료
	public List<Map<String, String>> userRecord_joinSortClose(String userCode); //나의 이력 페이지 참여완료
	
	public List<Map<String, String>> userRecord_opened(String userCode); //나의 이력 페이지 참여완료
	public List<Map<String, String>> userRecord_openedSortDate(String userCode); //나의 이력 페이지 참여완료
	public List<Map<String, String>> userRecord_openedSortClose(String userCode); //나의 이력 페이지 참여완료
	
	//public List<Map<String, String>> userRecord_applying(String userCode); //나의 이력 페이지 참여완료
	
	//public List<Map<String, String>> userRecord_dropout(String userCode); //나의 이력 페이지 참여완료

	//public List<Map<String, String>> userRecord_feedback(String userCode); //나의 이력 페이지 참여완료
	
	public void send_feedBack(@Param("applyCodeG") String applyCodeG, @Param("applyCodeT") String applyCodeT, @Param("openCode") String openCode); //피드백 전송
	
	public void send_Absent(@Param("applyCodeG") String applyCodeG, @Param("applyCodeT") String applyCodeT); //피드백 전송

}