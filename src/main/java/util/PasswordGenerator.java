package util;

public class PasswordGenerator {

    public static void main(String[] args) {

        System.out.println("Encrypted Password:");
        System.out.println(EncryptionUtil.encrypt("Admin@123"));

    }
}