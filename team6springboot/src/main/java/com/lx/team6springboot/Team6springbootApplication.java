package com.lx.team6springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class Team6springbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(Team6springbootApplication.class, args);
	}

}
