-- Active: 1747546158046@@127.0.0.1@5432@ph
CREATE TABLE rangers(
   ranger_id SERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   region TEXT
);



CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(60),
    scientific_name VARCHAR(60),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

 CREATE TABLE sightings (
sighting_id SERIAL PRIMARY KEY,
ranger_id INT,
FOREIGN KEY(ranger_id) REFERENCES rangers(ranger_id),
species_id INT,
FOREIGN KEY(ranger_id) REFERENCES rangers(ranger_id),
FOREIGN KEY(species_id) REFERENCES species(species_id),
sighting_time TIMESTAMP,
location TEXT,
notes TEXT
 );



 INSERT INTO rangers (name, region) VALUES
('Rahim Uddin', 'Sundarbans'),
('Fatema Khatun', 'Chittagong Hill Tracts'),
('Jamal Hossain', 'Sylhet Forest'),
('Laila Noor', 'Rangamati');



INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Royal Bengal Tiger', 'Panthera tigris tigris', '1900-01-01', 'Endangered'),
('Asian Elephant', 'Elephas maximus', '1800-05-15', 'Endangered'),
('Hoolock Gibbon', 'Hoolock hoolock', '1905-07-10', 'Vulnerable'),
('Fishing Cat', 'Prionailurus viverrinus', '1827-03-01', 'Vulnerable');



INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 1, '2024-05-01 07:30:00', 'East Sundarbans', 'Observed a tiger near the river bank.'),
(2, 2, '2024-05-02 09:45:00', 'Bandarban forest trail', 'Elephant tracks found.'),
(3, 3, '2024-05-03 14:20:00', 'Lawachara National Park', 'Saw two gibbons swinging through trees.'),
(1, 4, '2024-05-04 18:15:00', 'Near mangrove swamp Pass', 'Fishing cat spotted hunting.');




--provlem-1

  INSERT INTO rangers  (name,region) VALUES
 ('Derek Fox','Coastal Plains');

-- problem-2
 SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;


--provlem-3


SELECT sighting_id,species_id,ranger_id,location,sighting_time,notes FROM sightings
WHERE location LIKE '%Pass%';


--povlem-4
SELECT rangers.name, count(sightings.ranger_id ) as sighting_count FROM rangers
INNER JOIN sightings  ON rangers.ranger_id= sightings.ranger_id
 GROUP BY rangers.name;



 --provlem-6

 SELECT common_name,sighting_time,name as renjers_name
FROM sightings
INNER JOIN species ON species.species_id = sightings.species_id
INNER JOIN rangers ON rangers.ranger_id = sightings.ranger_id
ORDER BY sighting_time DESC
LIMIT 2 ;


--provlem-7
UPDATE species
SET conservation_status='Historic'
 WHERE EXTRACT(year FROM discovery_date) < 1800;
 