package com.example.webproject.Authentication;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA1Algorithm {
    private static final int BUFFER_SIZE = 32 * 1024;
    public static BigInteger getSHA1(String input) throws IOException, NoSuchAlgorithmException {
        BufferedInputStream file = new BufferedInputStream(new FileInputStream(input));
        MessageDigest md = MessageDigest.getInstance("SHA-1");
        DigestInputStream in = new DigestInputStream(file, md);
        int i;
        byte[] buffer = new byte[BUFFER_SIZE];
        do {
            i = in.read(buffer, 0, BUFFER_SIZE);
        } while (i == BUFFER_SIZE);
        md = in.getMessageDigest();
        in.close();

        return new BigInteger(md.digest());
    }
}
