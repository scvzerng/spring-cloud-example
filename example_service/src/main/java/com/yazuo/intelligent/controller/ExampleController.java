package com.yazuo.intelligent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
public class ExampleController {
    Logger logger = LoggerFactory.getLogger(ExampleController.class);
    @Value("${test}")
    private String test;
    @GetMapping("/props")
    public String props(){
        logger.debug("get props");
        return test;
    }
}
