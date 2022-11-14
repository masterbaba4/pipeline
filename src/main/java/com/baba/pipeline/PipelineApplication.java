package com.baba.pipeline;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class PipelineApplication {
	@GetMapping
	public String message(){return "Baba is live";}

	public static void main(String[] args) {
		SpringApplication.run(PipelineApplication.class, args);
	}

}
