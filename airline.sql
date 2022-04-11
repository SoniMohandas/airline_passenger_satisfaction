-- Change column type

ALTER TABLE online_services ALTER COLUMN booking_id TYPE int;
ALTER TABLE inflight_services ALTER COLUMN inflight_service_id TYPE int;
ALTER TABLE flights ALTER COLUMN flight_id TYPE int;
ALTER TABLE departure_arrival ALTER COLUMN depart_arrive_id TYPE int;
ALTER TABLE airline_services ALTER COLUMN airline_service_id TYPE int;

ALTER TABLE "passenger" ALTER COLUMN passenger_id TYPE int;
ALTER TABLE "passenger" ALTER COLUMN gender TYPE varchar(6);
ALTER TABLE "passenger" ALTER COLUMN customer_type TYPE varchar(25);
ALTER TABLE "passenger" ALTER COLUMN age TYPE int;
ALTER TABLE "passenger" ALTER COLUMN travel_type TYPE varchar(25);
ALTER TABLE "passenger" ALTER COLUMN satisfaction TYPE varchar(35);
 
ALTER TABLE "flights" ALTER COLUMN "class" TYPE varchar(25);
ALTER TABLE "flights" ALTER COLUMN seat_comfort TYPE int;
ALTER TABLE "flights" ALTER COLUMN flight_distance TYPE int;
ALTER TABLE "flights" ALTER COLUMN cleanliness TYPE int;

ALTER TABLE "airline_services" ALTER COLUMN "checkin_service" TYPE int;
ALTER TABLE "airline_services" ALTER COLUMN gate_location TYPE int;
ALTER TABLE "airline_services" ALTER COLUMN baggage_handling TYPE int;

ALTER TABLE "departure_arrival" ALTER COLUMN "time_convenience" TYPE int;
ALTER TABLE "departure_arrival" ALTER COLUMN departure_delay TYPE int;
ALTER TABLE "departure_arrival" ALTER COLUMN arrival_delay TYPE int;

ALTER TABLE "inflight_services" ALTER COLUMN "wifi" TYPE int;
ALTER TABLE "inflight_services" ALTER COLUMN entertainment TYPE int;
ALTER TABLE "inflight_services" ALTER COLUMN inflight_service TYPE int;
ALTER TABLE "inflight_services" ALTER COLUMN "food_drink" TYPE int;
ALTER TABLE "inflight_services" ALTER COLUMN onboard_service TYPE int;
ALTER TABLE "inflight_services" ALTER COLUMN legroom_service TYPE int;

ALTER TABLE "online_services" ALTER COLUMN booking_id TYPE int;
ALTER TABLE "online_services" ALTER COLUMN ease_of_online_booking TYPE int;
ALTER TABLE "online_services" ALTER COLUMN online_boarding TYPE int;

-- Set and existing column to not null

ALTER TABLE "passenger" ALTER COLUMN gender SET NOT NULL;
ALTER TABLE "passenger" ALTER COLUMN age SET NOT NULL;
ALTER TABLE "flights" ALTER COLUMN "class" SET NOT NULL;
ALTER TABLE "flights" ALTER COLUMN flight_distance SET NOT NULL;

-- Change an existing column to primary key

ALTER TABLE passenger ADD CONSTRAINT passenger_pk PRIMARY KEY (passenger_id);
ALTER TABLE flights ADD CONSTRAINT flights_pk PRIMARY KEY (flight_id);
ALTER TABLE online_services ADD CONSTRAINT online_services_pk PRIMARY KEY (booking_id);
ALTER TABLE airline_services ADD CONSTRAINT airline_services_pk PRIMARY KEY (airline_service_id);
ALTER TABLE departure_arrival ADD CONSTRAINT departure_arrival_pk PRIMARY KEY (depart_arrive_id);
ALTER TABLE inflight_services ADD CONSTRAINT inflight_services_pk PRIMARY KEY (inflight_service_id);

-- Create relationship between entities

ALTER TABLE "passenger" ADD CONSTRAINT "fk_passenger_booking_id" FOREIGN KEY("booking_id")
REFERENCES "online_services" ("booking_id");

ALTER TABLE "passenger" ADD CONSTRAINT "fk_passenger_flight_id" FOREIGN KEY("flight_id")
REFERENCES "flights" ("flight_id");

ALTER TABLE "passenger" ADD CONSTRAINT "fk_passenger_inflight_service_id" FOREIGN KEY("inflight_service_id")
REFERENCES "inflight_services" ("inflight_service_id");

ALTER TABLE "passenger" ADD CONSTRAINT "fk_passenger_airline_service_id" FOREIGN KEY("airline_service_id")
REFERENCES "airline_services" ("airline_service_id");

ALTER TABLE "flights" ADD CONSTRAINT "fk_flights_depart_arrive_id" FOREIGN KEY("depart_arrive_id")
REFERENCES "departure_arrival" ("depart_arrive_id");

-- Create query to retrieve data from multiple tables

SELECT passenger_id, food_drink, wifi
FROM passenger p
JOIN inflight_services s
ON p.inflight_service_id = s.inflight_service_id
LIMIT 5;
