package com.team1.project.dto.chat.message;

public enum MessageType {
  MESSAGE,IMG,MOVIE,FILE, ENTER, LEAVE;

  public String getValue(){
    return name();
  }

}
