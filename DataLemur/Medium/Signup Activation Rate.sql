/*New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users
 may receive multiple text messages for account confirmation until they have confirmed their new account.
Write a query to find the activation rate of the users. Round the percentage to 2 decimal places.
Definitions:
•emails table contain the information of user signup details.
•texts table contains the users' activation information.
As of 29 Nov 2022, the term confirmation rate is changed to activation rate to reflect the nature of the new user activation process.*/


SELECT 
  ROUND(
      SUM(case when texts.signup_action='Confirmed' THEN 1 ELSE 0 END)::DECIMAL 
      / COUNT(texts.email_id)::DECIMAL,2)
      AS activation_rate
FROM emails 
RIGHT JOIN texts 
ON emails.email_id = texts.email_id ;