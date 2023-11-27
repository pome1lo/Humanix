--## Обязательно включите режим аудита Базы Данных
-- 1. Аудит SYS операций
-- По умолчанию в базе данных Oracle не активирован аудит исполняемых команд SQL, выполняемый в привилегированном режиме
-- от учетки SYS, а так же при подключении пользователей с привилегиями (учетками) SYSDBA или SYSOPER. Так если ваша база
-- данных будет взломана, эти учетки будут использованы  хакерами в  первую очередь. Но, к счастью  аудит SQL-команд из
-- этих привилегированных учеток очень просто включить следующей командой
alter system set audit_sys_operations=true scope=spfile;
-- 2. Включение аудита Базы Данных
-- Опять же, по умолчанию в Oracle аудит команд SQL не включен по умолчанию. По рекомендациям разработка аудит должен быть
-- включен для всех команд SQL. Аудит базы данных включается с применением параметра audit_trail:
alter system set audit_trail=DB,EXTENDED scope=spfile;
--https://www.securitylab.ru/blog/personal/Informacionnaya_bezopasnost_v_detalyah/326445.php?utm_referrer=https%3A%2F%2Fyandex.by%2Fclck%2Fjsredir%3Ffrom%3Dyandex.by%253Bsearch%252F%253Bweb%253B%253B%26text%3D%26etext%3D2202.FfqAcvVnUVV5mqt0ymyvs9xjuLb1diSGWgFJy8NWS1ePqI5oLz5uSvPLTN6WdtGZcOR3_H0H8nPmUB0loypFQKEG8CAdO7wS-oied1qBkJGFgK46_lEzVN31XE3ssuBXQtoL0kKzzu0_oC5HpUVWcXBzcWtha21yaHBnanV3eHE.fb4bddcfb3addb622d69edf32aaaa1fdf04b9009%26uuid%3D%26state%3DRsWHKQP_fPE%2C%26%26cst%3DAxbTlK7nwx6hOtlFEVBANl1izAhBtFMysI9-4LPTZWNLiJexhtm4VHsQJOYuuyQSor9JPA3YX6M4n1nF2zjoR3OHBa7tgaLANxz54bBAh5gbkxYiPyIGVWuZzRxYw2BsRSGqn9N1UZlJNfgdeP5KxhXso9f8uhMUQXj6OSRsk7kwDA3ilNg_t6ogWLDNSRa6TBRtZ1_ExEyqkhVIoPcwAEdlopI9NrIM7B-DmhKGn3Lp4wgWGFVsvmMI0yeRGrNZZ4oVFy5b9bcEDSxC1rGGceep3pN_K2Uc9kTxwjv2RubbZnJIAXZpN2N4cR8Wdr7aBd-0EZYYMpgjOG0_P3kNmjmueB8TTS1QdIfJBiFd3SELrQaR2ToaK3XUg1n0RTx6Tclfb942Qd9wlgdTbwyz5dxQVg5QbpVagzAa9KU1BcMOEKL2FqSGU1h6LHYs-m5QuOBhP6YqX8jpAmwzGIGDiOvE1BGSBhXrhhNtI_Gnu6w0n_5jY4NPMLN5jATHPdYlGHDKVnWjf63Nyur0m9Lu8HSDNZmB1gaV1IvOtmp9GZalskr9e_BUIJA4PJSoPrdkoP1rQ82gP7bK65To5mZ0YFMCZFZ4-qT2DiFsD2QkRdGddPuhW4e2mU59f88YC7JuXlxBEvu5CGcTiRNAmkBPkOsNGCfFHbt2DlUqQiTvLCL-Gp_hdnoHfuWLlj2L6Mw6i_dMLiUOaGXG2teNWItJWcbF9J9JugzvBeUy06-8efIY3uLI6VxNB4W2SpE-0p6Vlcw1yU-4weIHyhVPk1ayfSzWe10VJvsA4mHiMyiwNWZlYhUxwDBcYT-GTa9rBtS4D45JtRuGalJdu4XB175W8t6gIEND4Jw7EIPwnQevsVQ47SAfmKfQBh_nX88wOI3s53yOpx_ccaqa2zURv4-FZ2cjFRT38PKA79xVTyGfiUAdaVOGDfprtjbiUIRWezPVmMCYWKu36g9Uz31hv-VdF3pocmD6gR4xBLFFHwFl9zdMoFfC2Aeft4dGaNHDkqi7pFF-9VjEsJhJGO-F5rXms-n0WHlwSgvWhojlFYUDJTWkqZRE0uJwJMF5h7IQ7M8t27Y0sxC3eorAB_2az84Q0fI0q291PrJiKXihD0KxAAFN73GamG4Be7c3tmIphbriMACviA8Yx1kLZDd30_k5feoPJLvaQq1P6VxaeR78z0078soQ3B2Mcr_g34swyWdyyqNudqhK_yYGMWzBTmsvRiUt-AZm3c2EreGXm1xlYxlB3-mIrg9rBhVBB-YLfM_C4aqNmCduVZKGKXHwgiBGsxTNR0sXTtLo3cHY4cdX7JaQS8icA0GMe-mPWGqdsK-6%26data%3DVzFITjJTUER3MkI4MEY5djBaZUVGeVN6clZqVkxOdW8xUzFTUzVoaFNicHpaOXh3V1licHFRUUlIbEExU2ZPeHFYMUp3cF8yTklTUVhlS0JqZUlyN09qUUJVekxSeDRxak0wYWpJejFabnczcGptR2pzNGJLcHpaeHk2NUk2S0hiSkZVS19LaEJoR2ZQckd5RUNpbF9rUEtqZlNhUTJIUlZSWlRRRlhYZk9HY1lDcEgzV2RfS1VIZUpnYVVrbGlUX1VMTE5vMDdjTDQs%26sign%3D7ad9d31381103e99f6f6096609c25219%26keyno%3DWEB_0%26b64e%3D2%26ref%3Dmag21uLwzH-8DD0L95JlNQKFpyWyMNKb3D6h0JYhedos9gOjHrhVrGUOEOda0MEwAOvQfjFbJVpZFnhFExXnRJbui_LwPTsyUkpQbZoOdeTxKisncBW2FOcbT0jSAFulKTD3wdblXRKAZ3dkTb41WeAd3dvXYfwiRPr1crQvPMf1muAdxhkTQXMWHjiqeVDMWwBQXtOHW5b5TuOe579DDFEYXY6UU_f80LyydR4ux_w1VM6ra8Tj4w7IocMwurswSf-9OLW6TWRsbW3sxjq6YU3RTMkVszt2sCH5Jn1hq2LRi6d_tckwz6kaRGWgrh29UEapToR5XILNWYdwmCY9f53wpTTlYUClSkwTLkhW0DqAvc4ybxxcXX3A4AfexZ-nPw7x3e4ngKNd2YUYMAi7G4mQi4eTjeV3X5MmaTyGAXBVCf9m6fnb1g%2C%2C%26l10n%3Dru%26cts%3D1696089327091%2540%2540events%253D%255B%257B%2522event%2522%253A%2522click%2522%252C%2522id%2522%253A%25222_4hibw02-00%2522%252C%2522cts%2522%253A1696089327091%252C%2522fast%2522%253A%257B%2522organic%2522%253A1%257D%252C%2522service%2522%253A%2522web%2522%252C%2522event-id%2522%253A%2522ln67skj7uy%2522%252C%2522data%2522%253A%257B%2522pageX%2522%253A241%252C%2522pageY%2522%253A459%257D%257D%255D%26mc%3D4.004886164091844%26hdtime%3D4284.1


--## Защита словаря данных
-- Пользователи, которым предоставлены системные полномочия ANY , могут удалять таблицы словаря данных. Чтобы защитить
-- словарь данных, конфигурационный параметр 07_DICTIONARY_ACCESSIBILITY в файле параметров необходимо установить в FALSE.
-- Это ограничит выдачу полномочий ANY только тем пользователям, которые регистрируются с полномочиями SYSDBA.
-- Подключение к базе данных с полномочиями SYSDBA
ALTER SYSTEM SET "_07_DICTIONARY_ACCESSIBILITY" = FALSE SCOPE=SPFILE;
-- Перезапуск базы данных для применения изменений
SHUTDOWN IMMEDIATE;
STARTUP;


--##Защита слушателя
-- Как было показано в статье блогов, для слушателя всегда следует применять пароль, чтобы воспрепятствовать подключению
-- неправомочных пользователей к базе данных Oracle. Помните, что организовать атаку на незащищенную службу TNS Listener
-- довольно просто. Как только пароль для слушателя установлен, привилегированные действия, такие как остановка или запуск
-- слушателя, не смогут выполняться без ввода соответствующего пароля.
-- Можно также запретить пользователю применять команду SET для вмешательства в функции слушателя. Для этого потребуется
-- добавить следующую строку в файл конфигурации listener.ora:
ADMIN_RESTRICTIONS=ON
-- По умолчанию этот параметр установлен в значение false. Следует также избегать удаленного управления службой слушателя,
-- поскольку ее пароль не шифруется при передаче по сети. Пароль слушателя хранится в файле listener.ora, поэтому нужно
-- защитить этот файл.