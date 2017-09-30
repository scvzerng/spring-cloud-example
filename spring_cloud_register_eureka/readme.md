## Eureka 注册中心

![image](https://github.com/Netflix/eureka/raw/master/images/eureka_architecture.png)

- **Eureka Server** `注册中心服务器`
- **Eureka Client** application service  `服务提供者`
- **Eureka Client** application client `服务消费者`

#### 配置Eureka Client
> JDK 1.8+

### 注意

- 15分钟内**Eureka Client**挂掉**15**%会导致**Eureka Server**进入自我保护状态