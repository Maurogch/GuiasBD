/*Ejercicio DER Pre-Parcial*/

/*CREATE DATABASE libros;*/

use libros;

CREATE TABLE nacionalidades(
    id_nacionalidad  tinyint unsigned ,
    nombre_pais varchar(50),
    constraint pk_nacionalidad  primary key (id_nacionalidad) ,
    constraint unq_nombre_pais unique (nombre_pais)
);

insert into nacionalidades(id_nacionalidad, nombre_pais) 
values (1, 'Argentina'), (2, 'Brasil'),(3, 'Chile');

create table autores (
    id_autor bigint unsigned auto_increment,
    nombre varchar(50),
    apellido varchar(50),
    id_nacionalidad tinyint unsigned,
    constraint pk_autor primary key (id_autor),
    constraint fk_autores_nacionalidad foreign key (id_nacionalidad) references nacionalidades(id_nacionalidad)
);

INSERT INTO autores (nombre, apellido, id_nacionalidad) values 
('Lalo', 'Landa',1), 
('Max','Power',2), 
('Armando','Barreda',3),
('Pablo','DeSantis',1);

create table estanterias(
    id_estanteria smallint unsigned auto_increment,
    numero int,
    sector int,
    constraint pk_estanteria primary key (id_estanteria)
    /* Poner la unique */
);
insert into estanterias(numero, sector) values (1,1),(1,2),(1,3),(2,1),(2,2),(2,3);

create table editoriales (
    id_editorial bigint unsigned auto_increment,
    nombre_editorial varchar(50),
    direccion varchar(50),
    constraint pk_editorial primary key (id_editorial)
    /* Crear unique*/
);

insert into editoriales(nombre_editorial, direccion) values ('Navarro Libros', 'aaa'), ('Pedro Perez Editorial','bbb');

CREATE table temas (
    id_tema int unsigned auto_increment, 
    nombre_tema varchar(50),
    constraint pk_tema primary key (id_tema)
);

insert into temas (nombre_tema) values ('Novela Gráfica'),('Política');


CREATE table usuarios (
    id_usuario int unsigned auto_increment,
    nombre varchar(50), 
    apellido varchar(50),
    dni varchar(12),
    constraint pk_usuarios primary key (id_usuario)
    /*Agregar uniques*/
);

insert into usuarios (nombre,apellido,dni) values 
('Jose','Lopez','111'),
('Leo', 'Fariña','222');

create table libros (
    id_libro bigint unsigned auto_increment,
    isbn varchar(50),
    titulo varchar(50),
    id_estanteria smallint unsigned,
    id_editorial bigint unsigned,
    constraint pk_libros primary key (id_libro),
    constraint fk_libros_estanterias foreign key  (id_estanteria) references estanterias (id_estanteria),
    constraint fk_libros_editoriales foreign key  (id_editorial) references editoriales (id_editorial)
);

insert into libros (isbn, titulo, id_estanteria, id_editorial)
values 
('1','Base de Datos I', 1,1),
('2','Base de Datos II', 2,2),
('2','Como aprobar Base de Datos I', 3,1);

create table temas_x_libro (
    id_libro bigint unsigned, 
    id_tema int unsigned,
    constraint pk_temas_x_libro primary key (id_libro, id_tema),                            
    constraint fk_libros_temas_x_libro foreign key  (id_libro) references libros (id_libro),
    constraint fk_temas_temas_x_libro foreign key  (id_tema) references temas (id_tema)
);

insert into temas_x_libro (id_libro, id_tema) values (4,1),(4,2),(5,2),(5,1),(6,1);

create table autores_x_libro (
    id_libro bigint unsigned, 
    id_autor bigint unsigned,
    constraint pk_autores_x_libro primary key (id_libro, id_autor),                            
    constraint fk_libros_autores_x_libro foreign key  (id_libro) references libros (id_libro),
    constraint fk_autores_autores_x_libro foreign key  (id_autor) references autores (id_autor)
);

insert into autores_x_libro (id_libro, id_autor) values (4,1),(4,2),(5,2),(5,1),(6,1);


create table prestamos (
    id_prestamo bigint unsigned auto_increment,
    fecha_retiro datetime,
    fecha_devolucion datetime,
    id_libro bigint unsigned,
    id_usuario int unsigned,
    constraint pk_prestamos primary key (id_prestamo),
    constraint fk_prestamos_libros foreign key (id_libro) references libros(id_libro),
    constraint fk_prestamos_usuarios foreign key (id_usuario) references usuarios(id_usuario)
);

insert into prestamos(fecha_retiro, fecha_devolucion, id_libro, id_usuario) 
values ('2018-09-05',null, 4,1), ('2018-09-05','2018-09-06', 5,2);
