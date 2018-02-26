USE master;
GO
SELECT *
FROM sys.symmetric_keys
WHERE name = '##MS_ServiceMasterKey##';
GO


USE test;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password123';
GO


USE test;
GO
CREATE CERTIFICATE Certificate1
WITH SUBJECT = 'Protect Data';
GO


USE test;
GO
CREATE SYMMETRIC KEY SymmetricKey1 
 WITH ALGORITHM = AES_128 
 ENCRYPTION BY CERTIFICATE Certificate1;
GO



USE test;
GO
ALTER TABLE Owners
ADD Secret_location_number_encrypt varbinary(MAX) NULL
GO


USE test;
GO
-- Opens the symmetric key for use
OPEN SYMMETRIC KEY SymmetricKey1
DECRYPTION BY CERTIFICATE Certificate1;
GO
UPDATE Owners
SET Secret_location_number_encrypt = EncryptByKey (Key_GUID('SymmetricKey1'),Secret_location_number_encrypt)
FROM dbo.Owners;
GO
-- Closes the symmetric key
CLOSE SYMMETRIC KEY SymmetricKey1;
GO


USE test;
GO
OPEN SYMMETRIC KEY SymmetricKey1
DECRYPTION BY CERTIFICATE Certificate1;
INSERT INTO dbo.Owners(ID, PersonalInfo, Address, Phone, Secret_location_number_encrypt)
VALUES (12, 'Gena Ivanov', 'Lviv', '380287887316', EncryptByKey(Key_GUID('SymmetricKey1'), CONVERT(varchar,'4545-58478-1245')));     
GO

select * from Owners