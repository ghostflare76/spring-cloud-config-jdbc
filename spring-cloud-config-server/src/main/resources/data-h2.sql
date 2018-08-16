DROP TABLE IF EXISTS properties;

CREATE TABLE properties (
	KEY VARCHAR(100) NOT NULL ,
	VALUE VARCHAR(100) NULL ,
	APPLICATION VARCHAR(128) NOT NULL ,
	PROFILE VARCHAR(128) NOT NULL,
	LABEL VARCHAR(128) NOT NULL,
	PRIMARY KEY (KEY, APPLICATION, PROFILE, LABEL)
);

insert into properties values ('name','hello','demo','opdev','master');
insert into properties values ('msg','world','demo','rc','master');
insert into properties values ('version','1.0','demo','live','master');