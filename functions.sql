SET GLOBAL log_bin_trust_function_creators = 1;

-- 1. Для таблиці Співробітники написати функцію як буде шукати
-- AVG стовпця Трудовий стаж . Потім зробити вибірку даних
-- (SELECT) менших за середнє значення, використовуючи дану
-- функцію.

DROP FUNCTION IF EXISTS get_average_experience;
DELIMITER //
CREATE FUNCTION get_average_experience()
RETURNS DECIMAL(10,1) 
BEGIN
return(SELECT AVG(experience) FROM employee);
END //	
DELIMITER ;

SELECT * from employee where experience > get_average_experience();

-- 2. Написати функцію, яка витягує за ключем між таблицями
-- Вулиця та Аптечна установа значення поля Назва вулиці. Потім
-- зробити вибірку усіх даних (SELECT) з таблиці Аптечна
-- установа, використовуючи дану функцію.

DROP FUNCTION IF EXISTS get_street_name;
DELIMITER //	
CREATE FUNCTION get_street_name(
street_id INT
)
RETURNS VARCHAR(25)
BEGIN	
RETURN(
	select name from street where id =(select street_id from pharmacy where id = street_id)
);
END //
DELIMITER ;

SELECT *, get_street_name(id) from pharmacy;

