package com.team1.project.service.sns;

import com.team1.project.repository.SnsBoardRepository;
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
