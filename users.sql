/*DROP USER 'sadmin'@'localhost';
DROP USER 'maintenance_engineer'@'localhost';
DROP USER 'maintenance_engineer'@'%';
DROP USER 'store_clerk'@'%';
DROP USER 'client'@'%';
*/

CREATE USER 'sadmin'@'localhost' IDENTIFIED BY 'superpass';
GRANT ALL PRIVILEGES ON selfcheckoutdb.* TO 'sadmin'@'localhost';

CREATE USER 'maintenance_engineer'@'localhost' IDENTIFIED BY 'maintpass';
CREATE USER 'maintenance_engineer'@'%' IDENTIFIED BY 'maintpass';
GRANT SELECT ON selfcheckoutdb.* TO 'maintenance_engineer'@'%';
GRANT SELECT ON selfcheckoutdb.* TO 'maintenance_engineer'@'localhost';

CREATE USER 'store_clerk'@'%' IDENTIFIED BY 'clerkpass';
GRANT SELECT ON selfcheckoutdb.product TO 'store_clerk'@'%';
GRANT SELECT ON selfcheckoutdb.customer TO 'store_clerk'@'%';
GRANT SELECT ON selfcheckoutdb.discount_code TO 'store_clerk'@'%';
GRANT SELECT ON selfcheckoutdb.cart TO 'store_clerk'@'%';
GRANT SELECT,UPDATE ON selfcheckoutdb.terminal TO 'store_clerk'@'%';

CREATE USER 'client'@'%' IDENTIFIED BY 'clientpass';
GRANT SELECT ON selfcheckoutdb.product TO 'client'@'%';
