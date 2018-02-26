use LoanAccounting
SET IDENTITY_INSERT Customers ON
SET IDENTITY_INSERT Customers OFF
insert into Customers(IDCode,firstName,lastName,midName,email,telephone) 
values('3564906612','Alexander','Khrenov','Hennadievich','sania979797@gmail.com','0958711486');
insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('7414946202', 'Eugeniy', 'Petrov', 'Ivanovich', 'petrovevgen@gmail.com', '0951234568');
insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('7953461243', 'Maksym', 'Sidorov', 'Nikolaevich', 'sidorovmaksim@gmail.com', '0979635274');
insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('5065223251', 'Hennadiy', 'Bocharov', 'Alexandrovich', 'bocha@gmail.com', '0503521658');
insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('7005311782', 'Nikolay', 'Bezdrabko', 'Anatolievich', 'bezdrik@gmail.com', '0661354874');
insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('4988799733', 'Mihail', 'Zhila', 'Alexandrovich', 'jihila@gmail.com', '0630213288');
insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('1804320754', 'Vladislav', 'Marchenko', 'Urievich', 'mandarin@gmail.com', '0996665566');
insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('2049747195', 'Dmitriy', 'Sheludko', 'Eugenievich', 'shelldono@gmail.com', '0981664855');
insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('4669580826', 'Denis', 'Aleshyn', 'Alexandrovich', 'alidenxpres@gmail.com', '0672031468');
insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('5954153097', 'Nazar', 'Kolomiets', 'Viktorovich', 'kolimicca@gmail.com', '0938711489');

insert into Customers(IDCode, firstName, lastName, midName, email, telephone)
values('64455452a4', 'Nazkar', 'Koiets', 'rov8ich', 'kolimica@gmail.com', '0938711488');

delete from Customers where IDCode = '6445545244'
delete Customers

select * from Customers  

/*------------------------------------------------------------------------------------------------*/


insert into interests(name) values('Percentage');
insert into interests(name) values('FixedPayment');
insert into interests(name) values('InterestFree');

select * from interests order by ID

insert into purposes(name) values('Undesignated');
insert into purposes(name) values('Housing');
insert into purposes(name) values('CarLoan');
insert into purposes(name) values('LandLoan');
insert into purposes(name) values('Consumer');
insert into purposes(name) values('Educational');
insert into purposes(name) values('Brokerage');

select * from purposes order by ID

insert into urgencies(name) values('SuperShortTerm');
insert into urgencies(name) values('ShortTerm');
insert into urgencies(name) values('MediumTerm');
insert into urgencies(name) values('LongTerm');

select * from urgencies order by ID

/*----------------------------------------------------------------*/
SET IDENTITY_INSERT loans OFF
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount)
values('3564906612', 3, 3, 3, '2018-10-21', 20000);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount, interestRate)
values('3564906612', 1, 2, 4, '2025-11-16', 100000, 30);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount, interestAmount)
values('5954153097', 2, 4, 4, '2020-03-01', 10000, 2500);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount)
values('4669580826', 3, 6, 3, '2021-08-08', 32641);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount, interestRate)
values('2049747195', 1, 1, 1, '2017-01-18', 1500, 15);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount, interestAmount)
values('1804320754', 2, 4, 2, '2017-05-17', 1000, 250);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount)
values('7005311782', 3, 6, 4, '2021-10-02', 12346);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount, interestRate)
values('1804320754', 1, 2, 4, '2030-01-05', 200000, 20);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount, interestAmount)
values('5954153097', 2, 1, 3, '2019-03-04', 13000, 1500);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount)
values('7005311782', 3, 3, 2, '2017-09-11', 32659);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount, interestRate)
values('2049747195', 1, 4, 3, '2018-06-27', 12245, 35);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount, interestAmount)
values('4669580826', 2, 5, 1, '2016-12-25', 500, 70);
insert into loans(CustomerID, interestID, purposeID, urgencyID, startDate, endDate, moneyAmount, interestRate)
values('5065223251', 1, 2, 4, '2013-11-26', '2016-11-26', 100000, 30);
insert into loans(CustomerID, interestID, purposeID, urgencyID, startDate, endDate, moneyAmount, interestRate)
values('7953461243', 1, 4, 2, '2015-12-26', '2016-11-29', 3650, 30);
insert into loans(CustomerID, interestID, purposeID, urgencyID, endDate, moneyAmount)
values('3564906612', 3, 3, 3, '2040-10-21', 20000);

select * from loans

/*-------------------------------------------------------------------------------*/

insert into Payments(loanID, income) values('1000000000', 350);
insert into Payments(loanID, income) values('1000000010', 600);
insert into Payments(loanID, income) values('1000000007', 2789.14);
insert into Payments(loanID, income) values('1000000000', 250);
insert into Payments(loanID, income) values('1000000005', 35);
insert into Payments(loanID, income) values('1000000006', 150);
insert into Payments(loanID, income) values('1000000008', 200);
insert into Payments(loanID, income) values('1000000011', 370.08);
insert into Payments(loanID, income) values('1000000001', 1569.36);
insert into Payments(loanID, income) values('1000000003', 700);
insert into Payments(loanID, income) values('1000000005', 130);
insert into Payments(loanID, income) values('1000000004', 860);
insert into Payments(loanID, income) values('1000000010', 950);
insert into Payments(loanID, income) values('1000000011', 200.15);
insert into Payments(loanID, income) values('1000000000', 420);
insert into Payments(loanID, income) values('1000000005', 120.35);
insert into Payments(loanID, income) values('1000000007', 2790.03);
insert into Payments(loanID, income) values('1000000003', 1233.21);
insert into Payments(loanID, income) values('1000000008', 150);
insert into Payments(loanID, income) values('1000000009', 380);

insert into Payments(loanID, PaymentDate, income) values('1000000012', '2013-12-01 13:18:45.200', 3050);
insert into Payments(loanID, PaymentDate, income) values('1000000012', '2014-01-01 13:18:45.200', 3050);
insert into Payments(loanID, PaymentDate, income) values('1000000012', '2014-02-01 13:18:45.200', 3050);
insert into Payments(loanID, PaymentDate, income) values('1000000012', '2014-08-01 10:08:55.000', 30509);
insert into Payments(loanID, PaymentDate, income) values('1000000012', '2014-12-01 14:38:25.600', 64232);
insert into Payments(loanID, PaymentDate, income) values('1000000013', '2016-03-25 20:21:22.000', 1000.2);
insert into Payments(loanID, PaymentDate, income) values('1000000013', '2016-08-25 23:21:22.090', 1700.2);
insert into Payments(loanID, PaymentDate, income) values('1000000013', '2016-08-25 23:21:22.110', 3500.2);

select * from Payments order by loanID