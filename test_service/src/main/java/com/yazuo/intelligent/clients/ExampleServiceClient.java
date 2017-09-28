package com.yazuo.intelligent.clients;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.http.HttpMethod;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@FeignClient("example-service")
public interface ExampleServiceClient {
    @RequestMapping(method = RequestMethod.GET,value = "/props")
    String props();
}
