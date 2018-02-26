use LoanAccounting
select AVG(moneyAmount) [Average_Loan_Size] from loans


/*---------------------------------*/
select SUM(income) from Payments group by loanID

select (moneyAmount+interestAmount+moneyAmount*interestRate/100) from loans order by ID
/*---------------------------------*/
select distinct IDCode, lastName, firstName, midName, 
sum(income), (moneyAmount+interestAmount+moneyAmount*interestRate/100) 
from Customers C inner join loans L on C.IDCode = L.CustomerID inner join Payments P on L.ID = P.loanID
where endDate<getdate()
group by IDCode,lastName,firstName,midName,moneyAmount,interestAmount,interestRate
having (sum(income)<(moneyAmount+interestAmount+moneyAmount*interestRate/100))

/*---------------------------------*/

select IDCode, lastName, firstName, midName 
from Customers C inner join loans L
on C.IDCode = L.CustomerID where moneyAmount = max(moneyAmount)
group by IDCode, lastName, firstName, midName, moneyAmount
having moneyAmount = MAX(moneyAmount)

select MAX(moneyAmount) from loans
/*---------------------------------*/
select IDCode, lastName, firstName, midName, moneyAmount from Customers, loans
where Customers.IDCode = loans.CustomerID 
group by IDCode, lastName, firstName, midName, moneyAmount
having loans.moneyAmount = (select MAX(moneyAmount) from loans)
/*---------------------------------*/
select moneyAmount from loans
select max(moneyAmount) from loans




------
select TOP 1 IDCode, lastName, firstName, midName, MAX(moneyAmount) from Customers, loans
where Customers.IDCode = loans.CustomerID 
group by IDCode, lastName, firstName, midName, moneyAmount
Order by MAX(moneyAmount) DESC

select IDCode, lastName, firstName, midName 
from Customers, loans
where Customers.IDCode = loans.CustomerID and 


select distinct lastName, firstName, midName
from Customers C, loans L
where C.IDCode=L.CustomerID and L.ID in(
                                     select ID 
                                     from loans L1, Payments P
				                     where L1.ID=P.loanID
				                     group by ID
                                     having count(loanID)>2)
group by lastName, firstName, midName

/*******************************************************************************************/

select AVG(moneyAmount) [Average_Loan_Size] from loans  /*1 задание*/ 

select distinct IDCode, lastName, firstName, midName,                    /*2 задание*/
sum(income), (moneyAmount+interestAmount+moneyAmount*interestRate/100) 
from Customers C inner join loans L on C.IDCode = L.CustomerID inner join Payments P on L.ID = P.loanID
where endDate<getdate()	
group by IDCode,lastName,firstName,midName,moneyAmount,interestAmount,interestRate
having (sum(income)<(moneyAmount+interestAmount+moneyAmount*interestRate/100))

select TOP 1 IDCode, lastName, firstName, midName, MAX(moneyAmount) from Customers, loans    /*3 задание*/
where Customers.IDCode = loans.CustomerID 
group by IDCode, lastName, firstName, midName, moneyAmount
Order by MAX(moneyAmount) DESC

/*доп задание: вывести клиентов, на которых максимальное кол-во кредитов*/


select CustomerID, count(ID) credit_num
from loans 
group by CustomerID 



select count(ID) credit_num, CustomerID 
from loans 
group by CustomerID

/**/
select IDCode, lastName, firstName, midName, count(ID) as [Кількість взятих кредитів] 
from Customers C inner join loans L on C.IDCode=L.CustomerID 
group by IDCode, lastName, firstName, midName
having count(ID)=(select max(credit_num) 
                  from (select CustomerID, count(ID) credit_num 
                        from loans 
                        group by CustomerID) as Credit_Num)
/**/