CREATE TABLE booking (
    "id" int4 NOT NULL DEFAULT nextval('booking_id_seq'::regclass),
    "accommodation_id" int4,
    "user_email" text,
    "date" date,
    "status" varchar(30),
    CONSTRAINT "booking_accommodation_id_fkey" FOREIGN KEY ("accommodation_id") REFERENCES "public"."accommodation"("id"),
    PRIMARY KEY ("id")
);