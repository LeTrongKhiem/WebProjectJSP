package com.example.webproject.service;

import com.example.webproject.BEAN.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class SendEmail {
    private String userMail;
    private String code;

    public SendEmail() {
    }

    public SendEmail(String userMail, String code) {
        this.userMail = userMail;
        this.code = code;
    }

    public String getUserMail() {
        return userMail;
    }

    public void setUserMail(String userMail) {
        this.userMail = userMail;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getRandom() {
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("%06d", number);
    }

    public void sendEmail() {

        String mailFrom = "tgmobile.cskh@gmail.com";
        String passEmailFrom = "lekhiem2001";
        try {
            Properties properties = new Properties();
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.starttls.enable", "true");
            properties.setProperty("mail.smtp.host", "smtp.mail.com");
            properties.setProperty("mail.smtp.port", "587");
//            properties.put("mail.smtp.socketFactory.port", "587");
//            properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(mailFrom, passEmailFrom);
                }
            });
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(mailFrom));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userMail));
            message.setSubject("TGMobile in Email Verification Link");
            message.setText("Verification link...");
            message.setText("Your Verification link :: " + "http://localhost:2222/WebProject/ActivationAccount?key1=" + userMail + "&key2=" + code);
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
