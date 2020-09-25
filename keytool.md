Java's Keytool for managing keys/certificates
=======================================================

**Commands**:
- List keys from a keystore:
  ```bash
  keytool -list -keystore <keystore>
  ```
- Export a key/certificate from a keystore:
  ```bash
  keytool -exportcert -rfc -alias <name of key> -keystore <keystore>
  ```
- Import a key/certificate to a keystore:
  ```bash
  keytool -importcert -keystore <keystore> -alias <name of key> -file <actual key/certicate>
  ```
- Delete a key from a keystore:
  ```bash
  keytool -delete -alias key-benchmark -keystore keys.p12
  ```
- Change a key password in a .jks keystore:
  ```bash
  keytool -keypasswd -alias <name of key> -keystore <.jks keystore>
  ```
- Import a key (or all) from a keystore to another keystore [1]:
  ```bash
  keytool -importkeystore -srckeystore <kestore 1> -srcalias <name of key> -destkeystore <kestore 2> -destalias <name of key> -deststoretype PKCS12
  ```

REFERENCES:
[1] - https://stackoverflow.com/questions/31228462/how-to-change-pkcs12-keystore-password-using-keytool
