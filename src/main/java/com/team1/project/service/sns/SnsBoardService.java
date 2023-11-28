package com.team1.project.service.sns;

import com.team1.project.config.NCloudConfig;
import com.team1.project.dao.sns.SnsDAO;
import com.team1.project.dto.SnsBoardDTO;
import com.team1.project.entity.SnsBoard;
import com.team1.project.entity.SnsBoardFile;
import java.util.List;
import java.util.Objects;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor // Lombok을 사용하여 생성자를 자동으로 생성
@Service
public class SnsBoardService {
    private final SnsDAO snsDAO;
    
    // 생성자 주입을 사용하여 'SnsBoardRepository'를 주입
    
    public List<SnsBoard> getList(SnsBoardRequest request) {
    	// 모든 게시물 목록을 반환

        return snsDAO.findAll(request);
    }
    //게시물 등록
    @Transactional
    public void registerBoard(SnsBoard board, String uploadKey) {
        snsDAO.saveBoard(board); //게시물을 저장 또는 업데이트

        SnsBoardFile snsBoardFile = new SnsBoardFile();
        snsBoardFile.setBoardNum(board.getBoardNum());
        snsBoardFile.setMemberId(board.getMemberId());
        snsBoardFile.setFileType("IMAGE");
        snsBoardFile.setRealName(NCloudConfig.DOWNLOAD_END_POINT+uploadKey);
        snsBoardFile.setUploadName(uploadKey);
        snsDAO.saveFile(snsBoardFile);
    }

    public List<SnsBoard> getListNotDelete() {
    	// 삭제되지 않은 게시물 목록을 반환
        return snsDAO.findByDeleteYn("N");

        // return snsBoardRepository.findByDeleteYnOrderByBoardNumDesc("N", );
    }

    public List<SnsBoardDTO> getBoardList(SnsBoardRequest request) {
        // 삭제되지 않은 게시물 목록을 반환
        return snsDAO.getBoardList(request);
    }

    public SnsBoard get(Long id) {
    	// 주어진 게시물 번호에 해당하는 게시물을 반환
    	// 게시물이 없는 경우 기본적으로 빈 'SnsBoard' 객체를 반환
        SnsBoard byId = snsDAO.findById(id);
        byId.setFiles(snsDAO.getFile(id));
        return Objects.nonNull(byId) ? byId : new SnsBoard();
    }

    @Transactional
    public void viewCountUp(Long id) {
        if(Objects.nonNull(snsDAO.findById(id))){
            snsDAO.updateViewCountByBoardNum(id);
        }
    }
}
