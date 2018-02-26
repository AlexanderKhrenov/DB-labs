use LoanAccounting

select P.loanID, P.income
from Payments P
where P.PaymentDate !> (select endDate 
                        from loans
						where ID=P.loanID)

select * from Payments


USE LoanAccounting 
GO 
CREATE PROC TakeMoneyOpr 
@loanID bigint='0000000000',
@souls money=0
AS 
IF @loanID='0000000000'
   PRINT '�� ������ ����������� ������� ��� ������� ��� ������������� �������!'
ELSE
IF EXISTS(select * from loans where ID=@loanID)
   BEGIN
        IF @souls!>0 
           PRINT '����� ������� ������ ���� �������������!'
    	ELSE
		    BEGIN
		         insert into Payments(loanID, income) values (@loanID, @souls);
			     PRINT '������ � ������� ������� ������� � ����.';
			END
   END 
ELSE
PRINT '�� ������ ����������� ������� ���������� ��� ������� ��� ������������� �������!'
    
EXEC TakeMoneyOpr
EXEC TakeMoneyOpr '1000000059'
EXEC TakeMoneyOpr '1000000000'
EXEC TakeMoneyOpr '1000000013', 100.50
select * from Payments



GO 
CREATE PROC selectPayOpr 
@loanID bigint='0000000000'
AS
IF @loanID='0000000000'
   PRINT '�� ������ ����������� ������� ��� ������� ��� ����������� ��������!'
ELSE
IF EXISTS(select * from Payments where loanID=@loanID)
   select PaymentDate, income from Payments where loanID=@loanID
ELSE
PRINT '�������� �� ���������� ������� �� ����������, ���� ������ ������������ ��� �������.'

EXEC selectPayOpr
EXEC selectPayOpr '1000000059'
EXEC selectPayOpr '1000000000'








USE Realty 
GO 
CREATE PROC RealestateOperation 
@IDRealestate decimal (9,0)OUTPUT 
AS 
IF EXISTS(Select * from Realestate 
WHERE ID=@IDRealestate) 
IF EXISTS(Select * from PurchaseAndRental 
WHERE ID_Realestate=@IDRealestate) 
SELECT ID_Realestate, Property, C.Address, Status, Date, Cost, PersonalInfo, Phone, Payment, TypeOfOperation 
FROM PurchaseAndRental inner join Realestate C on C.ID=ID_Realestate inner join Owners D on D.ID=NewOwner_ID 
WHERE ID_Realestate=@IDRealestate 
ELSE 
PRINT '�������� ��� ������������� �� �������' 
ELSE 
PRINT '������������ �� �������'