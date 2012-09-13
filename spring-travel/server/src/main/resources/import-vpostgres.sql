create table HOTELS (
  ID bigint not null,
  PRICE decimal(6,2) ,
  NAME varchar ,
  ADDRESS varchar ,
  CITY varchar ,
  STATE varchar ,
  ZIP varchar ,
  COUNTRY varchar ,
  primary key (id)
);

create table CUSTOMERS (
    USERNAME varchar not null,
    ENABLED boolean not null,
    NAME varchar not null,
    EMAIL varchar not null,
    PASSWORD varchar not null ,
    primary key (username)
);

create table BOOKINGS (
  ID bigint not null,
  BEDS integer not null,
  CHECKINDATE date,
  CHECKOUTDATE date,
  CREDITCARD varchar,
  CREDITCARDEXPIRYMONTH integer not null,
  CREDITCARDEXPIRYYEAR integer not null,
  CREDITCARDNAME varchar ,
  SMOKING boolean not null,
  HOTEL_ID bigint,
  USER_USERNAME varchar ,
  primary key (id),
  foreign key (USER_USERNAME) references CUSTOMERS(USERNAME),
  foreign key (HOTEL_ID) references HOTELS(ID)
);

create table HIBERNATE_SEQUENCES (
  SEQUENCE_NAME varchar ,
  SEQUENCE_NEXT_HI_VALUE integer
);

create sequence HIBERNATE_SEQUENCE;


-- Spring Security related
create table authorities (
  username varchar(50) not null,
  authority varchar(50) not null,
  constraint fk_authorities_users foreign key(username) references CUSTOMERS(username));
  create unique index ix_auth_username on authorities (username,authority);
  
create sequence group_identity;

create table groups (
  id bigint default nextval('group_identity') primary key,
  group_name varchar(50) not null);

create table group_authorities (
  group_id bigint not null,
  authority varchar(50) not null,
  constraint fk_group_authorities_group foreign key(group_id) references groups(id));
  
create table group_members (
  id bigint default nextval('member_identity') primary key,
  username varchar(50) not null,
  group_id bigint not null,
  constraint fk_group_members_group foreign key(group_id) references groups(id));

create view USERS AS SELECT * FROM CUSTOMERS ;

-- Password is the same as for 'keith' (melbourne) 
insert into customers (username, name, enabled, password, email) values ('user1', 'User 1',true,'417c7382b16c395bc25b5da1398cf076','user1.springtravel@gmail.com');
insert into customers (username, name, enabled, password, email) values ('user2', 'User 2',true,'417c7382b16c395bc25b5da1398cf076','user2.springtravel@gmail.com');
insert into customers (username, name, enabled, password, email) values ('user3', 'User 3',true,'417c7382b16c395bc25b5da1398cf076','user3.springtravel@gmail.com');
insert into customers (username, name, enabled, password, email) values ('user4', 'User 4',true,'417c7382b16c395bc25b5da1398cf076','user4.springtravel@gmail.com');

INSERT INTO AUTHORITIES(username, authority) SELECT username, 'ROLE_USER' from CUSTOMERS ;
INSERT INTO AUTHORITIES(username, authority) VALUES ( 'user1', 'ROLE_SUPERVISOR') ;
INSERT INTO AUTHORITIES(username, authority) VALUES( 'user2', 'ROLE_SUPERVISOR');

insert into Hotels (id, price, name, address, city, state, zip, country) values (1, 199, 'Westin Diplomat', '3555 S. Ocean Drive', 'Hollywood', 'FL', '33019', 'USA');
insert into Hotels (id, price, name, address, city, state, zip, country) values (2, 60, 'Jameson Inn', '890 Palm Bay Rd NE', 'Palm Bay', 'FL', '32905', 'USA');
insert into Hotels (id, price, name, address, city, state, zip, country) values (3, 199, 'Chilworth Manor', 'The Cottage, Southampton Business Park', 'Southampton', 'Hants', 'SO16 7JF', 'UK');
insert into Hotels (id, price, name, address, city, state, zip, country) values (4, 120, 'Marriott Courtyard', 'Tower Place, Buckhead', 'Atlanta', 'GA', '30305', 'USA');
insert into Hotels (id, price, name, address, city, state, zip, country) values (5, 180, 'Doubletree', 'Tower Place, Buckhead', 'Atlanta', 'GA', '30305', 'USA');
insert into Hotels (id, price, name, address, city, state, zip, country) values (6, 450, 'W Hotel', 'Union Square, Manhattan', 'NY', 'NY', '10011', 'USA');
insert into Hotels (id, price, name, address, city, state, zip, country) values (7, 450, 'W Hotel', 'Lexington Ave, Manhattan', 'NY', 'NY', '10011', 'USA') ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (8, 250, 'Hotel Rouge', '1315 16th Street NW', 'Washington', 'DC', '20036', 'USA') ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (9, 300, '70 Park Avenue Hotel', '70 Park Avenue', 'NY', 'NY', '10011', 'USA') ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (10, 300, 'Conrad Miami', '1395 Brickell Ave', 'Miami', 'FL', '33131', 'USA');
insert into Hotels (id, price, name, address, city, state, zip, country) values (11, 80, 'Sea Horse Inn', '2106 N Clairemont Ave', 'Eau Claire', 'WI', '54703', 'USA')  ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (12, 90, 'Super 8 Eau Claire Campus Area', '1151 W Macarthur Ave', 'Eau Claire', 'WI', '54701', 'USA') ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (13, 160, 'Marriot Downtown', '55 Fourth Street', 'San Francisco', 'CA', '94103', 'USA') ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (14, 200, 'Hilton Diagonal Mar', 'Passeig del Taulat 262-264', 'Barcelona', 'Catalunya', '08019', 'Spain');
insert into Hotels (id, price, name, address, city, state, zip, country) values (15, 210, 'Hilton Tel Aviv', 'Independence Park', 'Tel Aviv', '', '63405', 'Israel');
insert into Hotels (id, price, name, address, city, state, zip, country) values (16, 240, 'InterContinental Tokyo Bay', 'Takeshiba Pier', 'Tokyo', '', '105', 'Japan');
insert into Hotels (id, price, name, address, city, state, zip, country) values (17, 130, 'Hotel Beaulac', ' Esplanade L�opold-Robert 2', 'Neuchatel', '', '2000', 'Switzerland') ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (18, 140, 'Conrad Treasury Place', 'William & George Streets', 'Brisbane', 'QLD', '4001', 'Australia') ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (19, 230, 'Ritz Carlton', '1228 Sherbrooke St', 'West Montreal', 'Quebec', 'H3G1H6', 'Canada');
insert into Hotels (id, price, name, address, city, state, zip, country) values (20, 460, 'Ritz Carlton', 'Peachtree Rd, Buckhead', 'Atlanta', 'GA', '30326', 'USA') ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (21, 220, 'Swissotel', '68 Market Street', 'Sydney', 'NSW', '2000', 'Australia') ;
insert into Hotels (id, price, name, address, city, state, zip, country) values (22, 250, 'Meli� White House', 'Albany Street', 'Regents Park London', '', 'NW13UP', 'Great Britain');
insert into Hotels (id, price, name, address, city, state, zip, country) values (23, 210, 'Hotel Allegro', '171 West Randolph Street', 'Chicago', 'IL', '60601', 'USA');


