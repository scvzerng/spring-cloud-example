package com.yazuo.intelligent.controller;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.yazuo.intelligent.clients.ExampleServiceClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class TestServiceController {
    @Resource
    ExampleServiceClient client;
    @GetMapping
    public String getTestProp(){
        return client.props();
    }
    @GetMapping("hystrix/{test}")
    @HystrixCommand(fallbackMethod ="hystrixError" )
    public String hystrix(@PathVariable(required = false) String test){
        if("error".equals(test)) throw new NullPointerException("error value");
        return test;
    }

    public String hystrixError(String test){
        return "error checked null";
    }
}
