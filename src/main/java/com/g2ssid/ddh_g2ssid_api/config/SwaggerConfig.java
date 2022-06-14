package com.g2ssid.ddh_g2ssid_api.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket api(){

        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.g2ssid.ddh_g2ssid_api"))
                .paths(PathSelectors.any())
                .build()
                .apiInfo(apiInfo())
                .useDefaultResponseMessages(false);
    }

    private ApiInfo apiInfo(){
        return new ApiInfo("SSI API",
                "This is the API for the SSI (Sistema de Seguridad Industrial)",
                "1.0",
                "urn:tos",
                ApiInfo.DEFAULT_CONTACT.getName(),
                "Apache 2.0",
                "http");
    }
}

