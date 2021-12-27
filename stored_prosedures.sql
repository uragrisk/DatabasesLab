-- 1. Забезпечити параметризовану вставку нових значень у
-- таблицю Аптечна установа.
DROP PROCEDURE IF EXISTS insert_into_pharmacy;
DELIMITER //
CREATE PROCEDURE insert_into_pharmacy(
name VARCHAR (45),
 building_number INT,
  web_adress VARCHAR(45),
   work_time_open TIME,
   work_time_close TIME,
   is_open_saturday TINYINT,
   is_open_sunday TINYINT
)
BEGIN
INSERT INTO pharmacy(name, building_number,web_adress,work_time_open,work_time_close,is_open_saturday,is_open_sunday )
VALUES(name, building_number,web_adress,work_time_open,work_time_close,is_open_saturday,is_open_sunday )
;
END //
DELIMITER ;

-- 2. Створити пакет, який вставляє 10 стрічок в таблицю Зона
-- впливу у форматі < Noname+No> , наприклад: Noname5,
-- Noname6, Noname7 і т.д.
DROP PROCEDURE IF EXISTS insert_into_effect_zone;
DELIMITER //
CREATE PROCEDURE insert_into_effect_zone()
BEGIN
DECLARE str VARCHAR(45);
	DECLARE counter int;
	SET counter=0, str='NoName';
WHILE counter<10 DO
	SET counter = counter+1;
		INSERT INTO effect_zone(name) VALUES(concat(str,counter));
END WHILE;
END //
DELIMITER ;

-- 3. Використовуючи курсор, забезпечити динамічне створення БД
-- з іменами Співробітників, з випадковою кількістю таблиць для
-- кожної БД (від 1 до 9). Структура таблиць довільна. Імена
-- таблиць відповідають імені Співробітника з порядковим
-- номером від 1 до 9.

DELIMITER //
DROP PROCEDURE IF EXISTS create_tables;
CREATE PROCEDURE create_tables()
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE name VARCHAR(45);
  DECLARE posts CURSOR FOR
  SELECT post.name FROM post;
  DECLARE CONTINUE HANDLER FOR NOT FOUND
  SET done = TRUE;
  OPEN posts;
  posts_loop: LOOP
   FETCH posts INTO name;
   IF done = TRUE THEN LEAVE posts_loop;
   END IF;
   SET @table_count = 1;
   while_loop: WHILE @table_count < 5 DO
    SET @new_table = CONCAT('CREATE TABLE IF NOT EXISTS ', name, '(id INT, name VARCHAR(45));');
    SELECT @new_table;
    PREPARE myquery FROM @new_table;
    EXECUTE myquery;
    SET @table_count = @table_count + 1;
   END WHILE;
  END LOOP;
  CLOSE posts;
END ;
//