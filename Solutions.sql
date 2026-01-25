-- Solution for Q3:
SELECT count(*)
FROM `demo_dataset.green_taxi_2025`
WHERE lpep_pickup_datetime >= '2025-11-01' 
  AND lpep_pickup_datetime < '2025-12-01'
  AND trip_distance <= 1;

-- Solution for Q4:
SELECT 
    DATE(lpep_pickup_datetime) AS pickup_day,
    MAX(trip_distance) AS max_dist
FROM `demo_dataset.green_taxi_2025`
WHERE trip_distance < 100
GROUP BY pickup_day
ORDER BY max_dist DESC
LIMIT 1;

-- Solution for Q5:
SELECT 
    z.Zone, 
    SUM(t.total_amount) AS total_sum
FROM `demo_dataset.green_taxi_2025` t
JOIN `demo_dataset.zones` z ON t.PULocationID = z.LocationID
WHERE DATE(t.lpep_pickup_datetime) = '2025-11-18'
GROUP BY z.Zone
ORDER BY total_sum DESC
LIMIT 1;

-- Solution for Q6:
SELECT 
    z_drop.Zone AS dropoff_zone, 
    MAX(t.tip_amount) AS max_tip
FROM `demo_dataset.green_taxi_2025` t
JOIN `demo_dataset.zones` z_pick ON t.PULocationID = z_pick.LocationID
JOIN `demo_dataset.zones` z_drop ON t.DOLocationID = z_drop.LocationID
WHERE z_pick.Zone = 'East Harlem North'
GROUP BY dropoff_zone
ORDER BY max_tip DESC
LIMIT 1;