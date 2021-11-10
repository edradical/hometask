#Задание 1.

SELECT p.name, COUNT(t.trip) count
FROM Pass_in_trip t JOIN Passenger p 
ON p.id = t.passenger
GROUP BY p.name
HAVING COUNT(t.trip) > 0
ORDER BY COUNT(t.trip) DESC, p.name;

#Задание 2.

SELECT TIMEDIFF(MAX(t.end_pair), MIN(t.start_pair)) time
FROM Timepair t JOIN Schedule s
ON t.id = s.number_pair
WHERE s.number_pair IN (2,4);

#Задание 3.

SELECT Rooms.*
FROM Rooms JOIN Reservations
ON Rooms.id=Reservations.room_id
WHERE WEEK(start_date, 1) = 12 AND YEAR(start_date)=2020;

#Задание 4.

FROM Schedule
GROUP BY classroom
HAVING COUNT(classroom) = (SELECT COUNT(classroom) 
                          		     FROM Schedule 
                          		     GROUP BY classroom 
                          		     ORDER BY COUNT(classroom) DESC  LIMIT 1);
