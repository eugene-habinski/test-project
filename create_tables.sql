CREATE TABLE "cars"
(
	"id"            serial                 NOT NULL,
	"brand"         character varying(300) NOT NULL,
	"model"         character varying(300) NOT NULL,
	"license_plate" character varying(300) NOT NULL,
	"vin"           character varying(300) NOT NULL,
    "register_date" date NOT NULL,
	CONSTRAINT "cars_pk" PRIMARY KEY ("id")
) WITH (
	  OIDS = FALSE
	  );



CREATE TABLE "car_booking"
(
	"id"         serial NOT NULL,
	"auto_id"     bigint NOT NULL,
	"start_date" date NOT NULL,
	"end_date"   date NOT NULL,
	CONSTRAINT "car_booking_pk" PRIMARY KEY ("id")
) WITH (
	  OIDS = FALSE
	  );



CREATE TABLE "rate"
(
	"id"       serial NOT NULL,
	"distance" int    NOT NULL,
	"price"     float NOT NULL,
	CONSTRAINT "rate_pk" PRIMARY KEY ("id")
) WITH (
	  OIDS = FALSE
	  );



CREATE TABLE "discount"
(
	"id"        serial NOT NULL,
	"rate"      int    NOT NULL UNIQUE,
	"from_days" int    NOT NULL,
	"to_days"   int    NOT NULL,
	CONSTRAINT "discount_pk" PRIMARY KEY ("id")
) WITH (
	  OIDS = FALSE
	  );



ALTER TABLE "car_booking"
	ADD CONSTRAINT "car_booking_fk0" FOREIGN KEY ("auto_id") REFERENCES "cars" ("id");

INSERT INTO rate(distance, price) VALUES (200, 270), (350, 330), (500, 390);
INSERT INTO discount(rate, from_days, to_days) VALUES (5, 3, 5), (10, 6, 14), (15, 15, 30);
INSERT INTO cars(brand, model, license_plate, vin, register_date) VALUES ('rollsRoyce', 'ghost', 'TRZ18K4', 'QWE456DFG234', '2020-05-07'), ('ford', 'mustang', '6MHG583', '1FDKF37G1VEB36767', '2021-05-11'), ('chevrolet', 'camaro', '8DVBN987', '1N4FGH2355133660', '2021-01-15'), ('plymouth', 'barracuda', 'AX25780', '2G1FP22G922147195', '2021-06-06'), ('nissan', 'skyline', 'DJY5518', 'WAUDF78E86A074839', '2021-02-23');
INSERT INTO car_booking(auto_id, start_date, end_date) VALUES (1, '2021-06-14', '2021-06-21'), (2, '2021-06-07', '2021-06-28'), (3, '2021-08-09', '2021-08-13'), (4, '2021-09-06', '2021-09-13'), (5, '2021-06-14', '2021-06-27');
