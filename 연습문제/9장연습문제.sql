DECLARE
vn_base_num NUMBER := 3;
BEGIN
    FOR i IN REVERSE 9..1
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '=' || vn_base_num * i);
        
    END LOOP;
        
END;

--결과: 출력 X
--이유: 9부터 1까지 감소하며 진행하는데 최종값이1이고 초기값이9라 루프가 동작 X
--수정

DECLARE
vn_base_num NUMBER := 3;
BEGIN
    FOR i IN 1..9
    LOOP
        DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '=' || vn_base_num * i);
        
    END LOOP;
        
END;

CREATE OR REPLACE FUNCTION my_initcap (ps_string VARCHAR2)
RETURN VARCHAR2
IS
    vn_temp VARCHAR2(100) := ps_string;
    vn_blank NUMBER := 1;
    vn_return VARCHAR2(80);
    vn_len NUMBER;
BEGIN
    WHILE vn_blank = 0
    LOOP
    
        vn_return := INSTR(vn_temp,' ');
    
        IF  vn_blank =  0 THEN
            vn_return := vn_return || UPPER(SUBSTR(vn_temp, 1, 1)) || SUBSTR(vn_temp, 2, vn_len -1);
        ELSE
            vn_return := vn_return ||UPPER(SUBSTR(vn_temp, 1, 1)) || SUBSTR(vn_temp, 2, vn_blank -2) || ' ';
        END IF;
        vn_len := LENGTH(vn_temp);
        vn_temp := SUBSTR(vn_temp, vn_blank+1, vn_len - vn_blank);

    END LOOP;

    RETURN vn_return;
    COMMIT;
END;

SELECT my_initcap ('super')
FROM DUAL;