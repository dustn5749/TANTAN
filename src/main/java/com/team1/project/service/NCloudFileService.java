package com.team1.project.service;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URLConnection;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@RequiredArgsConstructor
@Service
public class NCloudFileService {

  private final AmazonS3 amazonS3;


  public String fileUpload(String objectName, MultipartFile file) throws IOException {
// S3 client

    String bucketName = "hall0705";

    // create folder
    String folderName = "image1/";

    ObjectMetadata objectMetadata = new ObjectMetadata();
    objectMetadata.setContentLength(0L);
    objectMetadata.setContentType("application/x-directory");
    PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, folderName,
        new ByteArrayInputStream(new byte[0]), objectMetadata);

    amazonS3.putObject(putObjectRequest);
    log.info("Folder {} has been created.", folderName);

    // upload local file

    ObjectMetadata filemeta = new ObjectMetadata();
    filemeta.setContentLength(file.getSize());
    filemeta.setContentType(URLConnection.guessContentTypeFromName(file.getName()));

    String key = folderName + objectName;
    amazonS3.putObject(bucketName, key, file.getInputStream(), filemeta);
    log.info("Object {} has been created.", objectName);

    return key;

  }

}
