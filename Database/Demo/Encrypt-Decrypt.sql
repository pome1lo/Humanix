
CREATE OR REPLACE FUNCTION encrypt(p_plain_text VARCHAR2, p_salt VARCHAR2) RETURN RAW IS
    encryption_key RAW(256) := HEXTORAW('0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF');
    encrypted_raw RAW(2048);
BEGIN
    encrypted_raw := DBMS_CRYPTO.ENCRYPT(
        src => UTL_I18N.STRING_TO_RAW(p_plain_text || p_salt, 'AL32UTF8'),
        typ => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
        key => encryption_key
    );
    RETURN encrypted_raw;
END encrypt;
/

CREATE OR REPLACE FUNCTION decrypt(p_encrypted_text RAW, p_salt VARCHAR2) RETURN VARCHAR2 IS
    encryption_key RAW(256) := HEXTORAW('0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF');
    decrypted_raw RAW(2048);
BEGIN
    decrypted_raw := DBMS_CRYPTO.DECRYPT(
        src => p_encrypted_text,
        typ => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
        key => encryption_key
    );
    RETURN separate_string(UTL_I18N.RAW_TO_CHAR(decrypted_raw, 'AL32UTF8'), p_salt);
END decrypt;
/

CREATE OR REPLACE FUNCTION separate_string(p_pass VARCHAR2, p_salt VARCHAR2) RETURN VARCHAR2 IS
    result_string VARCHAR2(2000);
BEGIN
    IF INSTR(p_pass, p_salt) > 0 THEN
        result_string := SUBSTR(p_pass, 1, INSTR(p_pass, p_salt) - 1);
    ELSE
        result_string := p_pass;
    END IF;
    RETURN result_string;
END separate_string;
/

CREATE OR REPLACE FUNCTION generate_salt(p_email VARCHAR2) RETURN VARCHAR2 IS
    v_salt VARCHAR2(128);
BEGIN
    -- Генерируем соль на основе email
    SELECT DBMS_CRYPTO.HASH(UTL_I18N.STRING_TO_RAW(p_email, 'AL32UTF8'), DBMS_CRYPTO.HASH_SH1) INTO v_salt FROM dual;
    RETURN v_salt;
END generate_salt;
/


DECLARE
    raw_text VARCHAR2(2000);
    encrypted_text RAW(2048);
    decrypted_text VARCHAR2(2000);
    salt VARCHAR2(128);
BEGIN
    raw_text := 'Hello, World!';
    salt := ADMIN.generate_salt('somesalt');
    DBMS_OUTPUT.PUT_LINE('Encrypted salt: ' || salt);
    encrypted_text := ADMIN.encrypt(raw_text, salt);
    decrypted_text := ADMIN.decrypt(encrypted_text, salt);
    DBMS_OUTPUT.PUT_LINE('Decrypted text: ' || decrypted_text);
END;
/

SELECT * FROM ADMIN.EMPLOYEES;