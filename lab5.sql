/*-----1-----*/  use LoanAccounting
/*вывести фио тех клиентов, у кого есть кредит, с взятой суммой денег меньше среднего значения*/
select distinct lastName, firstName, midName
from Customers, loans
where Customers.IDCode = loans.CustomerID
group by lastName, firstName, midName, moneyAmount
having min(loans.moneyAmount) < (select AVG(moneyAmount) from loans)

select AVG(moneyAmount) from loans

select * from loans

select distinct lastName, firstName, midName
from Customers, loans L1
where Customers.IDCode = (select CustomerID 
                          from loans L2 
						  where L2.CustomerID=L1.CustomerID
						  group by L2.CustomerID
						  having min(L2.moneyAmount) < (select AVG(moneyAmount) from loans)
						  )

select distinct lastName, firstName, midName
from Customers C
where IDCode = (select CustomerID 
                          from loans L 
						  where L.CustomerID=C.IDCode
						  group by L.CustomerID
						  having min(moneyAmount) < (select AVG(moneyAmount) from loans)
						  )

/*-----2-----*/
/*вывести фио тех клиентов, у кого размер займа минимален*/
select distinct lastName, firstName, midName--, moneyAmount
from Customers, loans
where Customers.IDCode = loans.CustomerID and loans.moneyAmount = (select min(moneyAmount) from loans)


select distinct lastName, firstName, midName
from Customers C
where IDCode in (select CustomerID 
                 from loans L
                 where L.CustomerID = C.IDCode 
				   and moneyAmount = (select min(moneyAmount) from loans))


/*-----3-----*/
/*вывести фио тех клиентов, которые совершили больше двух платежей по определенному кредиту*/
select distinct lastName, firstName, midName
from Customers C, loans L
where C.IDCode=L.CustomerID and L.ID in(
                                     select ID 
                                     from loans L1, Payments P
				                     where L1.ID=P.loanID
				                     group by ID
                                     having count(loanID)>2)


select distinct lastName, firstName, midName
from Customers C, loans L
where C.IDCode=L.CustomerID and L.ID in(
                                     select loanID 
                                     from Payments
				                     where loanID=L.ID
				                     group by loanID
                                     having count(loanID)>2)






use LoanAccounting

select CustomerID, loanID, max(PaymentDate)[The last payment]
from loans,(select loanID, PaymentDate 
            from loans L1, Payments P1
            group by loanID, PaymentDate
            having PaymentDate = (select max(PaymentDate) from Payments where loanID = P1.loanID)) S1
where loans.ID=S1.loanID
group by CustomerID, loanID

select * from (
select CustomerID, loanID, max(PaymentDate) p
from loans,(select loanID, PaymentDate 
            from loans L1, Payments P1
            group by loanID, PaymentDate
            having PaymentDate = (select max(PaymentDate) from Payments where loanID = P1.loanID)) S1
where loans.ID=S1.loanID
group by CustomerID, loanID) t1 where not exists 
(select * from (
select CustomerID, loanID, max(PaymentDate) p
from loans,(select loanID, PaymentDate 
            from loans L1, Payments P1
            group by loanID, PaymentDate
            having PaymentDate = (select max(PaymentDate) from Payments where loanID = P1.loanID)) as t2 where CustomerID=t1.CustomerID and p>t1.p group by CustomerID, loanID) as t3)



select idsub, idr, max(c)[кол-во] 
from (select count(iduser) c, idroom idr 
      from users group by idroom) r1, rooms
where r1.idr=rooms.idroom
group by idsub, idr