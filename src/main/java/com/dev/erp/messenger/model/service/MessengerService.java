package com.dev.erp.messenger.model.service;

import java.util.List;
import java.util.Map;

import com.dev.erp.messenger.model.vo.ChatRoom;
import com.dev.erp.messenger.model.vo.Msg;

public interface MessengerService {

	String findChatIdByEmail(String email);

	int insertChatRoom(List<ChatRoom> list);

	List<Msg> findChatListByChatId(String chatId);

	int deleteChatRoom(String chatId);
	
	List<Map<String, String>> findRecentList(Map<String,String> param );

	int insertChatLog(Msg fromMessage);

	int updateLastCheck(Msg fromMessage);

	List<Map<String, String>> selectMemberList(int cPage, int numPerPage);

	int selectAllCountByAccountNo();

	List<Map<String, String>> findChatIdList(String email);

}
