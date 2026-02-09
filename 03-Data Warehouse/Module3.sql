CREATE OR REPLACE TABLE `project-f6a0efb4-f01f-4835-8ba.ny_taxi.yellow_tripdata_2024_regular` AS
SELECT * FROM `project-f6a0efb4-f01f-4835-8ba.ny_taxi.external_yellow_tripdata_2024`;


SELECT count(*) FROM `project-f6a0efb4-f01f-4835-8ba.ny_taxi.yellow_tripdata_2024_regular`;

SELECT count(DISTINCT PULocationID) FROM `project-f6a0efb4-f01f-4835-8ba.ny_taxi.external_yellow_tripdata_2024`;

SELECT count(DISTINCT PULocationID) FROM `project-f6a0efb4-f01f-4835-8ba.ny_taxi.yellow_tripdata_2024_regular`;

SELECT count(*) FROM `project-f6a0efb4-f01f-4835-8ba.ny_taxi.yellow_tripdata_2024_regular`
WHERE fare_amount = 0;


CREATE OR REPLACE TABLE `project-f6a0efb4-f01f-4835-8ba.ny_taxi.yellow_tripdata_2024_partitioned`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID AS
SELECT * FROM `project-f6a0efb4-f01f-4835-8ba.ny_taxi.external_yellow_tripdata_2024`;

SELECT DISTINCT(VendorID)
FROM `project-f6a0efb4-f01f-4835-8ba.ny_taxi.yellow_tripdata_2024_regular`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';

SELECT DISTINCT(VendorID)
FROM `project-f6a0efb4-f01f-4835-8ba.ny_taxi.yellow_tripdata_2024_partitioned`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';


SELECT count(*) FROM `project-f6a0efb4-f01f-4835-8ba.ny_taxi.yellow_tripdata_2024_regular`;







