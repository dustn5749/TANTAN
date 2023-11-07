package com.team1.project.sns.board;

import com.team1.project.sns.board.service.SnsBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;

@RequiredArgsConstructor
@Controller
@Slf4j
public class SnsBoardPageController {

    private final SnsBoardService service;

    @GetMapping("/sns/board/detail/{id}")
    public String getBoardDetail(
            @PathVariable Long id, // 경로 변수 'id'를 가져옴
            HttpServletRequest request
    ) {
    	//로깅 메시지 출력
        log.info("/sns/board/detail");
        log.info("id : {}", id);

        service.viewCountUp(id); // 'SnsBoardService'의 'viewCountUp' 메서드를 호출하여 게시물 조회수를 증가시킴        
    //    request.setAttribute("board", service.get(id)); // 'SnsBoardService'를 사용하여 게시물을 가져온 후, 'board'라는 이름으로 요청에 추가
        return "sns-detail"; 
    }

}
