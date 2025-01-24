INSERT INTO public.positions (positions, rank)
VALUES 
    ('Стажёр', 4),
    ('Младший разработчик', 3),
    ('Разработчик', 2),
    ('Старший разработчик', 1);


INSERT INTO public.departments
(departments_name, relevance, Parent_id, department_organization)
VALUES 
    ('ДКС', TRUE, NULL, '2017-01-01'),
    ('ДСИ', TRUE, NULL, '2017-10-21'),
    ('Треолан', TRUE, NULL, '2018-06-17'),
    ('ПТУ', FALSE, NULL, '2018-09-01');


INSERT INTO public.salaries (meaning) 
VALUES 
(30000.00), 
(50000.00), 
(70000.00), 
(100000.00); 


INSERT INTO public.employees 
(full_name, birth_date, position_id, salary_id, department_id, hire_date, status, last_updated, supervisor_id)
VALUES
    ('Алексеев Сергей', '1996-01-26', 1, 1, 1, '2023-01-10', TRUE, CURRENT_DATE, NULL), 
    ('Иван Иванов', '1998-02-15', 1, 1, 1, '2023-01-10', TRUE, CURRENT_DATE, NULL), 
    ('Пётр Петров', '1992-05-10', 2, 2, 2, '2022-05-01', TRUE, CURRENT_DATE, 1),   
    ('Сергей Сергеев', '1985-09-25', 3, 3, 3, '2020-11-15', TRUE, CURRENT_DATE, NULL), 
    ('Алексей Алексеев', '1980-12-30', 4, 4, 4, '2018-03-20', TRUE, CURRENT_DATE, 3);