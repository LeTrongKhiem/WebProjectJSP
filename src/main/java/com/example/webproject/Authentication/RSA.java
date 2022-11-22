package com.example.webproject.Authentication;

import javax.crypto.Cipher;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.*;

public class RSA {
    KeyPair keypair;
    private PrivateKey privateKey;
    private PublicKey publicKey;

    public static final String PUBLIC_KEY_FILE = "rsa_key/publicKey";
    public static final String PRIVATE_KEY_FILE = "rsa_key/privateKey";

    public RSA() {

    }

    public void createKey() throws NoSuchAlgorithmException {
        KeyPairGenerator gen = null;
        try {
            gen = KeyPairGenerator.getInstance("RSA");
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        gen.initialize(2048);
        keypair = gen.generateKeyPair();
        privateKey = keypair.getPrivate();
        publicKey = keypair.getPublic();
    }

    public PrivateKey getPrivateKey() {
        return this.privateKey;
    }

    public PublicKey getPublicKey() {
        return this.publicKey;
    }

    public byte[] rsaEncode(String text) throws NoSuchAlgorithmException {
        if (publicKey == null) {
            createKey();
        }
        if (text == null) {
            return null;
        }
        byte[] data = text.getBytes();
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.ENCRYPT_MODE, publicKey);
            byte[] bytes = cipher.doFinal(data);
            return bytes;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public String rsaDecode(byte[] data) {
        if (privateKey == null) {
            return null;
        }
        if (data == null) {
            return null;
        }
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.DECRYPT_MODE, privateKey);
            byte[] bytes = cipher.doFinal(data);
            return new String(bytes);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void generateKeysToFile() throws NoSuchAlgorithmException {
        try {
            System.out.println("Starting generate...");
            this.createKey();
            this.writeToFile(PUBLIC_KEY_FILE, publicKey.getEncoded());
            this.writeToFile(PRIVATE_KEY_FILE, privateKey.getEncoded());
            System.out.println("Generated!");
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
    }

    private void writeToFile(String path, byte[] key) throws IOException {
        File f = new File(path);
        f.getParentFile().mkdirs();
        FileOutputStream fos = new FileOutputStream(f);
        fos.write(key);
        fos.flush();
        fos.close();
    }

    public static void main(String[] args) throws NoSuchAlgorithmException {
        RSA logic = new RSA();
        logic.createKey();

        System.out.println(logic.getPublicKey());
        System.out.println(logic.privateKey);
//		System.out.println(Base64.getEncoder().encodeToString(logic.rsaEncode("stackjava.com")));
//		System.out.println(logic.rsaDecode(logic.rsaEncode("stackjava.com")));
//		logic.generateKeysToFile();
    }
}
