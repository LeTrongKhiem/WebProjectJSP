package com.example.webproject.BEAN;

import java.io.Serializable;
import java.util.Random;

public class RandomPassword implements Serializable {
    private static final long serialVersionUID= 1L;
    private static final String alpha = "abcdefghijklmnopqrstuvwxyz"; // a-z
    private static final String alphaUpperCase = alpha.toUpperCase(); // A-Z
    private static final String digits = "0123456789"; // 0-9
    private static final String specials = "~=+%^*/()[]{}/!@#$?|";
    private static final String ALPHA_NUMERIC = alpha + alphaUpperCase + digits;
    private static final String ALL = alpha + alphaUpperCase + digits + specials;

    private static RandomPassword instance;

    public static RandomPassword getInstance() {
        if (instance == null) {
            instance = new RandomPassword();
        }
        return instance;
    }

    private static Random random = new Random();

    public String randomAlphaNumeric() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            int number = randomNumber(0, ALPHA_NUMERIC.length() - 1);
            char ch = ALPHA_NUMERIC.charAt(number);
            sb.append(ch);
        }
        return sb.toString();
    }

    public static int randomNumber(int min, int max) {
        return random.nextInt((max - min) + 1) + min;
    }

    public static void main(String[] args) {
        System.out.println(RandomPassword.getInstance().randomAlphaNumeric());
    }
}
