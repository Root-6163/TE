"
5 Unnamed PL/SQL code block: Use of Control structure and Exception handling is mandatory. Write a PL/SQL block of code for the following requirements:- 
Schema: 1. Borrower(Roll,Name,DateofIssue, NameofBook, Status)
 2. Fine (Roll, Date, Amt)  
1.Accept Roll & N ame of book from user.
2. Check the number of days (from date of issue), if days are between 15 to 30 then fine amount will be Rs 5per day.
 3. If no. of days>30, per day fine will be Rs 50 per day & for days less than 30, Rs. 5 per day.
 4. After submitting the book, status will change from I to R.
 5. If condition of fine is true, then details will be stored into fine table.
"

-----
"
We have to Write a procedure programing for automate to record the fine on the pending payment of customer
1. there is a borrow tabel in which we stored the borrowed records 
2. Fine table we stored Fine per Day
when WE Write a Name and ID it view us fine of the customer

Conditions 
if days == 15<day<30 :
then Fine should be 5 per day
elseif day > 30 then 
fine should be 50 per day
