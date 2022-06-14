package com.g2ssid.ddh_g2ssid_api.config;
import org.springframework.security.crypto.password.MessageDigestPasswordEncoder;

/**
 * @author Julio Quispe
 */
public class MyPasswordEncoder extends MessageDigestPasswordEncoder {
    public MyPasswordEncoder() {
        this(1);
    }

    public MyPasswordEncoder(int strength) {
        super("SHA-" + strength);
    }
}
