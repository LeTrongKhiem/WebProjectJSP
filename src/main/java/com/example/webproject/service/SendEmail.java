package com.example.webproject.service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

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

    public void sendEmail() {

        String mailFrom = "tgmobile.cskh@gmail.com";
        String passEmailFrom = "letrongkhiem19130102";
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        properties.put("mail.smtp.socketFactory.port", "465"); //SSL Port
        properties.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
        properties.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
        properties.put("mail.smtp.port", "465"); //SMTP Port
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.starttls.enable", "true");
//        properties.put("mail.smtp.host", "smtp.gmail.com");
//        properties.put("mail.smtp.port", "587");
//        properties.put("mail.smtp.socketFactory.port", "587");
//        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailFrom, passEmailFrom);
            }
        });
        try {
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

    public void sendEmaildemo() {

        String mailFrom = "tgmobile.cskh@gmail.com";
        String passEmailFrom = "letrongkhiem19130102";
        Properties properties = new Properties();
//        properties.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//        properties.put("mail.smtp.port", "587"); //TLS Port
//        properties.put("mail.smtp.auth", "true"); //enable authentication
//        properties.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
        properties.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        properties.put("mail.smtp.socketFactory.port", "465"); //SSL Port
        properties.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
        properties.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
        properties.put("mail.smtp.port", "465"); //SMTP Port

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailFrom, passEmailFrom);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.addHeader("format", "flowed");
            message.addHeader("Content-Transfer-Encoding", "8bit");
            message.setFrom(new InternetAddress(mailFrom));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("lekhiem2001@gmail.com"));
            message.setSubject("TGMobile in Email Verification Link");
            message.setText("Verification link...");
//            message.setText("Your Verification link :: " + "http://localhost:2222/WebProject/ActivationAccount?key1=" + userMail + "&key2=" + code);
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public static void main(String[] args) {
        new SendEmail().sendEmaildemo();
    }
}