DECLARE
   vn_base_num NUMBER := 3;
BEGIN   
   FOR i IN REVERSE 9..1
   LOOP
      DBMS_OUTPUT.PUT_LINE (vn_base_num || '*' || i || '= ' || vn_base_num * i);      
   END LOOP;    
END;

CREATE OR REPLACE PROCEDURE my_new_job_proc
(   p_job_id    IN  JOBS.JOB_ID%TYPE,
    p_job_title IN  JOBS.JOB_TITLE%TYPE,
    p_min_sal   IN  JOBS.MIN_SALARY%TYPE := 10,
    p_max_sal   IN  JOBS.MAX_SALARY%TYPE := 100
    --p_upd_date    OUT JOBS.UPDATE_DATE%TYPE
    )
    
IS
    vn_cnt NUMBER := 0;
    vn_cnr_date JOBS.UPDATE_DATE%TYPE := SYSDATE;

BEGIN
    -- 1000 보다 작으면 메시지 출력 후 빠져 나간다
    IF  p_min_sal <1000 THEN
        DBMS_OUTPUT.PUT_LINE('출소 급여값은 1000 이상이어야 합니다.');
        return;
    END IF;
    
    SELECT COUNT(*)
    INTO    vn_cnt
    FROM    JOBS
    WHERE   job_id = p_job_id;
END;

EXEC my_new_job_proc ('SM_JOB1', 'Sample JOB1', 999, 6000);


DECLARE
    vs_emp_name VARCHAR2(80);
BEGIN
    vs_emp_name := 'soju';
    
    UPDATE  employees
    SET     emp_name = vs_emp_name
    WHERE   employee_id = 100;
    
    SELECT  emp_name
    into    vs_emp_name
    FROM    employees
    WHERE   employee_id = 100;
    
    DBMS_OUTPUT.PUT_LINE(vs_emp_name);
END;
/