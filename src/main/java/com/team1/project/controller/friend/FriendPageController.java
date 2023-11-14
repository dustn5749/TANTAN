package com.team1.project.controller.friend;

import com.team1.project.dto.FriendRequestDTO;
import com.team1.project.entity.Friend;
import com.team1.project.entity.FriendRequest;
import com.team1.project.service.auth.AuthService;
import com.team1.project.service.friend.FriendService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@RequiredArgsConstructor
@Controller
public class FriendPageController {

  private final FriendService friendService;
  private final AuthService authService;

  @GetMapping("/page/friend/modal")
  public String friendModal(HttpServletRequest request, Authentication authentication) {
    String memberId = authService.getMemberId(authentication);
    List<Friend> friendList = friendService.getFriendList(memberId);

    request.setAttribute("friendSize", CollectionUtils.isEmpty(friendList) ? "0" : friendList.size());
    request.setAttribute("friendList", friendList);

    return "friend-modal";
  }

  @GetMapping("/page/friend/list")
  public String friendList(HttpServletRequest request, Authentication authentication) {
    String memberId = authService.getMemberId(authentication);
    List<Friend> friendList = friendService.getFriendList(memberId);

    request.setAttribute("friendSize", CollectionUtils.isEmpty(friendList) ? "0" : friendList.size());
    request.setAttribute("friendList", friendList);

    return "friend-list";
  }

  @GetMapping("/page/friend/request")
  public String friendReqList(HttpServletRequest request, Authentication authentication) {
    String memberId = authService.getMemberId(authentication);
    List<FriendRequestDTO> friendList = friendService.getRequestDTOList(memberId);

    request.setAttribute("friendSize", CollectionUtils.isEmpty(friendList) ? "0" : friendList.size());
    request.setAttribute("friendList", friendList);

    return "friend-req";
  }

}
