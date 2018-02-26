use LoanAccounting

alter table Customers
drop constraint idCheck
alter table Customers
drop constraint FirstNameCheck, LastNameCheck, MidNameCheck

alter table Customers
add constraint FirstNameCheck
check (firstName NOT LIKE '%[^a-z]%');

alter table Customers
add constraint LastNameCheck
check (lastName NOT LIKE '%[^a-z]%');

alter table Customers
add constraint MidNameCheck
check (midName NOT LIKE '%[^a-z]%');

alter table Customers
add constraint idCheck
check (IDCode NOT LIKE '%[^0-9]%');

alter table Customers
add constraint telCheck
check (telephone LIKE '0[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

alter table Customers
add constraint emailCheck
check (email LIKE '%_@__%.__%');

alter table Customers
add constraint uniMail
UNIQUE (email);

alter table Customers
add constraint uniTel
UNIQUE (telephone);



/*-----------------------------------------------------------------------------------*/
alter table urgencies
drop constraint nameUrgenciesCheck

alter table interests
add constraint nameInterestsCheck
check (name NOT LIKE '%[^a-z]%');

alter table interests
add constraint idInterestsCheck
check (ID > 0);

alter table purposes
add constraint namePurposesCheck
check (name NOT LIKE '%[^a-z]%');

alter table purposes
add constraint idPurposesCheck
check (ID > 0);

alter table urgencies
add constraint nameUrgenciesCheck
check (name NOT LIKE '%[^a-z]%');

alter table urgencies
add constraint idUrgenciesCheck
check (ID > 0);

/*-----------------------------------------------------------------------------------*/

alter table Payments
add constraint incomePaymentsCheck
check (income > 0);

/*-----------------------------------------------------------------------------------*/
alter table loans
drop constraint idLoansCheck

alter table loans
add constraint idLoansCheck
check (ID NOT LIKE '%[^0-9]%')

alter table loans
drop constraint endDateCheck
alter table loans
add constraint endDateCheck
check ((endDate!<startDate) and (endDate>'2016-11-25'))

alter table loans
add constraint moneyCheck
check (moneyAmount!<0)

alter table loans
add constraint interestCheck
check (interestRate!<0)

alter table loans
add constraint interestAmountCheck
check (interestAmount!<0)