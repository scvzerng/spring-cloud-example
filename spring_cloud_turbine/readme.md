## hystrix dashboard Hystrix聚合监控面板

![image](http://blog.didispace.com/content/images/posts/spring-cloud-starter-dalston-5-2-2.png)

## 步骤

1. 启动`eureka`注册中心
2. 启动`hystrix dashboard server`
3. 启动 `hystrix turbine server`
4. 启动带有熔断器的调用服务 `test_service` 修改端口启动至少2个实例
4. 浏览器输入网址 `http://localhost:9005/hystrix`进入首页
5. 在输入框输入`http://localhost:9006/turbine.stream`点击按钮进入该服务的监控面板 会实时的反应服务当前的调用情况