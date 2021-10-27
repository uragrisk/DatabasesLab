-- 1. БД «Аеропорт». Знайдіть номери всіх рейсів, що бувають у місті 
-- 'London'. Вивести: trip_no, town_from, town_to. Вихідні дані впорядкувати за зростанням за стовпцем time_out.

SELECT trip_no, town_from, town_to FROM trip
WHERE town_from = 'London' OR town_to = 'London'
ORDER BY time_out;


-- 2. БД «Аеропорт». З таблиці Pass_in_trip вивести дати, коли були зайняті місця 'c' у будь-якому ряді.

SELECT date, place FROM pass_in_trip
WHERE place RLIKE '[0-9]c';

-- 3. БД «Комп. фірма». Вкажіть виробника для тих ПК, що мають 
-- жорсткий диск об’ємом не більше 8 Гбайт. Вивести: maker, type, speed, hd.

SELECT maker, type, speed, hd FROM product JOIN pc ON product.model = pc.model
WHERE hd <= 8;

-- 4. БД «Комп. фірма». Знайдіть виробників, що випускають ПК, але не 
-- ноутбуки (використати ключове слово ALL). Вивести maker.

SELECT distinct maker FROM product
WHERE type = 'pc' AND maker != ALL(SELECT maker FROM product WHERE type = 'Laptop');

-- 5. БД «Кораблі». Знайдіть класи кораблів, у яких хоча б один корабель 
-- був затоплений у битвах. Вивести: class. (Назви класів кораблів визначати за таблицею Ships, якщо його там немає, тоді порівнювати чи 
-- його назва не співпадає з назвою класу, тобто він є головним)

SELECT class FROM outcomes JOIN ships ON outcomes.ship = ships.name
WHERE result = 'sunk'
UNION
SELECT class FROM outcomes JOIN classes ON outcomes.ship = classes.class
WHERE result = 'sunk';

-- 6. БД «Комп. фірма». Для таблиці PC вивести всю інформацію з 
-- коментарями в кожній комірці, наприклад, 'модель: 1121', 'ціна: 600,00' і т.д.

SELECT CONCAT('код:  ', code) AS code, 
CONCAT('модель:  ', model) AS model, 
CONCAT('швидкість:  ', speed) AS speed,
CONCAT('об’єм пам’яті:  ', ram) AS ram,
CONCAT('розмір диску:  ', hd) AS hd,
CONCAT('швидкість CD-приводу:  ', cd) AS cd,
CONCAT('ціна:  ', price) AS price
FROM pc; 

-- 7. БД «Комп. фірма». Знайдіть виробників найдешевших кольорових 
-- принтерів. Вивести: maker, price.

SELECT maker, price FROM product JOIN printer ON product.model = printer.model
WHERE color = 'y' and price in (SELECT MIN(price) FROM PRINTER WHERE color = 'y');

-- 8. БД «Комп. фірма». Для таблиці Product отримати підсумковий набір 
-- у вигляді таблиці зі стовпцями maker, pc, laptop та printer, у якій для 
-- кожного виробника необхідно вказати кількість продукції, що ним 
-- випускається, тобто наявну загальну кількість продукції в таблицях, 
-- відповідно, PC, Laptop та Printer. (Підказка: використовувати підзапити в якості обчислювальних стовпців)

SELECT Product.maker, COUNT(pc_data.model) AS PC, COUNT(laptop_data.model) AS Laptop, COUNT(printer_data.model) AS Printer 
FROM Product
LEFT JOIN (SELECT maker,PC.model FROM PC JOIN Product ON PC.model=Product.model) AS pc_data 
ON Product.model=pc_data.model
LEFT JOIN (SELECT maker,Laptop.model FROM Laptop JOIN Product ON Laptop.model=Product.model) AS laptop_data 
ON Product.model=laptop_data.model
LEFT JOIN (SELECT maker,Printer.model FROM Printer JOIN Product ON Printer.model=Product.model) AS printer_data 
ON Product.model=printer_data.model
GROUP BY maker 
ORDER BY 1;

-- 9. БД «Фірма прий. вторсировини». Приймаючи, що прихід та розхід 
-- грошей на кожному пункті прийому може фіксуватися довільне число 
-- раз на день (лише таблиці Income та Outcome), написати запит із такими вихідними даними: 
-- point (пункт), date (дата), inc (прихід), out (розхід), у якому в кожному пункті за кожну дату відповідає лише одна 
-- стрічка. (Підказка: використовувати зовнішнє з’єднання та оператор CASE)

SELECT income.point, income.date,  income.inc, outcome.out FROM income JOIN outcome ON income.point = outcome.point;

-- 10. БД «Кораблі». Знайдіть назви всіх кораблів із БД, про які можна 
-- однозначно сказати, що вони були спущені на воду до 1942 р. Вивести: назву кораблів. (Підказка: використовувати оператор UNION )

SELECT name FROM Ships WHERE launched < 1942
UNION
SELECT ship FROM Outcomes JOIN Battles WHERE DATE_FORMAT(date, '%Y') < 1942;











