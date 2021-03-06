SET CLIENT_ENCODING TO UTF8;
SET STANDARD_CONFORMING_STRINGS TO ON;
BEGIN;
CREATE TABLE "coopers_rock_places" (gid serial,
"name" varchar(80),
"comment" varchar(80));
ALTER TABLE "coopers_rock_places" ADD PRIMARY KEY (gid);
SELECT AddGeometryColumn('','coopers_rock_places','geom','4326','POINT',2);
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Restroom','2009-03-07','0101000020E61000006F51C13CBFF453C00575255D8ED34340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Restroom','2009-03-07','0101000020E61000005AB8ACC266F453C0856E4095E4D14340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Shelter #3','2009-03-07','0101000020E610000029988CBE5DF453C0A82A7E9DE5D14340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Consession Stand','2009-03-07','0101000020E6100000B69B85E233F453C0E5756968A8D14340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Henry Clay Iron Furnace','2009-03-07','0101000020E6100000D9DC877258F453C0FF8C77EC0CD34340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Roof Rocks','2009-03-07','0101000020E61000004B5C227255F453C0F0A88CDA58D34340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Army Rock','2009-03-11','0101000020E61000008FDE701FB9F553C060F01FC143D44340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Parking','2009-03-12','0101000020E6100000CA37AF9357F253C070059AC6F5D34340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Parking','2009-03-12','0101000020E610000060EC63A6D4F253C0F03BC7BB29D24340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Campground','2009-03-12','0101000020E61000006F546A03ACF253C08684AD3FCED14340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Parking','2009-03-12','0101000020E6100000C4936E584BF353C052C3B25B80D14340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Raven Rock','2009-03-12','0101000020E61000007CCE74AE22F353C053ED594984CF4340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Overlook','2009-03-12','0101000020E610000089AEDBB539F453C0B296680275D14340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Rock City Shelter','2009-03-12','0101000020E6100000EC3B85F5BCF453C0364295141FD24340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Parking','2016-02-04','0101000020E610000070CA81C3B0F253C0C8900832A7D24340');
INSERT INTO "coopers_rock_places" ("name","comment",geom) VALUES ('Parking','2016-02-04','0101000020E6100000F5786BAA38F253C00734C7A821D34340');
COMMIT;
