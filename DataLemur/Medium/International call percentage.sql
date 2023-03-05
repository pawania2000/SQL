/*A phone call is considered an international call when the person calling is in a different country than the person receiving the call.
What percentage of phone calls are international? Round the result to 1 decimal.
Assumption:
•The caller_id in phone_info table refers to both the caller and receiver.*/



SELECT round(100.0*SUM(CASE 
  WHEN i.country_id <> info.country_id THEN 1 ELSE NULL END)/
  COUNT(*),1) AS int_calls
FROM phone_calls as c
left join phone_info as i
on c.caller_id=i.caller_id
left join phone_info as info
on c.receiver_id=info.caller_id;