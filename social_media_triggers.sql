DELIMITER $$
CREATE TRIGGER before_insert
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    SET NEW.email = LOWER(NEW.email);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    SET @new_user_count = IFNULL(@new_user_count, 0) + 1;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    SET NEW.email = LOWER(NEW.email);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER after_update
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
    SET @updated_user_count = IFNULL(@updated_user_count, 0) + 1;
END$$
DELIMITER ;
