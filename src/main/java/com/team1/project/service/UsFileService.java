package com.team1.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.project.dao.UsFileDAO;
import com.team1.project.dto.UsDTO;
import com.team1.project.dto.UsFileDTO;

@Service
public class UsFileService {

    @Autowired
    private UsFileDAO usFileDAO;

    // 첨부파일 추가하기
    public int add(UsFileDTO file) throws Exception {
        System.out.println("UsFileService.add()");
        System.out.println("file = " + file);
        return usFileDAO.add(file);
    }

    // 파일 정보 얻기 (게시판에 따른)
    public List<UsFileDTO> getFiles(int boardNum) throws Exception {
        System.out.println("UsFileService.getFiles()");
        return usFileDAO.getUsFiles(boardNum);
    }

    // 파일 정보 얻기
    public UsFileDTO getUsFile(int fileNo) throws Exception {
        System.out.println("UsFileService.getUsFile()");
        return usFileDAO.getUsFile(fileNo);
    }

    // 첨부파일 삭제하기 (한 개)
    public boolean delete(int boardNum) throws Exception {
        System.out.println("UsFileService.delete()");
        return usFileDAO.delete(boardNum);
    }

    // 첨부파일 삭제하기 (게시판 삭제에 따른)
    public boolean deletes(int[] deleteNumList) throws Exception {
        System.out.println("UsFileService.deletes()");
        return usFileDAO.deletes(deleteNumList);
    }
}