package com.yazuo.intelligent;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;

@SpringBootApplication
@EnableHystrixDashboard
public class HystrixDashboardServer {
    public static void main(String[] args) {
        SpringApplication.run(HystrixDashboardServer.class,args);
    }
}
