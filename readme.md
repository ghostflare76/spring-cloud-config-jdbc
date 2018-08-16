# Spring Cloud Config Server With JDBC #

# Dependencies

- java: 1.8
- spring-boot: 2.0.2.RELEASE
- spring-cloud: Finchley.SR1
- spring-jdbc
- spring-data-jpa
- h2


# Quick Start #


Download the jar though Maven:

```xml
<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>spring-cloud-config-server</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-configuration-processor</artifactId>
			<optional>true</optional>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-jdbc</artifactId>
		</dependency>
		<dependency>
			<groupId>com.h2database</groupId>
			<artifactId>h2</artifactId>
			<scope>runtime</scope>
		</dependency>

		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-data-jpa</artifactId>
		</dependency>
```

# Usage

1. Add the dependency:

2. Set the active profile as "jdbc"

spring.profiles.active=jdbc

3. Configure the datasource (Just like any spring-boot application)

- spring.datasource.url=jdbc:h2:~/test
- spring.datasource.driver-class-name=org.h2.Driver
- spring.datasource.username=sa
- spring.datasource.platform=h2

4. Create a table for each application and environment that you need

4.1. Table name must be: [application_name]-[profile]

4.2. Fields must be: string, string, string, string

Example:

- applicationName: demo
- profile: opdev
- label : master

# script
```
CREATE TABLE properties (
	KEY VARCHAR(100) NOT NULL ,
	VALUE VARCHAR(100) NULL ,
	APPLICATION VARCHAR(128) NOT NULL ,
	PROFILE VARCHAR(128) NOT NULL,
	LABEL VARCHAR(128) NOT NULL,
	PRIMARY KEY (KEY, APPLICATION, PROFILE, LABEL)
);

insert into properties values ('name','kim','demo','opdev','master');
insert into properties values ('name','hong','demo','rc','master');
insert into properties values ('name','lee','demo','live','master');
```

# Run
1. Server
- http://localhost:30010/demo/opdev
- http://localhost:30010/demo/rc
- http://localhost:30010/demo/live

2. Client
- http://localhost:30000/name

