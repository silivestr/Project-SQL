CREATE TABLE public.positions (
    ID SERIAL PRIMARY KEY, 
    positions TEXT NOT NULL, 
    rank INTEGER NOT NULL CHECK (rank > 0) 
);


CREATE TABLE public.departments (
    ID SERIAL PRIMARY KEY, 
    departments_name TEXT NOT NULL UNIQUE, 
    relevance BOOLEAN NOT NULL, 
    Parent_id INTEGER REFERENCES public.departments(ID), 
    department_organization DATE NOT NULL 
);


CREATE TABLE public.salaries (
    ID SERIAL PRIMARY KEY, 
    meaning DECIMAL(10, 2) NOT NULL CHECK (meaning > 0) 
);


CREATE TABLE public.employees (
    ID SERIAL PRIMARY KEY, 
    full_name TEXT NOT NULL, 
    birth_date DATE NOT NULL, 
    position_id INTEGER NOT NULL REFERENCES public.positions(ID), 
    salary_id INTEGER NOT NULL REFERENCES public.salaries(ID), 
    department_id INTEGER NOT NULL REFERENCES public.departments(ID), 
    hire_date DATE NOT NULL,  
    status BOOLEAN NOT NULL, 
    last_updated DATE, 
    supervisor_id INTEGER REFERENCES public.employees(ID) 
);




