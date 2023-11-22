package com.team1.project.dto.chat.room;

public enum RoomType {
  oneOn1 , group;

  public String getValue(){
    return name();
  }
}
