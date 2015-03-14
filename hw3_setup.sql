CONNECT om/om;
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE songs';
  EXECUTE IMMEDIATE 'DROP TABLE plans';
  EXECUTE IMMEDIATE 'DROP TABLE customers';
  EXECUTE IMMEDIATE 'DROP TABLE streams';
  EXECUTE IMMEDIATE 'DROP SEQUENCE song_id_seq';
  EXECUTE IMMEDIATE 'DROP SEQUENCE plan_id_seq';
  EXECUTE IMMEDIATE 'DROP SEQUENCE customer_id_seq';
  EXECUTE IMMEDIATE 'DROP SEQUENCE stream_id_seq';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

CREATE TABLE OM."SONGS" (
  "SONG_ID" NUMBER PRIMARY KEY,
  "SONG_NAME" VARCHAR2(50) NOT NULL,
  "SONG_ARTIST" VARCHAR2(50),
  "SONG_ALBUM" VARCHAR2(50),
  "ALBUM_ONLY" VARCHAR2(50),
  CONSTRAINT albumb_only_ck CHECK (album_only = 'Album Only' AND album_only = null)
  );

CREATE TABLE OM."PLANS" (
  "PLAN_ID" NUMBER PRIMARY KEY,
  "PLAN_NAME" VARCHAR2(50),
  "MAXIMUM_SONG_COUNT" NUMBER,
  "MONTHLY_FEE" NUMBER(9,2) DEFAULT 0
  );



ALTER TABLE OM."CUSTOMERS"
ADD "CUSTOMER_EMAIL" VARCHAR2(100);

ALTER TABLE OM."CUSTOMERS"
ADD "LOGIN" VARCHAR2(16) UNIQUE;

ALTER TABLE OM."CUSTOMERS"
ADD "PASSWORD" VARCHAR2(16);

ALTER TABLE OM."CUSTOMERS"
ADD (CONSTRAINT plans_fk FOREIGN KEY ("SUBSCRIPTION_PLAN") REFERENCES "PLANS" ("PLAN_ID"));

ALTER TABLE OM."CUSTOMERS"
DROP COLUMN "CUSTOMER_FAX";


CREATE TABLE OM."STREAMS" (
  "STREAM_ID" NUMBER PRIMARY KEY,
  "CUSTOMER_ID" NUMBER REFERENCES "CUSTOMERS" ("CUSTOMER_ID"),
  "SONG_ID" NUMBER REFERENCES "SONGS" ("SONG_ID"),
  "STATUS" VARCHAR2(15),
  CONSTRAINT status_ck CHECK ("STATUS" = 'Active' AND "STATUS" = 'Inactive')
  );
  
CREATE SEQUENCE song_id_seq;
CREATE SEQUENCE plan_id_seq;
CREATE SEQUENCE customer_id_seq;
CREATE SEQUENCE stream_id_seq;


INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Bonfire', 'Childish Gambino', 'Camp', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Theatre', 'Icon for Hire', 'Scripted', 'Album Only');
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'The Grey', 'Icon for Hire', 'Scripted', 'Album Only');
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Iodine', 'Icon for Hire', 'Scripted', 'Album Only');
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Pieces', 'Icon for Hire', 'Scripted', 'Album Only');
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Nerves', 'Icon for Hire', 'Scripted', 'Album Only');
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Raindrops', 'Captain Crunch', 'Raindrops', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Fading Halo', 'Chanto', 'Spirit in the System', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Radioactive', 'Imagine Dragons', 'Night Vision', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Another Way To Die', 'Disturbed', 'The Studio Album', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'In The End', 'Linkin Park', 'Hybrid Theory', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'The Monster', 'Eminem', 'The Marshall Mathers LP', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Handlebars', 'Flobots', 'Fight With Tools', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'White Flag Warrior', 'Flobots', 'The Circle in the Square', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Hero', 'Skillet', 'Awake', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Alive', 'Krewella', 'Play Hard EP', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Fly Away', 'Steklo', 'Fly Away', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Summertime Sadness', 'Lana Del Rey', 'Summertime Sadness', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Animals', 'Martin Garrix', 'Animals', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Broken', 'Young Londons', 'Instincts', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Bullet Train', 'Stephen Swartz', 'Bullet Train', null);
INSERT INTO SONGS VALUES(song_id_seq.NEXTVAL, 'Champagne', 'Cavo', 'Champagne', null);

INSERT INTO PLANS VALUES(plan_id_seq.NEXTVAL, 'Basic', 5, 1.99);
INSERT INTO PLANS VALUES(plan_id_seq.NEXTVAL, 'Plus', 12, 2.99);
INSERT INTO PLANS VALUES(plan_id_seq.NEXTVAL, 'Premium', 40, 8.99);



UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'able@able.com', LOGIN = 'able', PASSWORD = 'able', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Korah';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'believe@gmail.com', LOGIN = 'basketball', PASSWORD = 'banana', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Yash';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'casper@yahoo.com', LOGIN = 'caterer', PASSWORD = 'carborator', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Johnathon';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'dragonage@darthmouth.com', LOGIN = 'dat3423', PASSWORD = 'datacage2345', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Mikayla';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'eficacy@ddf.com', LOGIN = 'eagle', PASSWORD = 'eater342', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Kendall';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'deficio@gmail.com', LOGIN = 'deltaforce', PASSWORD = 'ninerbravo', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Kaitlin';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'feather@able.com', LOGIN = 'feltman', PASSWORD = 'finicky3', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Derek';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'gerard@gmail.com', LOGIN = 'gambleman', PASSWORD = 'gooblegob34', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Deborah';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'hiksey@boopbeep.com', LOGIN = 'hicklepickle', PASSWORD = 'grassmd', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Karina';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'ijk@lmno.com', LOGIN = 'abcvc', PASSWORD = 'dcdsa', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Kurt';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'cornerstorne@outlook.com', LOGIN = 'crabbypatty', PASSWORD = 'spongey', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Kelsey';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'kangaroo@jack.com', LOGIN = 'ellomate', PASSWORD = 'aussie', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Anders';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'lamena@able.com', LOGIN = 'luxtera', PASSWORD = 'palente', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Thalia';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'quirky@able.com', LOGIN = 'quirky', PASSWORD = 'queens', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Gonzalo';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'ratatuey@able.com', LOGIN = 'raxypaxy', PASSWORD = 'southbyanger', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Ania';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'smity@striker.com', LOGIN = 'lucian', PASSWORD = 'marauder', SUBSCRIPTION_PLAN = 2 WHERE CUSTOMER_FIRST_NAME = 'Dakota';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'terreria@gmail.com', LOGIN = 'tribunal', PASSWORD = 'estate343', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Samuel';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'ugandahotspot@great.com', LOGIN = 'crander', PASSWORD = 'nigerianprince', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Justin';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'vuvumanser@viyal.com', LOGIN = 'gogdance', PASSWORD = 'lancerld22', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Kyle';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'padke@paduken.com', LOGIN = 'brutasa', PASSWORD = 'mangera', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Erick';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'zzrot@portal.com', LOGIN = 'ludels', PASSWORD = 'angela00', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Marvin';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'youmous@ghostblade.com', LOGIN = 'rabodons', PASSWORD = 'deathcap', SUBSCRIPTION_PLAN = 1 WHERE CUSTOMER_FIRST_NAME = 'Rashad';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'randuins@omen.com', LOGIN = 'spirit343', PASSWORD = 'visage105', SUBSCRIPTION_PLAN = 3 WHERE CUSTOMER_FIRST_NAME = 'Trisha';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'dorans@blade.com', LOGIN = 'crystalline343', PASSWORD = 'flask02', SUBSCRIPTION_PLAN = 3 WHERE CUSTOMER_FIRST_NAME = 'Julian';
UPDATE CUSTOMERS SET CUSTOMER_EMAIL = 'infinity@edge.com', LOGIN = 'phantom343', PASSWORD = 'dancer2105', SUBSCRIPTION_PLAN = 3 WHERE CUSTOMER_FIRST_NAME = 'Kirsten';

commit;

