CREATE OR REPLACE FUNCTION public.fire_employee(employee_id INTEGER) 
RETURNS VOID AS $$ 
BEGIN 
    UPDATE public.employees 
    SET 
        status = FALSE, 
        last_updated = CURRENT_DATE 
    WHERE 
        ID = employee_id; 
END; 
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION public.hire_employee(
full_name TEXT, 
birth_date DATE, 
position_id INTEGER, 
salary_id INTEGER, 
department_id INTEGER, 
hire_date DATE, 
supervisor_id INTEGER 
) 
RETURNS VOID AS $$ 
BEGIN 
    INSERT INTO public.employees (full_name, birth_date, position_id, salary_id, department_id, hire_date, status, last_updated, supervisor_id ) 
    VALUES ( full_name, birth_date, position_id, salary_id, department_id, hire_date, TRUE, CURRENT_DATE, supervisor_id ); 
END; 
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION public.rename_department(department_id INTEGER, new_name TEXT) 
RETURNS VOID AS $$ 
BEGIN 
    UPDATE public.departments 
    SET departments_name = new_name 
    WHERE ID = department_id; 
END; 
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION public.change_department_head(dept_id INTEGER, new_supervisor_id INTEGER)  
RETURNS VOID AS $$ 
BEGIN 
    UPDATE public.employees  
    SET supervisor_id = new_supervisor_id 
    WHERE department_id = dept_id; 
END; 
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION public.promote_employee(employee_id INTEGER) 
RETURNS VOID AS $$ 
DECLARE 
    current_rank INTEGER; 
    new_position_id INTEGER; 
BEGIN 
    SELECT p.rank INTO current_rank 
    FROM public.employees e 
    JOIN public.positions p ON e.position_id = p.ID 
    WHERE e.ID = employee_id; 

    SELECT ID INTO new_position_id 
    FROM public.positions 
    WHERE rank = current_rank - 1; 

    IF new_position_id IS NOT NULL THEN 

        UPDATE public.employees 
        SET 
            position_id = new_position_id, 
            last_updated = CURRENT_DATE 
        WHERE 
            ID = employee_id; 
    ELSE 
        RAISE NOTICE 'Нет доступной должности для повышения.'; 
    END IF; 
END; 
$$ LANGUAGE plpgsql;



