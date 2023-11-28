package com.team1.project;

import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.client.RestTemplate;

import com.team1.project.dto.UsDTO;

@EnableScheduling
@SpringBootApplication
@ComponentScan(basePackages = "com.team1.project")
@EnableCaching
public class TantanDaeboProjectApplication {

    public static void main(String[] args) {
        SpringApplication.run(TantanDaeboProjectApplication.class, args);
    }
}

