-- ALTER SESSION SET CONTAINER = HUMANIX_PDB;
-- GRANT EXECUTE ON sys.DBMS_CRYPTO TO admin;
-- GRANT EXECUTE ON sys.DBMS_CRYPTO TO admin_user;
CREATE OR REPLACE FUNCTION encrypt(p_plain_text VARCHAR2) RETURN RAW IS
    encryption_key RAW(256) := HEXTORAW('0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF');
    encrypted_raw RAW(2048);
BEGIN
    encrypted_raw := DBMS_CRYPTO.ENCRYPT(
        src => UTL_I18N.STRING_TO_RAW(p_plain_text, 'AL32UTF8'),
        typ => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
        key => encryption_key
    );
    RETURN encrypted_raw;
END encrypt;
/

CREATE OR REPLACE FUNCTION decrypt(p_encrypted_text RAW) RETURN VARCHAR2 IS
    encryption_key RAW(256) := HEXTORAW('0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF');
    decrypted_raw RAW(2048);
BEGIN
    decrypted_raw := DBMS_CRYPTO.DECRYPT(
        src => p_encrypted_text,
        typ => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
        key => encryption_key
    );
    RETURN UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8');
END decrypt;
/

DECLARE
    plain_text VARCHAR2(100) := 'Hello, World!';
    encrypted_text RAW(2048);
    decrypted_text VARCHAR2(100);
BEGIN
    -- Шифрование текста
    encrypted_text := encrypt(plain_text);
    DBMS_OUTPUT.PUT_LINE('Зашифрованный текст: ' || RAWTOHEX(encrypted_text));

    -- Дешифрование текста
    decrypted_text := decrypt(encrypted_text);
    DBMS_OUTPUT.PUT_LINE('Дешифрованный текст: ' || decrypted_text);
END;
/
