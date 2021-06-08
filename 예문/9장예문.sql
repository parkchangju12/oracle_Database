--IF문
DECLARE
    vn_num1 NUMBER :=1;
    vn_num2 NUMBER :=2;
    
BEGIN
    IF  vn_num1 >= vn_num2 THEN
        DBMS_OUTPUT.PUT_LINE(vn_num1 ||'이큰수');
    ELSE
        DBMS_OUTPUT.PUT_LINE(vn_num2 ||'이큰수');
    END IF;
END;


--IF문/DML활용

DECLARE
    vn_salary           NUMBER:=0;
    vn_department_id    NUMBER:=0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    
    SELECT  salary
    INTO    vn_salary
    FROM    employees
    WHERE   department_id = vn_department_id
    AND     ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE(vn_salary);
    
    IF vn_salary BETWEEN 1 AND 3000 THEN
        DBMS_OUTPUT.PUT_LINE('낮음');
    ELSIF vn_salary BETWEEN 3001 AND 6000 THEN
        DBMS_OUTPUT.PUT_LINE('중간');
    ELSIF vn_salary BETWEEN 6001 AND 9000 THEN
        DBMS_OUTPUT.PUT_LINE('높음');
    ELSE
        DBMS_OUTPUT.PUT_LINE('최상위');
    END IF;
END;

--IF문/DML활용2
DECLARE
    vn_salary           NUMBER:=0;
    vn_department_id    NUMBER:=0;
    vn_commission       NUMBER:=0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    
    SELECT  salary, commission_pct
    INTO    vn_salary, vn_commission
    FROM    employees
    WHERE   department_id = vn_department_id
    AND     ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE(vn_salary);
    
    IF vn_commission >0 THEN
        IF vn_commission >0.15 THEN
            DBMS_OUTPUT.PUT_LINE(vn_salary * vn_commission);
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('vn_salary');
    END IF;
END;

--CASE문/DML활용
DECLARE
    vn_salary           NUMBER:=0;
    vn_department_id    NUMBER:=0;
BEGIN
    vn_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    
    SELECT  salary
    INTO    vn_salary
    FROM    employees
    WHERE   department_id = vn_department_id
    AND     ROWNUM = 1;
    
    DBMS_OUTPUT.PUT_LINE(vn_salary);
    
    CASE WHEN vn_salary BETWEEN 1 AND 3000 THEN
            DBMS_OUTPUT.PUT_LINE('낮음');
         WHEN vn_salary BETWEEN 3001 AND 6000 THEN
            DBMS_OUTPUT.PUT_LINE('중간');
         WHEN vn_salary BETWEEN 6001 AND 9000 THEN
            DBMS_OUTPUT.PUT_LINE('높음');
         ELSE
            DBMS_OUTPUT.PUT_LINE('최상위');
    END CASE;
END;


--LOOP문/DML활용

DECLARE
    vn_base_num         NUMBER:=3;
    vn_cnt              NUMBER:=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' ||vn_cnt ||'='
                                ||vn_base_num*vn_cnt);
        vn_cnt:=vn_cnt+1;
        
        EXIT WHEN vn_cnt >9;
    END LOOP;
END;

--WHILE문/DML활용1

DECLARE
    vn_base_num         NUMBER:=3;
    vn_cnt              NUMBER:=1;
BEGIN
    WHILE vn_cnt <= 9
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' ||vn_cnt ||'='
                                ||vn_base_num*vn_cnt);
        vn_cnt := vn_cnt + 1;
        
    END LOOP;
END;

--WHILE문/DML활용2

DECLARE
    vn_base_num         NUMBER:=3;
    vn_cnt              NUMBER:=1;
BEGIN
    WHILE vn_cnt <= 9
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' ||vn_cnt ||'='
                                ||vn_base_num*vn_cnt);
        EXIT WHEN vn_cnt = 5;
        vn_cnt := vn_cnt + 1;
        
    END LOOP;
END;

--IF문

DECLARE
    vn_base_num         NUMBER:=3;
BEGIN
    FOR i IN 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' ||i ||'='
                                ||vn_base_num*i);
    END LOOP;
END;

--IF문/REVERSE

DECLARE
    vn_base_num         NUMBER:=3;
BEGIN
    FOR i IN REVERSE 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' ||i ||'='
                                ||vn_base_num*i);
    END LOOP;
END;

--IF문/CONTINUE

DECLARE
    vn_base_num         NUMBER:=3;
BEGIN
    FOR i IN 1..9
    LOOP
        CONTINUE WHEN i=5;
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' ||i ||'='
                                ||vn_base_num*i);
    END LOOP;
END;

--GOTO문

DECLARE
    vn_base_num         NUMBER:=3;
BEGIN
    <<third>>
    FOR i IN 1..9
    LOOP
        IF i=1 THEN
            DBMS_OUTPUT.PUT_LINE (vn_base_num||' 단');
            DBMS_OUTPUT.PUT_LINE ('==============');
        END IF;
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' ||i ||'='
                                ||vn_base_num*i);
        IF i = 9 THEN
            GOTO fourth;
        END IF;
    END LOOP;
    <<fourth>>
    vn_base_num := vn_base_num + 1;
    FOR i IN 1..9
    LOOP
        IF i=1 THEN
            DBMS_OUTPUT.PUT_LINE (vn_base_num||' 단');
            DBMS_OUTPUT.PUT_LINE ('==============');
        END IF;
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' ||i ||'='
                                ||vn_base_num*i);
        IF i = 9 THEN
            GOTO fourth;
        END IF;
        IF vn_base_num =9 THEN
            GOTO finnal;
        END IF;
    END LOOP;
    <<finnal>>
    DBMS_OUTPUT.PUT_LINE ('==============');
    DBMS_OUTPUT.PUT_LINE ('끝');
END;

--NULL문
IF vn_variable = 'A' THEN
    DBMS_OUTPUT.PUT_LINE ('A');
ELSIF vn_variable = 'B' THEN
    DBMS_OUTPUT.PUT_LINE ('B');

ELSE NULL;
END IF;

CASE  WHEN vn_variable = 'A' THEN
            DBMS_OUTPUT.PUT_LINE ('A');
      WHEN vn_variable = 'B' THEN
            DBMS_OUTPUT.PUT_LINE ('B');

      ELSE NULL;
END CASE;