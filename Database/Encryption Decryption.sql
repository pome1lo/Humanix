-- ALTER SESSION SET CONTAINER = HUMANIX_PDB;
-- GRANT EXECUTE ON sys.DBMS_CRYPTO TO admin;
-- GRANT EXECUTE ON sys.DBMS_CRYPTO TO admin_user;

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

DECLARE
    raw_text VARCHAR2(2000);
    encrypted_text RAW(2048);
    decrypted_text VARCHAR2(2000);
    salt VARCHAR2(128);
BEGIN
    raw_text := 'Hello, World!';
    salt := 'somesalt';
    encrypted_text := encrypt(raw_text, salt);
    decrypted_text := decrypt(encrypted_text, salt);
    DBMS_OUTPUT.PUT_LINE('Decrypted text: ' || decrypted_text);
END;
/

SELECT * FROM EMPLOYEES;

BEGIN
    INSERT_INTO_EMPLOYEES('TEST', 'TEST', 'TEST', '1234567890','AD_PRES', 50000, 0.1, NULL, 1, 'TEST');
    DBMS_OUTPUT.PUT_LINE('RESULT: ' || LOGIN_EMPLOYEE('TEST', 'TEST'));
END;
/

SELECT * FROM EMPLOYEES;
