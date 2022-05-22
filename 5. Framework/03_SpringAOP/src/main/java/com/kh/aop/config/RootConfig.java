package com.kh.aop.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@Configuration
@ComponentScan("com.kh.aop")
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class RootConfig {
}
