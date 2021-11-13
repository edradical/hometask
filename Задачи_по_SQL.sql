#Задание1.

SELECT p.name, COUNT(t.trip) count
FROM Pass_in_trip t JOIN Passenger p 
ON p.id = t.passenger
GROUP BY p.name
HAVING COUNT(t.trip) > 0
ORDER BY COUNT(t.trip) DESC, p.name;

#Задание2.

SELECT TIMEDIFF(MAX(t.end_pair), MIN(t.start_pair)) time
FROM Timepair t JOIN Schedule s
ON t.id = s.number_pair
WHERE s.number_pair IN (2,4);

#Задание3.

SELECT Rooms.*
FROM Rooms JOIN Reservations
ON Rooms.id=Reservations.room_id
WHERE WEEK(start_date, 1) = 12 AND YEAR(start_date)=2020;

#Задание4.

FROM Schedule
GROUP BY classroom
HAVING COUNT(classroom) = (SELECT COUNT(classroom) 
                          		     FROM Schedule 
                          		     GROUP BY classroom 
                          		     ORDER BY COUNT(classroom) DESC  LIMIT 1);

#Задание6
SELECT TOP(SELECT COUNT(*) / 2 + COUNT(*) % 2 FROM Battles)
LEAD(rn_1, 3) OVER(ORDER BY rn_1) AS rn_1, 
LEAD(name_1, 3) OVER(ORDER BY rn_1) AS name_1,
LEAD(date_1, 3) OVER(ORDER BY rn_1) AS date_1,
rn_2, name_2, date_2
FROM
(SELECT 
CASE WHEN NTILE(2) OVER(ORDER BY date) = 1 THEN name END name_1,
CASE WHEN NTILE(2) OVER(ORDER BY date) = 1 THEN date END date_1,
CASE WHEN NTILE(2) OVER(ORDER BY date) = 1 THEN ROW_NUMBER() OVER(ORDER BY date) END rn_1,
CASE WHEN NTILE(2) OVER(ORDER BY date) = 2 THEN ROW_NUMBER() OVER(ORDER BY date) END rn_2,
CASE WHEN NTILE(2) OVER(ORDER BY date) = 2 THEN date END date_2,
CASE WHEN NTILE(2) OVER(ORDER BY date) = 2 THEN name END name_2
FROM Battles) X
