-- 1. Забезпечити цілісність значень для структури БД.

-- POST
drop trigger if exists post_update;

DELIMITER //
CREATE TRIGGER post_update 
BEFORE UPDATE
on post
for EACH ROW
BEGIN 
IF (new.id != old.id and old in (select id from post )) then 
SIGNAL SQLSTATE '45000'
set MESSAGE_TEXT = 'no such data found';
end if;
end // 
DELIMITER ;

drop trigger if exists post_delete;
DELIMITER //
CREATE TRIGGER post_delete
before DELETE 
on post 
for EACH ROW
BEGIN 
if (old.id in (select post_id from employee)) then 
signal sqlstate '45000'
 set message_text = 'there is at least one person with such data, you cannot delete it';
end if;
end //
 DELIMITER ;
 
 
-- EFFECT ZONE 


drop trigger if exists effect_zone_update;
DELIMITER //
CREATE TRIGGER effect_zone_update
before update
on effect_zone 
for each row 
BEGIN 
IF (new.id != old.id and old in (select id from effect_zone )) then 
SIGNAL SQLSTATE '45000'
set MESSAGE_TEXT = 'no such data found';
end if;
end // 
DELIMITER ;

drop trigger if exists effect_zone_delete;
DELIMITER //
CREATE TRIGGER effect_zone_delete
before  DELETE 
on effect_zone
for each row 
BEGIN 
if (old.id in (select zone_id from medicine_zone)) then 
signal sqlstate '45000'
 set message_text = 'there is at least one person with such data, you cannot delete it';
end if;
end //	
 DELIMITER ;

-- STREET
drop trigger if exists street_update;
DELIMITER //
CREATE TRIGGER  street_update
before update
on street 
for each row 
BEGIN 
IF (new.id != old.id and old in (select id from street )) then 
SIGNAL SQLSTATE '45000'
set MESSAGE_TEXT = 'no such data found';
end if;
end // 
DELIMITER ;

drop trigger if exists street_delete;
DELIMITER //
CREATE TRIGGER  street_delete
before  DELETE 
on street
for each row 
BEGIN 
if (old.id in (select street_id from pharmacy)) then 
signal sqlstate '45000'
 set message_text = 'there is at least one person with such data, you cannot delete it';
end if;
end //	
 DELIMITER ;
 
	
-- MEDICINE LIST
drop trigger if exists  medicine_update;
DELIMITER //
CREATE TRIGGER medicine_update
 before update
on medicine_list
for each row 
BEGIN 
IF (new.id != old.id and old in (select id from medicine_list ))  then 
SIGNAL SQLSTATE '45000'
set MESSAGE_TEXT = 'no such data found';
end if;


end // 
DELIMITER ;


drop trigger if exists medicine_delete;
DELIMITER //
CREATE TRIGGER  medicine_delete
before  DELETE 
on medicine_list
for each row 
BEGIN 
if (old.id in (select medicine_id from medicine_zone )) then 
signal sqlstate '45000'
 set message_text = 'there is at least one person with such data, you cannot delete it';
end if;
if (old.id in (select medicine_id from pharmacy_has_medicine )) then 
signal sqlstate '45000'
 set message_text = 'there is at least one person with such data, you cannot delete it';
end if;
end //	
 DELIMITER ;
 
 
-- Employee
drop trigger if exists employee_insert;

DELIMITER // 
create trigger 	employee_insert
before insert
on employee
for each row
begin
	    if (new.post_id not in (select id from post)) then
			signal sqlstate '45000'
			set message_text = 'FK error. no such data found';
        end if;
        if (new.pharmacy_id not in (select id from pharmacy)) then
			signal sqlstate '45000'
			set message_text = 'FK error. no such data found';
        end if;
	end//
DELIMITER ;

drop trigger if exists employee_update;

DELIMITER // 
create trigger employee_update
before update
on employee
for each row 
begin
    if (new.id != old.id and old in (select id from employee)) then
		signal sqlstate '45000'
        set message_text = 'no such data found';
	end if;
end//
DELIMITER ;


-- Pharmacy 

drop trigger if exists pharmacy_insert;

DELIMITER // 
create trigger 	pharmacy_insert
before insert
on pharmacy
for each row
begin
	    if (new.street_id not in (select id from street)) then
			signal sqlstate '45000'
			set message_text = 'FK error. no such data found';
        end if;
        
	end//
DELIMITER ;
drop trigger if exists pharmacy_update;
DELIMITER // 
create trigger pharmacy_update
before update
on pharmacy
for each row 
begin
    if (new.id != old.id and old in (select id from pharmacy)) then
		signal sqlstate '45000'
        set message_text = 'no such data found';
	end if;
end//
DELIMITER ;

drop trigger if exists pharmacy_delete;
DELIMITER //
CREATE TRIGGER  pharmacy_delete
before  DELETE 
on pharmacy
for each row 
BEGIN 
if (old.id in (select pharmacy_id from pharmacy_has_medicine )) then 
signal sqlstate '45000'
 set message_text = 'there is at least one person with such data, you cannot delete it';
end if;
end //	
 DELIMITER ;

-- Medicine ZONE

drop trigger if exists medicine_zone_insert;
DELIMITER //
CREATE TRIGGER  medicine_zone_insert
before INSERT on medicine_zone 
for each row 
begin
	if (new.medicine_id not in (select id from medicine_list)) then
		signal sqlstate '45000'
        set message_text = 'FK error. no such data found';
	end if;
    if (new.zone_id not in (select id from medicine_zone)) then
		signal sqlstate '45000'
        set message_text = 'FK error. no such data found';
	end if;
end
// DELIMITER ;

drop trigger if exists medicine_zone_update;
DELIMITER //
CREATE TRIGGER  medicine_zone_update
before UPDATE on medicine_zone 
for each row 
begin
if (new.medicine_id != old.medicine_id and old.medicine_id in (select medicine_id from medicine_list)) then
		signal sqlstate '45000'
        set message_text = 'no such link in the linking table';
	end if;
    if (new.zone_id != old.zone_id and old.zone_id in (select zone_id from medicine_zone)) then
		signal sqlstate '45000'
        set message_text = 'no such link in the linking table';
	end if;
    
end
// DELIMITER ;


-- pharmacy has medicine

drop trigger if exists pharmacy_has_medicine_insert;
DELIMITER //
CREATE TRIGGER  pharmacy_has_medicine_insert
before INSERT on pharmaсy_has_medicine
for each row 
begin
	if (new.medicine_id not in (select id from medicine_list)) then
		signal sqlstate '45000'
        set message_text = 'FK error. no such data found';
	end if;
    if (new.pharmacy_id not in (select id from pharmacy)) then
		signal sqlstate '45000'
        set message_text = 'FK error. no such data found';
	end if;
end
// DELIMITER ;

drop trigger if exists pharmacy_has_medicine_update;
DELIMITER //
CREATE TRIGGER  pharmacy_has_medicine_update
before UPDATE on pharmaсy_has_medicine 
for each row 
begin
if (new.pharmacy_id != old.pharmacy_id and old.pharmacy_id in (select pharmacy_id from pharmacy_has_medicine )) then
		signal sqlstate '45000'
        set message_text = 'no such link in the linking table';
	end if;
    if (new.medicine_id != old.medicine_id and old.medicine_id in (select pharmacy_id from pharmacy_has_medicine )) then
		signal sqlstate '45000'
        set message_text = 'no such link in the linking table';
	end if;
end
// DELIMITER ;


-- 2. для Співробітники→Серія та номер паспорту забезпечити
-- формат вводу: 2 довільні букви + 2 пробіли + 6 цифр ;

DROP TRIGGER IF EXISTS paspor_insert;

DELIMITER // 
create trigger 	paspor_insert
before insert
on employee
for each row
begin
	    if (new.passport_data not rlike '[A-Z]{2}-\s{2}-[0-9]{6}') then
			signal sqlstate '45000'
            set message_text = 'Passport number doesn\'t match regex';
        end if;
-- 3. у полі Співробітники →Ім’я допускається ввід лише таких
-- імен: 'Галина', 'Олександр', 'Андріян' та 'Ілона'.
        if (new.name not in ('Галина', 'Олександр', 'Андріян', 'Ілона')) then
        signal sqlstate '45000'
            set message_text = 'Wrong name';
    end if;
	end//
DELIMITER ;




-- 4. При вставці значень у таблицю Аптечна установа автоматично
-- доповнювати стовпець Назва значенням автоінкрементного
-- стовпця.

drop trigger if exists pharmacy_insert_auto;

DELIMITER //
create trigger 	pharmacy_insert_auto
    before insert
    on pharmacy
    for each row
begin
	SET new.name = CONCAT(cast(LAST_INSERT_ID() + 1 as char), " ", new.name);
end//
DELIMITER ;








