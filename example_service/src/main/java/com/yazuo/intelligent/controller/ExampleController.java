package com.yazuo.intelligent.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
public class ExampleController {
    @Value("${test}")
    private String test;
    @GetMapping("/props")
    public String props(){
        return test;
    }
}
