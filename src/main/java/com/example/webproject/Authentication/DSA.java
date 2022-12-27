package com.example.webproject.Authentication;

import java.security.*;

public class DSA {
    public static void main(String[] args) throws Exception {
        String alg = "DSA";
        KeyPairGenerator kg = KeyPairGenerator.getInstance(alg);
        KeyPair keyPair = kg.genKeyPair();

        byte[] signature = performSigning("test", alg, keyPair);
        performVerification(args[0], alg, signature, keyPair.getPublic());
    }

    //region Create a digital signature
    public static byte[] performSigning(String s, String alg, KeyPair keyPair) throws Exception {
        Signature sign = Signature.getInstance(alg);
        PrivateKey privateKey = keyPair.getPrivate();
        PublicKey publicKey = keyPair.getPublic();
        sign.initSign(privateKey);
        sign.update(s.getBytes());
        return sign.sign();
    }

    public static void performVerification(String s, String alg, byte[] signature, PublicKey publicKey)
            throws Exception {
        Signature sign = Signature.getInstance(alg);
        sign.initVerify(publicKey);
        sign.update(s.getBytes());
        System.out.println(sign.verify(signature));
    }
    //endregion
}
