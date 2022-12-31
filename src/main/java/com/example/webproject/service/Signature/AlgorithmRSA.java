package com.example.webproject.service.Signature;

import com.example.webproject.Authentication.SHA1Algorithm;

import java.math.BigInteger;
import java.security.SecureRandom;

public class AlgorithmRSA {
    private BigInteger n, decrypt, encrypt;

    public AlgorithmRSA() {
    }

    public AlgorithmRSA(BigInteger n, BigInteger decrypt, BigInteger encrypt) {
        this.n = n;
        this.decrypt = decrypt;
        this.encrypt = encrypt;
    }

    public AlgorithmRSA(BigInteger newn, BigInteger newe) {
        n = newn;
        encrypt = newe;
    }

    public BigInteger getN() {
        return n;
    }

    public void setN(BigInteger n) {
        this.n = n;
    }

    public BigInteger getDecrypt() {
        return decrypt;
    }

    public void setDecrypt(BigInteger decrypt) {
        this.decrypt = decrypt;
    }

    public BigInteger getEncrypt() {
        return encrypt;
    }

    public void setEncrypt(BigInteger encrypt) {
        this.encrypt = encrypt;
    }

    /**
     * Encrypt the given plaintext message.
     */
    public synchronized String encrypt(String message) {
        return (new BigInteger(message.getBytes())).modPow(decrypt, n).toString();
    }

    /**
     * Encrypt the given plaintext message.
     */
    public synchronized BigInteger encrypt(BigInteger message) {
        return message.modPow(decrypt, n);
    }

    /**
     * Decrypt the given ciphertext message.
     */
    public synchronized String decrypt(String message) {
        return new String((new BigInteger(message)).modPow(encrypt, n).toByteArray());
    }

    /**
     * Decrypt the given ciphertext message.
     */
    public synchronized BigInteger decrypt(BigInteger message) {
        return message.modPow(encrypt, n);
    }



    public void KeyRSA(int bits) {
        SecureRandom r = new SecureRandom();
        BigInteger p = new BigInteger(bits / 2, 100, r);
        BigInteger q = new BigInteger(bits / 2, 100, r);
        n = p.multiply(q);
        BigInteger m = (p.subtract(BigInteger.ONE)).multiply(q
                .subtract(BigInteger.ONE));
        boolean found = false;
        do {
            encrypt = new BigInteger(bits / 2, 50, r);
            if (m.gcd(encrypt).equals(BigInteger.ONE) && encrypt.compareTo(m) < 0) {
                found = true;
            }
        } while (!found);
        decrypt = encrypt.modInverse(m);
        System.out.println("n = " + n);
    }

    public static void main(String[] args) throws Exception {
        AlgorithmRSA rsa = new AlgorithmRSA();
        rsa.KeyRSA(1024);
//        String text1 = "61411052594266198945160928231491351478092641952090802072832725103112401723238872475837656358211754090171851111212828049142487895150211281946584341673611260981476781237054294943964606351346418570018386162397306369277957453253895691207103085117377771127143971893413119023558926066781433174850559335024822557544";
        SHA1Algorithm sha1 = new SHA1Algorithm();

        String bi = new String(sha1.getSHA1("D:\\LapTrinhWeb\\JSPDemo\\WebProject\\src\\main\\java\\com\\example\\webproject\\Authentication\\show.png").toString());
        BigInteger text1 = new BigInteger(bi);
//        System.out.println("Plaintext: " + text1);
////  BigInteger plaintext = new BigInteger(text1);
//
//        BigInteger ciphertext = rsa.encrypt(text1);
//        System.out.println("Ciphertext: " + ciphertext);
////  plaintext = rsa.decrypt(ciphertext);
//
//        BigInteger text2 = rsa.decrypt(ciphertext);
//        System.out.println("Plaintext: " + text2);
    }
}
