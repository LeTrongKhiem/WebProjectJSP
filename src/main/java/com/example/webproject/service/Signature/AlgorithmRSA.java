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
        BigInteger encrypt = new BigInteger("48083717035643138481672704259672844306881734958008840902707930240279623554787554464466799538247200203900075692985462621371504423137688054427960098806268469");
        BigInteger decrypt = new BigInteger("1383397933234550170478461486551572955231934683261506714702677025552513028181507768242102046575363197793720774322783459644555891989352125412698033218971637894653817195851970226255818113719055705964456166273628670475089774021392594371118658940720595631819831933137632828234171601669618320984520947556786847859709");
        BigInteger n = new BigInteger("1419314275482499015762797559902812354396478450757112098789323385528891295263871017779696445826016953226401904655974520112935000612661399114081044380553712594009664347328708693025229264614845180557375314314377618101083448344555441037477497047353437680590120682396155760358415650336565666704882232594797863847463");
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
