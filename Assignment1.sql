-- Question #1:
-- How many airplanes have listed speeds?
-- What is the maximum listed speed and the maximum listed speed?
-- What is the minimum listed speed and the maximum listed speed?
SELECT
COUNT(speed) as NumWithSpeed,
MAX(speed) AS MaxSpeed,
MIN(speed) AS MinSpeed
FROM planes;

-- Question #2:
-- What is the total distance flown by all of the planes in January 2013?
SELECT
SUM(distance) as TotalMiles
FROM flights
WHERE (month = 1) AND (year = 2013);

-- Question #3:
-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT
SUM(distance) as NullMiles
FROM flights
WHERE (month = 1) AND (year = 2013) AND (tailnum is NULL);

-- Question #4:
-- What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?
-- Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN.
-- How do your results compare?
-- INNER JOIN does not show NULL miles while LEFT OUTER JOIN does
SELECT
SUM(distance) AS TotalMiles,
p.manufacturer
FROM flights f
INNER  JOIN planes p
ON f.tailnum = p.tailnum
WHERE (f.year = 2013) AND (f.month = 7) AND (f.day = 5)
GROUP BY p.manufacturer;

SELECT
SUM(distance) AS TotalMiles,
p.manufacturer
FROM flights f
LEFT OUTER JOIN planes p
ON f.tailnum = p.tailnum
WHERE (f.year = 2013) AND (f.month = 7) AND (f.day = 5)
GROUP BY p.manufacturer;

-- Question #5(Make up your own):
-- How many plane models did each airline fly to all destinations on Christmas 2013?

SELECT
COUNT(f.tailnum), p.model, a.name, dest
FROM flights f
LEFT JOIN planes p ON f.tailnum = p.tailnum
LEFT JOIN airlines a ON f.carrier = a.carrier
WHERE (f.year = 2013) AND (f.month = 12) AND (f.day = 25)
GROUP BY f.dest, a.name, p.model
