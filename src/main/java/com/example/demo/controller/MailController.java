package com.example.demo.controller;

import com.example.demo.entity.UserSendCodeReq;
import com.example.demo.result.Result;
import com.example.demo.util.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RequestMapping("mail")
@RestController
public class MailController {
    @Autowired
    private MailUtil mailUtil;
    @Value("${spring.mail.username}")
    private String mail;
    @Value("${spring.mail.subject}")
    private String subject;
    @PostMapping("sendCode")
    public Result sendCode(@Validated @RequestBody UserSendCodeReq req) {
        // 生成验证码
        int max = (int) Math.pow(10, 6) - 1;
        int min = (int) Math.pow(10, 6 - 1);
        Random random = new Random();
        int code = random.nextInt(max - min + 1) + min;
        System.out.println(code);
        // 发送邮件
        try {
//            mailUtil.sendTextMail(subject, mail, req.getEmail(), code + "");
            Map<String, Object> myMap = new HashMap<String, Object>() {{
                put("code", code);
            }};
            mailUtil.sendThymeleafMail(subject,mail,req.getEmail(),myMap,"email1-english");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Result.success(code);
    }
}
