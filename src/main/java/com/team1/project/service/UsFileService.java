package com.team1.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.dao.UsFileDAO;
import com.team1.project.dto.UsFile;

@Service
public class UsFileService {

    @Autowired
    private UsFileDAO usFileDAO;

    // 첨부파일 추가하기
    public boolean add(UsFile file) throws Exception {
        System.out.println("UsFileService.add()");
        return usFileDAO.add(file);
    }

    // 파일 정보 얻기 (게시판에 따른)
    public List<UsFile> getFiles(int boardNum) throws Exception {
        System.out.println("UsFileService.getFiles()");
        return usFileDAO.getFiles(boardNum);
    }

    // 파일 정보 얻기
    public UsFile getAttacheFile(int fileNo) throws Exception {
        System.out.println("UsFileService.getAttacheFile()");
        return usFileDAO.getAttacheFile(fileNo);
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

	
	
}
