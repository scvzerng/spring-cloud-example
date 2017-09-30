package com.yazuo.intelligent;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.turbine.EnableTurbine;

@SpringBootApplication
@EnableTurbine
@EnableDiscoveryClient
public class HystrixTurbineServer {
    public static void main(String[] args) {
        SpringApplication.run(HystrixTurbineServer.class,args);
    }
}
