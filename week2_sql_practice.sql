-- Query sample NYC Taxi data directly in Databricks
-- describe samples.nyctaxi.trips

-- Create a small temporary practice table
CREATE OR REPLACE TABLE workspace.default.my_first_table AS 
SELECT 1 AS id, 'Alice' AS name, 100 AS score
UNION ALL
SELECT 2 AS id, 'Bob' AS name, 85 AS score
UNION ALL
SELECT 3 AS id, 'Charlie' AS name, 92 AS score;

-- Query your new table
SELECT * FROM workspace.default.my_first_table;

SELECT 
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    trip_distance,
    fare_amount
FROM samples.nyctaxi.trips
WHERE trip_distance > 5
ORDER BY fare_amount DESC
LIMIT 10;

select * from samples.nyctaxi.trips
select avg(fare_amount) from samples.nyctaxi.trips
select avg(fare_amount), count(*) as cnt, sum(fare_amount) as total, total/cnt from samples.nyctaxi.trips

SELECT 
    date(tpep_pickup_datetime) AS pickup_date,
    COUNT(*) AS total_trips_per_day, 
    ROUND(AVG(fare_amount),2)
FROM samples.nyctaxi.trips
GROUP BY 1
ORDER BY 2 DESC;

select count(*) from samples.nyctaxi.trips
where day(tpep_pickup_datetime) = 11 and month(tpep_pickup_datetime) = 2 and year(tpep_pickup_datetime) = 2016
group by day(tpep_pickup_datetime)

