package com.team1.project.repository;

import com.team1.project.entity.Alim;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AlimRepository extends JpaRepository<Alim,Long> {
}
