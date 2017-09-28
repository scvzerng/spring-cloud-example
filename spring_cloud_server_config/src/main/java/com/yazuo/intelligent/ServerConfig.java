package com.yazuo.intelligent;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.web.bind.annotation.RestController;

/**
 * 配置文件服务器
 */
@SpringBootApplication
@EnableDiscoveryClient
@RestController
@EnableConfigServer
public class ServerConfig {
    public static void main(String[] args) {
        SpringApplication.run(ServerConfig.class,args);
    }
}
