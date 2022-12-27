package com.example.webproject.service.Signature;

import com.example.webproject.Authentication.SHA1Algorithm;

import java.math.BigInteger;
import java.security.SecureRandom;

public class AlgorithmRSA {
    private BigInteger a, b, c;

    public AlgorithmRSA() {
    }

    public AlgorithmRSA(BigInteger a, BigInteger b, BigInteger c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }

    public AlgorithmRSA(BigInteger newn, BigInteger newe) {
        a = newn;
        c = newe;
    }

    public BigInteger getA() {
        return a;
    }

    public void setA(BigInteger a) {
        this.a = a;
    }

    public BigInteger getB() {
        return b;
    }

    public void setB(BigInteger b) {
        this.b = b;
    }

    public BigInteger getC() {
        return c;
    }

    public void setC(BigInteger c) {
        this.c = c;
    }

    public BigInteger encrypt(BigInteger m) {
        return m.modPow(b, a);
    }

    public synchronized String encrypt(String message) {
        return (new BigInteger(message.getBytes())).modPow(b, a).toString();
    }

    public BigInteger decrypt(BigInteger m) {
        return m.modPow(c, a);
    }

    public synchronized String decrypt(String message) {
        return new String((new BigInteger(message)).modPow(c, a).toByteArray());
    }

    public BigInteger sign(BigInteger m) {
        return m.modPow(b, c);
    }

    public synchronized String sign(String message) {
        return (new BigInteger(message.getBytes())).modPow(b, a).toString();
    }

    public void KeyRSA(int bits) {
        SecureRandom r = new SecureRandom();
        BigInteger p = new BigInteger(bits / 2, 100, r);
        BigInteger q = new BigInteger(bits / 2, 100, r);
        a = p.multiply(q);
        BigInteger m = (p.subtract(BigInteger.ONE)).multiply(q
                .subtract(BigInteger.ONE));
        boolean found = false;
        do {
            c = new BigInteger(bits / 2, 50, r);
            if (m.gcd(c).equals(BigInteger.ONE) && c.compareTo(m) < 0) {
                found = true;
            }
        } while (!found);
        b = c.modInverse(m);
    }

    public static void main(String[] args) throws Exception {
        AlgorithmRSA rsa = new AlgorithmRSA();
        rsa.KeyRSA(1024);
//        String text1 = "61411052594266198945160928231491351478092641952090802072832725103112401723238872475837656358211754090171851111212828049142487895150211281946584341673611260981476781237054294943964606351346418570018386162397306369277957453253895691207103085117377771127143971893413119023558926066781433174850559335024822557544";
        SHA1Algorithm sha1 = new SHA1Algorithm();

        String bi = new String(sha1.getSHA1("D:\\LapTrinhWeb\\JSPDemo\\WebProject\\src\\main\\java\\com\\example\\webproject\\Authentication\\show.png").toString());
        BigInteger text1 = new BigInteger(bi);
        System.out.println("Plaintext: " + text1);
//  BigInteger plaintext = new BigInteger(text1);

        BigInteger ciphertext = rsa.encrypt(text1);
        System.out.println("Ciphertext: " + ciphertext);
//  plaintext = rsa.decrypt(ciphertext);

        BigInteger text2 = rsa.decrypt(ciphertext);
        System.out.println("Plaintext: " + text2);
    }
}
