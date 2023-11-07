package com.team1.project.sns.board;

import com.team1.project.sns.board.entity.SnsBoard;
import com.team1.project.sns.board.service.SnsBoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
@Slf4j
public class SnsBoardController {

    private final SnsBoardService service;

//    @GetMapping("/boards")
//    public List<SnsBoard> getList() {
//        return service.getList();
//    }

    // title과 content를 뺄까 아니면 임의로만 집어넣고 화면에서 출력은 안되게 할 지 고민중이라서 일단 아무렇게나 적어서 집어 넣음
    @GetMapping("/boards/insert/dummny")
    public void dummy() {
        service.registerBoard(SnsBoard.builder()
                .title("ssssss111s")
                .content("sssssss11")
                .deleteYn("N")
                .viewCount(0L)
                .memberId(7800L)
                .build());
    }

}
