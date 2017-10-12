## spring cloud example

> 基础简单的cloud示例包含一下

- `spring cloud eureka` 注册中心
- `spring cloud feign` 声明式Rest服务调用客户端
- `spring cloud hystrix` 服务熔断器
- `spring cloud hystrix dashboard` 服务熔断器监控面板
- `spring cloud hystrix turbine` 服务熔断器监控面板聚合
- `spring cloud zuul` 服务网关
- `spring cloud server config` 配置文件服务器
- `spring cloud bus kafka` 消息总线
- `spring cloud zipkin kafka` 服务调用追踪

```
docker pull registry.cn-hangzhou.aliyuncs.com/scvzerng/spring-cloud-register-eureka:1.0-SNAPSHOT
然后执行
docker run -p 8762:8762 -dit a36af781c9e8
浏览器访问
http://192.168.99.100:8762/
里面有一个eureka实例 
连接了zookeeper和kafka
```