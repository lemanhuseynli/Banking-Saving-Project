CREATE TABLE branches22 (branch_id NUMBER PRIMARY KEY,
                         branch_name VARCHAR2(100),
                         branch_location VARCHAR2(100)
                         );

CREATE TABLE customer22 (cif VARCHAR2(10) PRIMARY KEY,
                         first_name VARCHAR2(50),
                         last_name VARCHAR2(50),
                         gender VARCHAR2(10),
                         age NUMBER,
                         job_title VARCHAR2(50),
                         martial VARCHAR2(30),
                         education VARCHAR2(40),
                         mail VARCHAR2(50),
                         branch_id NUMBER,
                         FOREIGN KEY (branch_id) REFERENCES branches22(branch_id)
                         );

                         
CREATE TABLE currency22 (currency_id VARCHAR2(50) PRIMARY KEY,
                         currency_name VARCHAR2(50),
                         currency_code NUMBER
                         );                    
CREATE TABLE product22 (product_id NUMBER PRIMARY KEY,
                        product_name VARCHAR2(100),
                        term_month NUMBER,
                        min_amount NUMBER,
                        max_amount NUMBER,
                        interest_rate NUMBER,
                        currency_id VARCHAR2(50),
                        FOREIGN KEY (currency_id) REFERENCES currency22(currency_id)
                         ) ;  
                                                
CREATE TABLE deposit22 (deposit_account VARCHAR2(21) PRIMARY KEY,
                        customer_amount NUMBER,
                        customer_id VARCHAR2(20),
                        product_id NUMBER,
                        contract_id NUMBER,
                        start_date DATE,
                        end_date DATE,
                        FOREIGN KEY (customer_id) REFERENCES customer22(cif),
                        FOREIGN KEY (product_id) REFERENCES product22(product_id)
                         ) ;                           

-------------Task 1
CREATE OR REPLACE PACKAGE table_operations22
IS
PROCEDURE insert_customer22(
 p_cif            customer22.cif%TYPE,
 p_first_name     customer22.first_name%TYPE,
 p_last_name      customer22.last_name%TYPE,
 p_gender         customer22.gender%TYPE,
 p_age            customer22.age%TYPE,
 p_job_title      customer22.job_title%TYPE,
 p_martial        customer22.martial%TYPE,
 p_education      customer22.education%TYPE,
 p_mail           customer22.mail%TYPE,
 p_branch_id      customer22.branch_id%TYPE
 );

    
PROCEDURE insert_branches22(
  p_branch_id        branches22.branch_id%TYPE, 
  p_branch_name      branches22.branch_name%TYPE, 
  p_branch_location  branches22.branch_location%TYPE
  );
    
PROCEDURE insert_currency22(
  p_currency_id     currency22.currency_id%TYPE, 
  p_currency_name   currency22.currency_name%TYPE, 
  p_currency_code   currency22.currency_code%TYPE
  );
    
PROCEDURE insert_product22(
  p_product_id     product22.product_id%TYPE, 
  p_product_name   product22.product_name%TYPE, 
  p_term_month     product22.term_month%TYPE,
  p_min_amount     product22.min_amount %TYPE,
  p_max_amount     product22.max_amount %TYPE,
  p_interest_rate  product22.interest_rate%TYPE, 
  p_currency_id    product22.currency_id%TYPE
  );
    
PROCEDURE insert_deposit22(
  p_deposit_account    deposit22.deposit_account%TYPE, 
  p_customer_amount    deposit22.customer_amount%TYPE, 
  p_customer_id        deposit22.customer_id%TYPE, 
  p_product_id         deposit22.product_id%TYPE, 
  p_contract_id        deposit22.contract_id%TYPE, 
  p_start_date         deposit22.start_date%TYPE, 
  p_end_date           deposit22.end_date%TYPE
  );
    
END table_operations22;

---BODY HISSESI
CREATE OR REPLACE PACKAGE BODY table_operations22 
IS
  PROCEDURE insert_customer22( 
  p_cif            customer22.cif%TYPE,
  p_first_name     customer22.first_name%TYPE,
  p_last_name      customer22.last_name%TYPE,
  p_gender         customer22.gender%TYPE,
  p_age            customer22.age%TYPE,
  p_job_title      customer22.job_title%TYPE,
  p_martial        customer22.martial%TYPE,
  p_education      customer22.education%TYPE,
  p_mail           customer22.mail%TYPE,
  p_branch_id      customer22.branch_id%TYPE
  ) IS
    BEGIN
        INSERT INTO customer22(cif,first_name,last_name,gender,age,job_title,martial,education,mail,branch_id) 
        VALUES (p_cif, p_first_name, p_last_name, p_gender, p_age, p_job_title, p_martial, p_education, p_mail, p_branch_id);
        COMMIT;
    END insert_customer22;
    
  PROCEDURE insert_branches22(
  p_branch_id        branches22.branch_id%TYPE, 
  p_branch_name      branches22.branch_name%TYPE, 
  p_branch_location  branches22.branch_location%TYPE
  ) IS
    BEGIN
        INSERT INTO branches22(branch_id,branch_name,branch_location) 
        VALUES (p_branch_id, p_branch_name, p_branch_location);
        COMMIT;
    END insert_branches22;
    
  PROCEDURE insert_currency22(
  p_currency_id     currency22.currency_id%TYPE, 
  p_currency_name   currency22.currency_name%TYPE, 
  p_currency_code   currency22.currency_code%TYPE
  ) IS
    BEGIN
        INSERT INTO currency22(currency_id,currency_name,currency_code) 
        VALUES (p_currency_id, p_currency_name, p_currency_code);
        COMMIT;
    END insert_currency22;
    
 PROCEDURE insert_product22(
  p_product_id     product22.product_id%TYPE, 
  p_product_name   product22.product_name%TYPE, 
  p_term_month     product22.term_month%TYPE,
  p_min_amount     product22.min_amount %TYPE,
  p_max_amount     product22.max_amount %TYPE,
  p_interest_rate  product22.interest_rate%TYPE, 
  p_currency_id    product22.currency_id%TYPE
  )IS
    BEGIN
        INSERT INTO product22(product_id, product_name, term_month ,min_amount, max_amount, interest_rate, currency_id) 
        VALUES (p_product_id, p_product_name, p_term_month, p_min_amount, p_max_amount,  p_interest_rate, p_currency_id);
        COMMIT;
    END insert_product22;
    
PROCEDURE insert_deposit22(
  p_deposit_account    deposit22.deposit_account%TYPE, 
  p_customer_amount    deposit22.customer_amount%TYPE, 
  p_customer_id        deposit22.customer_id%TYPE, 
  p_product_id         deposit22.product_id%TYPE, 
  p_contract_id        deposit22.contract_id%TYPE, 
  p_start_date         deposit22.start_date%TYPE, 
  p_end_date           deposit22.end_date%TYPE
  ) IS
    BEGIN
        INSERT INTO deposit22(deposit_account,customer_amount,customer_id,product_id,contract_id, start_date,end_date) 
        VALUES (p_deposit_account, p_customer_amount, p_customer_id, p_product_id, p_contract_id ,p_start_date, p_end_date);
        COMMIT;
    END insert_deposit22;
    
END table_operations22;

SELECT * FROM User_Errors e WHERE e.name=UPPER('table_operations22');



 *****************************************************************************************************************************************
--2.  Müştərinin qoyduğu məbləğə və term-ə əsasən ona faiz təyin edən və bu faizi ekrana çıxaran prosedur qurun. 
--Həmin faizləri yaratdığınız məhsul cədvəlinə əsasən təyin edin. Yəni məhsul cədvəlində müddət valuta və məbləğ aralığına görə faizlər saxlanılsın.

CREATE OR REPLACE PROCEDURE calculate_interest10(
    p_customer_amount IN NUMBER,
    p_term_month IN NUMBER,
    p_currency_code IN NUMBER
) IS
    v_interest_rate product22.interest_rate%TYPE;
    
BEGIN
    SELECT interest_rate
    INTO v_interest_rate
    FROM product11
    WHERE term_month = p_term_month
        AND p_customer_amount BETWEEN min_amount AND max_amount
        AND currency_id = p_currency_code;
    DBMS_OUTPUT.PUT_LINE('Faiz dəyəri: ' || v_interest_rate);
END calculate_interest10;
BEGIN
  calculate_interest10(20000,12,1);
END;

---3 TASK OVERLOADING - 2 eyniadlı prosedur yaradın OVERLOADING-dən istifade edin.
-- Prosedurlardan birinə əgər müqavilə id-si ötürülürsə onda ekrana müştərinin sonda alacağı faiz məbləği ekrana çıxsın.
--Digər prosedurda isə parameter ötürülməsin və avtomatik olaraq cari gün üzrə müqavilə açan müştərilərin alacağı faiz məbləği cədvəldə saxlanılsın

CREATE OR REPLACE PROCEDURE calculate_interest_amount111(
    p_contract_id IN NUMBER
)
IS
    v_interest_rate product11.interest_rate%TYPE;
    v_amount deposit11.amount%TYPE;
    v_interest_amount NUMBER;
BEGIN
    SELECT d.amount, p.interest_rate
    INTO v_amount, v_interest_rate
    FROM deposit11 d
    JOIN product11 p ON d.product_id = p.product_id
    WHERE d.contract_id = p_contract_id;
    -- Faiz məbləğini hesabla
    v_interest_amount := (v_amount * v_interest_rate / 100); 
    DBMS_OUTPUT.PUT_LINE('Musterinin son aldıqı faiz meblegi: ' || v_interest_amount);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Belə bir müqavilə tapılmadı.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Xəta baş verdi: ' || SQLERRM);
END calculate_interest_amount111;

SELECT * FROM User_Errors e WHERE e.name=UPPER('calculate_interest_amount111');

CREATE TABLE interest_table11 (
    customer_id NUMBER,
    interest_amount NUMBER,
    transaction_date DATE
);


CREATE OR REPLACE PROCEDURE calculate_all_interest1111 IS
    BEGIN
        INSERT INTO interest_table11 (customer_id, interest_amount, transaction_date)
        SELECT d.customer_id, p.interest_rate, SYSDATE
        FROM deposit11 d
        JOIN product11 p ON d.product_id = p.product_id
        WHERE d.start_date =TRUNC(SYSDATE); --sysdate hazir insert et 
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Cari gün üzrə bütün müştərilərin faiz məbləği cədvələ əlavə edildi.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Xəta baş verdi: ' || SQLERRM);
END calculate_all_interest1111;


SELECT * FROM User_Errors e WHERE e.name=UPPER('calculate_all_interest1111');

--3 cunu 1PACKAGEDE YIGDIM
--TEZEDEN
CREATE OR REPLACE PACKAGE deposit_package21 AS
    -- Müqavilə ID-si ötürülərsə, müştərinin son alacağı faiz məbləğini ekrana çıxaran prosedur
    PROCEDURE calculate_interest21(
        p_contract_id IN deposit11.contract_id%TYPE
    );
    
    -- Parametr ötürülməsə, avtomatik olaraq cari gün üzrə müqavilə açan müştərilərin faiz məbləğini cədvəldə saxlayan prosedur
    PROCEDURE calculate_interest21;
END deposit_package21;

CREATE OR REPLACE PACKAGE BODY deposit_package21 AS
    PROCEDURE calculate_interest21(
        p_contract_id IN deposit11.contract_id%TYPE
    ) IS
       v_interest_rate product11.interest_rate%TYPE;
    v_amount deposit11.amount%TYPE;
    v_interest_amount NUMBER;
BEGIN
    SELECT d.amount, p.interest_rate
    INTO v_amount, v_interest_rate
    FROM deposit11 d
    JOIN product11 p ON d.product_id = p.product_id
    WHERE d.contract_id = p_contract_id;
    v_interest_amount := (v_amount * v_interest_rate / 100);
   -- Nəticəni ekrana çıxar
    DBMS_OUTPUT.PUT_LINE('Musterinin son aldıqı faiz meblegi: ' || v_interest_amount);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Belə bir müqavilə tapılmadı.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Xəta baş verdi: ' || SQLERRM);
    END calculate_interest21;

    -- Parametr ötürülməsə, avtomatik olaraq cari gün üzrə müqavilə açan müştərilərin faiz məbləğini cədvəldə saxlayan prosedur
    PROCEDURE calculate_interest21 IS
    BEGIN
        INSERT INTO interest_table11 (customer_id, interest_amount, transaction_date)
        SELECT d.customer_id, p.interest_rate, SYSDATE 
        FROM deposit11 d
        JOIN product11 p ON d.product_id = p.product_id
        WHERE d.start_date =TRUNC(SYSDATE); --sysdate hazir insert et 
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Cari gün üzrə bütün müştərilərin faiz məbləği cədvələ əlavə edildi.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Xəta baş verdi: ' || SQLERRM);
    END calculate_interest21;
END deposit_package21;

SELECT * FROM User_Errors e WHERE e.name=UPPER('deposit_package21');
BEGIN
  deposit_package21.calculate_interest21;
END;

SELECT * FROM interest_table11;







----4 cu .  Bir funksiya yaradın və funksiya ekrana müştəri gəlib pulunu götürmək istədikdə ona nə qədər pul ödənəcək onu hesablasın. 
--Əgər müştəri müqavilənin vaxtı bitdikdən sonra gəlibsə o zaman öz pulunu və alacağı bütün faiz məbləği ekrana çıxmalıdır.
 --Əgər vaxtı bitməmiş gəlibsə o zaman öz pulunu və faizlə alacağı məbləğin 1 faizi ekrana çıxmalıdır.
-- Bazada funksiyaya ötürülən argumentə uyğun data yoxdursa ekrana error qaytarın və həmin datanı exception_data cədvəlinə insert edin.

--burda exception_data11 adli log cedvelimiz var
CREATE TABLE exception_data11 (
    customer_id VARCHAR2(10),
    exception_date DATE
);

CREATE OR REPLACE FUNCTION calculate_paymentson11(p_customer_id IN VARCHAR2) RETURN NUMBER IS
    v_payment_amount NUMBER;
    v_interest_rate NUMBER;
    v_principal_amount NUMBER;
    v_end_date DATE;
    v_current_date DATE := SYSDATE;  --buraya trunc lazimmi?
BEGIN
    SELECT d.amount, p.interest_rate, d.end_date
    INTO v_principal_amount, v_interest_rate, v_end_date
    FROM deposit11 d
    JOIN product11 p ON d.product_id = p.product_id
    WHERE d.customer_id = p_customer_id;
    IF v_current_date > v_end_date THEN
        -- Bütün faizi hesablayırıq
        v_payment_amount := v_principal_amount + (v_principal_amount * v_interest_rate / 100);
    ELSE
        v_payment_amount := v_principal_amount + (v_principal_amount * v_interest_rate / 100 *0.01); -- Ayda bir faiz
    END IF;

    RETURN v_payment_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Əgər bazada müştəri üçün məlumat yoxdursa
        INSERT INTO exception_data11 (customer_id, exception_date) VALUES (p_customer_id, SYSDATE);
        RETURN NULL;
END;

DECLARE
    v_payment_amount NUMBER;
BEGIN
    v_payment_amount := calculate_paymentson11('1000'); -- Müştəri kimliyi burada göstərilmişdir
    DBMS_OUTPUT.PUT_LINE('Ödəniş məbləği: ' || v_payment_amount);
END;

SELECT * FROM deposit11;
SELECT * FROM product11;
SELECT * FROM exception_data11;

--5ci

--5-----------
CREATE TABLE deposit_archive_33 (
    deposit_account VARCHAR2(21),
    old_start_date DATE,
    old_end_date DATE,
    old_customer_amount NUMBER,
    archiving_date DATE
);
CREATE OR REPLACE TRIGGER update_deposit_trigger_3
BEFORE UPDATE OF end_date ON deposit33
FOR EACH ROW
BEGIN
    IF :OLD.end_date < TRUNC(SYSDATE) THEN
        INSERT INTO deposit_archive_33 (deposit_account, old_start_date, old_end_date, old_customer_amount, archiving_date)
        VALUES (:OLD.deposit_account, :OLD.start_date, :OLD.end_date, :OLD.customer_amount, TRUNC(SYSDATE));
        
        :NEW.start_date := :OLD.end_date;
        SELECT ADD_MONTHS(:OLD.end_date, p.term_month) INTO :NEW.end_date FROM product33 p WHERE p.product_id = :OLD.product_id;
        SELECT ROUND(:OLD.customer_amount * (1 + p.interest_rate / 100), 2) INTO :NEW.customer_amount FROM product33 p WHERE p.product_id = :OLD.product_id;
    END IF;
END;


CREATE OR REPLACE PROCEDURE prolong_deposit_33
IS
BEGIN
    UPDATE deposit33 d
    SET (start_date, end_date, customer_amount) = 
        (SELECT d.end_date, 
                ADD_MONTHS(d.end_date, p.term_month),
                ROUND(d.customer_amount * (1 + p.interest_rate / 100), 2)
           FROM product22 p
          WHERE d.product_id = p.product_id)
    WHERE d.end_date < TRUNC(SYSDATE); 
END;

SELECT * FROM User_Errors e WHERE e.name=UPPER('prolong_deposit_17mart22');
SELECT * FROM  deposit_archive_33;

BEGIN 
  prolong_deposit_33;
END;

SELECT * FROM deposit33 ;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'prolong_deposit_job',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN prolong_deposit_33; END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=22',
        enabled         => TRUE
    );
END;
