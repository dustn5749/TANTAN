package com.team1.project.sns.profile.service;

import com.team1.project.sns.board.repository.SnsBoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class SnsProfileService {
    private final SnsBoardRepository snsBoardRepository;

//    public List<SnsBoard> getList() {
//        return snsBoardRepository.findAll();
//    }

}
