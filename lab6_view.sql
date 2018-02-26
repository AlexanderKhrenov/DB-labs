use LoanAccounting

drop view CurrentDebts
create view CurrentDebts
as
select ID[��� ������], 
       CustomerID[��� �볺���], 
       
	   /*()[������� �����],*/
	   
	   lastName[�������],
       (moneyAmount+interestAmount+moneyAmount*interestRate/100 - sum(income))[���������� ���������]
from (Customers C inner join loans L on C.IDCode = L.CustomerID inner join Payments P on L.ID = P.loanID)
group by ID, CustomerID, lastName, moneyAmount, interestAmount, interestRate

select * from CurrentDebts



select P1.loanID, P1.PaymentDate 
from loans L1, Payments P1
group by P1.loanID, P1.PaymentDate
having P1.PaymentDate = (select max(PaymentDate) from Payments where loanID = P1.loanID)/* by loanID)*/
		

select PaymentDate from
(select loanID, max(PaymentDate) from Payments group by loanID)

;
 select loanID, max(PaymentDate) from Payments where loanID = '000000001' group by loanID 

 
SELECT Pm1.PaymentDate, Pm1.loanID, COUNT(*) num
FROM Payments Pm1 JOIN Payments Pm2
	ON Pm1.loanID = Pm2.loanID AND Pm1.PaymentDate >= Pm2.PaymentDate
GROUP BY Pm1.loanID, Pm1.PaymentDate
HAVING COUNT (*) <= 1
ORDER BY loanID, PaymentDate
;


   select (select max(PaymentDate) from Payments where Payments.loanID = Pm1.loanID) PaymentDate, Pm1.loanID
	    
              FROM Payments Pm1 JOIN Payments Pm2
	          ON Pm1.loanID = Pm2.loanID AND Pm1.PaymentDate >= Pm2.PaymentDate
              GROUP BY Pm1.loanID, Pm1.PaymentDate
              HAVING COUNT (*) <= 1
              ORDER BY loanID, PaymentDate



select loanID, max(PaymentDate) from Payments group by loanID
/*���������������������������������������������������������������������������������
��������������������4����������������������������������������������������������
����
��������������������������������������������������������������������������*/


create view AvgAmount
as
select AVG(moneyAmount) [������� ������ �������] from loans

select * from AvgAmount

/*-----------------------------------------------------------*/

create view OverdueDebtors
as
select distinct IDCode[��� �������], lastName[�������], firstName[���], midName[��������], 
sum(income)[����� ������], (moneyAmount+interestAmount+moneyAmount*interestRate/100) [����� � ������]
from Customers C inner join loans L on C.IDCode = L.CustomerID inner join Payments P on L.ID = P.loanID
where endDate<getdate()
group by IDCode,lastName,firstName,midName,moneyAmount,interestAmount,interestRate
having (sum(income)<(moneyAmount+interestAmount+moneyAmount*interestRate/100))

select * from OverdueDebtors

/*------------------------------------------------------------*/

create view noRichCustomer
as
select TOP 1 IDCode[��� �������], lastName[�������], firstName[���], midName[��������],
MAX(moneyAmount)[����� �������] from Customers, loans
where Customers.IDCode = loans.CustomerID 
group by IDCode, lastName, firstName, midName, moneyAmount
Order by MAX(moneyAmount) DESC

select * from noRichCustomer

































/*��� �������: ����������� �������������*/
--drop view Loans_info
create view Loans_info
as
select ID[����� �������], moneyAmount[����� �����], endDate[���� �������� ������]
from loans

use LoanAccounting
select * from Loans_info


insert into Loans_info([����� �����]) values(3126)

update Loans_info
set [����� �����] = 33126 where [����� �����]=3126

delete from Loans_info where [����� �����]=33126
