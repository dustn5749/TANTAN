package com.team1.project.dao;

import com.team1.project.dto.chat.message.ChatMessage;
import com.team1.project.dto.chat.message.ChatMessageDTO;
import com.team1.project.dto.chat.message.GetMessageRequest;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMessageDAO {

  void insertMessage(ChatMessage message);

  List<ChatMessageDTO> getList(GetMessageRequest messageRequest);

  ChatMessageDTO getMessageById(Long messageNum);
}
