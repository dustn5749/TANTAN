package com.team1.project.controller.friend;

import com.team1.project.entity.FriendRequest;
import com.team1.project.service.auth.AuthService;
import com.team1.project.service.friend.FriendService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
public class FriendDataController {

  private final FriendService service;
  private final AuthService authService;

  @PostMapping("/friend/request/{receiveMemberId}")
  public void registerFriend(@PathVariable String receiveMemberId, Authentication authentication){
    service.requestFriend(receiveMemberId, authService.getMemberId(authentication));
  }

  @DeleteMapping("/friend/{friendId}")
  public void registerFriend(@PathVariable Long friendId, Authentication authentication){
    service.deleteFriend(friendId, authService.getMemberId(authentication));
  }

  @GetMapping("/friend/request/{receiveMemberId}")
  public List<FriendRequest> getRequestList(@PathVariable String receiveMemberId, Authentication authentication){
    return service.getRequestList(receiveMemberId);
  }

  @PostMapping("/friend/accept/{reqId}")
  public void acceptReq(@PathVariable Long reqId , Authentication authentication){
    service.acceptRequest(reqId);
  }
  @DeleteMapping("/friend/accept/{reqId}")
  public void deleteReq(@PathVariable Long reqId , Authentication authentication){
    service.deleteRequest(reqId);
  }
}
