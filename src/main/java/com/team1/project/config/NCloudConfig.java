package com.team1.project.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@Configuration
public class NCloudConfig {
  public final static String END_POINT = "https://kr.object.ncloudstorage.com";
  public final static String DOWNLOAD_END_POINT = "http://fmdtbrekygrp20399235.cdn.ntruss.com/";
  public final static String REGION_NAME = "kr-standard";
  public final static String ACCESS_KEY = "3QkcqKTjnEoZSIprO8Jj";
  public final static String SECRET_KEY = "RjcPllOTOpIvUacJq4wxJPTPtsBKJE3TWEXM4ZQA";

  @Bean
  public AmazonS3 amazonS3()
  {
    return AmazonS3ClientBuilder.standard()
        .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(END_POINT, REGION_NAME))
        .withCredentials(
            new AWSStaticCredentialsProvider(new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY)))
        .build();
  }
}
