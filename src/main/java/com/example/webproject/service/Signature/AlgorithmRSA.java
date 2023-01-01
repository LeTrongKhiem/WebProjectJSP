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

    public synchronized String encrypt(String message, BigInteger decrypt, BigInteger n) {
        return (new BigInteger(message.getBytes())).modPow(decrypt, n).toString();
    }

    public synchronized BigInteger encrypt(BigInteger message) {
        return message.modPow(decrypt, n);
    }

    public synchronized String decrypt(String message, BigInteger encrypt, BigInteger n) {
        return new String((new BigInteger(message)).modPow(encrypt, n).toByteArray());
    }

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
        System.out.println("encrypt = " + encrypt);
        System.out.println("decrypt = " + decrypt);
    }

    public static void main(String[] args) throws Exception {
        AlgorithmRSA rsa = new AlgorithmRSA();
        rsa.KeyRSA(1024);
//        String text1 = "61411052594266198945160928231491351478092641952090802072832725103112401723238872475837656358211754090171851111212828049142487895150211281946584341673611260981476781237054294943964606351346418570018386162397306369277957453253895691207103085117377771127143971893413119023558926066781433174850559335024822557544";
        SHA1Algorithm sha1 = new SHA1Algorithm();
        String text = "test123";
        String bi = new String(sha1.getSHA1("D:\\LapTrinhWeb\\JSPDemo\\WebProject\\src\\main\\java\\com\\example\\webproject\\Authentication\\show.png").toString());
//        BigInteger text1 = new BigInteger(bi);
//        System.out.println("Plaintext: " + text1);
////  BigInteger plaintext = new BigInteger(text1);
//
//        BigInteger ciphertext = rsa.encrypt(text1);
//        System.out.println("Ciphertext: " + ciphertext);
////  plaintext = rsa.decrypt(ciphertext);
//
//        BigInteger text2 = rsa.decrypt(ciphertext);
//        System.out.println("Plaintext: " + text2);
        BigInteger encrypt = new BigInteger("11546299761438074343532124601422490520545434808124322562225570998699461061362019461329337020957407085243857403785948126121356255089335896695715262899630719");
        BigInteger decrypt = new BigInteger("6808271508449352463815151731299382150736197434519481369182110905144389871922600213007560236701945247637499970078638614311398709295954244206972099720730662722155484713590570326811593308805819134774123129312769545403177611159917582618419441340745100714758157976866172039178924664016224332354452963214677592071");
        BigInteger n = new BigInteger("77090042336974531806221887795102945315732187750335710701967209513978218869174073250769118906128438299277770591264153110460684105977347576785307572095510825230239347119996567871714590115690668761960243660782083764697700780750528561122935149513572506069120326754859612953307397248489428564036724759221365328963");
        System.out.println("Plaintext: " + text);
        String ciphertext = rsa.encrypt(text, decrypt, n);
        System.out.println("Ciphertext: " + ciphertext);
        String planText = rsa.decrypt(ciphertext, encrypt, n);
        System.out.println("Plaintext: " + planText);
        System.out.println("Private key: " + decrypt);
        System.out.println("Public key: " + encrypt);
        if (text.equals(planText)) {
            System.out.println("Success");
        } else {
            System.out.println("Fail");
        }
    }
}
