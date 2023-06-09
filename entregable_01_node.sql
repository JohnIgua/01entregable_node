CREATE TYPE "level" AS ENUM (
  'Principiante',
  'Medio',
  'Avanzado'
);

CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE,
  "password" varchar NOT NULL,
  "age" int NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "teacher" varchar NOT NULL,
  "level" level,
  "categories_id" int
);

CREATE TABLE "course_video" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title_video" varchar NOT NULL,
  "url" varchar NOT NULL,
  "courses_id" int
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "registration" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "course_id" int,
  "user_id" int
);

ALTER TABLE "registration" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "registration" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");


insert into users (
	name,
	email,
	"password",
	age
) values (
	'Jorge Gaitan',
	'jorge.gaitan@hotmail.com',
	'root',
	'31'
);

insert into users (
	name,
	email,
	"password",
	age
) values (
	'Lorenzo Lamas',
	'lorenzo.lamas@hotmail.com',
	'root_2',
	'32'
);

insert into courses (
	title,
	description,
	teacher,
	level,
	categories_id
) values (
	'Algoritmos',
	'Introduccion a la teoria de algoritmos',
	'Jaime Lozano',
	'Principiante',
	1
);

insert into courses (
	title,
	description,
	teacher,
	level,
	categories_id
) values (
	'Bases de Datos',
	'Introduccion a las Bases de Datos',
	'Erminzul Montoya',
	'Medio',
	2
);

insert into categories (
	name
) values (
	'Programacion'
);

insert into categories (
	name
) values (
	'Ciencias Humanas'
);

insert into categories (
	name
) values (
	'Ciencias de la Salud'
);

insert into course_video (
	title_video,
	url,
	courses_id
) values (
	'Introduccion a los Algoritmos',
	'http:introduccion_a_los_algoritmos',
	2
);

insert into course_video (
	title_video,
	url,
	courses_id
) values (
	'Introduccion a las Bases de Datos',
	'http:introduccion_a_las_bases_de_datos',
	3
);

insert into registration (
	course_id,
	user_id
) values (
	2,
	1
);

insert into registration (
	course_id,
	user_id
) values (
	3,
	2
);



