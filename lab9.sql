CREATE LOGIN Bill WITH PASSWORD='passwd123';

USE lab9;
GO
CREATE USER Bill FOR LOGIN Bill;
CREATE ROLE Auditors;
GO
EXECUTE sp_addrolemember "Auditors", "Bill";

USE lab9;
GO
GRANT EXEC ON TakeMoneyOpr TO Bill;

                      /***/
CREATE LOGIN John WITH PASSWORD='passwd123';
GO
USE lab9;
GO
CREATE USER John FOR LOGIN John;
GO
EXECUTE sp_addrolemember db_securityadmin, "John";
GO
GRANT EXEC ON TakeMoneyOpr TO John;
GO
select PERMISSIONS();  
GO
REVOKE EXECUTE ON TakeMoneyOpr TO John;
Go
REVOKE ALL
ON dbo.loans TO John


                 /***/

-- Створення мастер-ключа бази даних lab9
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'pass123';
GO

-- Створення сертифікату
CREATE CERTIFICATE lab_certificate
WITH SUBJECT = 'Protect Data';
GO

-- Створення симетричного ключа
CREATE SYMMETRIC KEY Skey1
 WITH ALGORITHM = AES_128 
 ENCRYPTION BY CERTIFICATE lab_certificate;
GO

-- Зміна схеми даних
ALTER TABLE Customers
ADD LastName_encrypt varbinary(MAX) NULL
GO

-- Шифрування колонки таблиці
-- Opens the symmetric key for use
OPEN SYMMETRIC KEY Skey1
DECRYPTION BY CERTIFICATE lab_certificate;
GO
UPDATE Customers
SET LastName_encrypt = EncryptByKey(Key_GUID('Skey1'), lastName)
FROM dbo.Customers;
GO
-- Closes the symmetric key
CLOSE SYMMETRIC KEY Skey1;
GO
select * from Customers
GO
OPEN SYMMETRIC KEY Skey1
DECRYPTION BY CERTIFICATE lab_certificate;
GO
-- Читання розшифрованих даних 
SELECT 
IDCode, LastName_encrypt AS 'Encrypted last name',
CONVERT(varchar, DecryptByKey(LastName_encrypt)) 
AS 'Decrypted last name'
FROM dbo.Customers;
 
CLOSE SYMMETRIC KEY Skey1;
GO

use lab9
GO
OPEN SYMMETRIC KEY Skey1
DECRYPTION BY CERTIFICATE lab_certificate;
INSERT INTO dbo.Customers(IDCode, firstName, lastName, midName, email, telephone, LastName_encrypt)
VALUES ('3698521478', 'Dude', 'Dodonko', 'Donkevich', 'smth@hy.io', '0654872536', 
                                                         EncryptByKey(Key_GUID('Skey1'), CONVERT(varchar, 'Donkevich')));     
GO




