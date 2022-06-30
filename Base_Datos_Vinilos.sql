DROP TABLE DISCOGRAFICA CASCADE CONSTRAINTS;
DROP TABLE EMPRESAGRAFICA CASCADE CONSTRAINTS;
DROP TABLE ESTUDIO CASCADE CONSTRAINTS;
DROP TABLE GRUPO CASCADE CONSTRAINTS;
DROP TABLE LP CASCADE CONSTRAINTS;
DROP TABLE RADIO CASCADE CONSTRAINTS;
DROP TABLE VINILO CASCADE CONSTRAINTS;
DROP TABLE EMISION CASCADE CONSTRAINTS;
DROP TABLE SINGLE CASCADE CONSTRAINTS;
DROP TABLE RANKING CASCADE CONSTRAINTS;
DROP TABLE TEMA CASCADE CONSTRAINTS;



CREATE TABLE RADIO(
    nombre VARCHAR2(50) PRIMARY KEY,
    direccion VARCHAR2(50) NOT NULL,
    web VARCHAR2(50)NOT NULL,
    email VARCHAR2(50) NOT NULL,
    telefono NUMBER(9) NOT NULL

);

CREATE TABLE ESTUDIO(
    nombreEstudio VARCHAR2(50) PRIMARY KEY ,
    direccion VARCHAR2(50) NOT NULL,
    telefono NUMBER(9) NOT NULL,
    pais VARCHAR2(10) NOT NULL

);
CREATE TABLE DISCOGRAFICA(
    nombre VARCHAR2(50) PRIMARY KEY ,
    direccion VARCHAR2(50) NOT NULL,
    telefono NUMBER(9) NOT NULL,
    pais VARCHAR2(50) NOT NULL
  

);
CREATE TABLE GRUPO(
    nombre VARCHAR2(50) PRIMARY KEY ,
    anyoFundacion NUMBER(4),
    pais VARCHAR2(50) 


);
CREATE TABLE EMPRESAGRAFICA(
    nombre VARCHAR2(50) PRIMARY KEY ,
    direccion VARCHAR2(50) NOT NULL,
    pais VARCHAR2(50) NOT NULL
);

CREATE TABLE VINILO(
    ISVN NUMBER(9) PRIMARY KEY,
    discografica VARCHAR2(50) NOT NULL,
    fechaLanz DATE NOT NULL,
    copiasVendidas NUMBER(4,0),
    grupo VARCHAR2(50) NOT NULL,
    empresaGrafica VARCHAR2(50),
    FOREIGN KEY (discografica)REFERENCES  DISCOGRAFICA,
    FOREIGN KEY (grupo)REFERENCES  GRUPO,
    FOREIGN KEY (empresaGrafica)REFERENCES EMPRESAGRAFICA


);
CREATE TABLE LP(
    ISVN NUMBER(9) PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    copiasLanzamiento NUMBER(4) NOT NULL,
    FOREIGN KEY (ISVN) REFERENCES VINILO(ISVN)
);
CREATE TABLE SINGLE(
    ISVN NUMBER (10) PRIMARY KEY,--no entiendo a que se refiere el enunciado
    ISVNLP NUMBER(10) NOT NULL,--CHECK MISMA TUPLA
    CHECK (ISVN <> ISVNLP),
    FOREIGN KEY (ISVN) REFERENCES VINILO(ISVN),
    FOREIGN KEY (ISVNLP) REFERENCES LP(ISVN)

);

CREATE TABLE RANKING(
    anyo NUMBER(4),
    semana NUMBER(2),
    primero NUMBER(10) NOT NULL,-- 
    segundo NUMBER(10) NOT NULL,
    tercero NUMBER(10) NOT NULL,
    PRIMARY KEY (anyo,semana),
    FOREIGN KEY(primero) REFERENCES SINGLE,
    FOREIGN KEY(segundo) REFERENCES SINGLE,
    FOREIGN KEY(tercero) REFERENCES SINGLE

);

CREATE TABLE TEMA(
    codigo NUMBER(10) PRIMARY KEY, 
    titulo VARCHAR2(50) NOT NULL ,
    duracion NUMBER(4,2) NOT NULL, 
    autor VARCHAR2(50) NOT NULL,
    estudio VARCHAR2(50),
    LP NUMBER(10),
    cara_LP CHAR(1) NOT NULL
        CONSTRAINT A_o_B
        CHECK (cara_LP IN('A','B')),
    pista_LP NUMBER(2), 
    CHECK (pista_LP<=12),
    singles NUMBER(10),
   cara_single CHAR(1) NOT NULL
        CONSTRAINT A_oR_B
        CHECK (cara_single IN('A','B')),
    pista_single NUMBER(1),
    CHECK (pista_single<=2),
    FOREIGN KEY (estudio) REFERENCES ESTUDIO,
    FOREIGN KEY (LP) REFERENCES LP,
    FOREIGN KEY (singles) REFERENCES SINGLE,
    CONSTRAINT tema_UK UNIQUE (titulo,autor)
    -- como definir una restricciï¿½n para que tres atributos sean nulos, es decir en cuanto uno es nulo los otros tambiï¿½n, CHECK
    
);

CREATE TABLE EMISION(
    radio VARCHAR2(50),
    fechaHora DATE,
    tema NUMBER(10) NOT NULL,
    PRIMARY KEY (radio,fechahora),
    
    FOREIGN KEY(radio)REFERENCES RADIO,
    FOREIGN KEY(tema)REFERENCES TEMA



);



    --insertar datos--
    --insertar datos-radio--
    INSERT INTO RADIO(nombre,direccion,web,email,telefono)VALUES('Cadena Ser','Calle la depresion numero 27','Cadenaser.es','cadenaser@gmail.com','122322558');
    INSERT INTO RADIO(nombre,direccion,web,email,telefono)VALUES('Los 40','Calle la depresion 32 bajo C','Los40music.es','los40@gmail.com','988332274');
    INSERT INTO RADIO(nombre,direccion,web,email,telefono)VALUES('Radio Ole','Avenida de UML, S/N','OleMiAndalucia.es','radioOle@gmail.com','857372565');
    INSERT INTO RADIO(nombre,direccion,web,email,telefono)VALUES('Andalucia Onda','Paseo de los cordobeses 36','Andalucia4Ever.es','andaluciaonda@gmail.com','457389508');
    INSERT INTO RADIO(nombre,direccion,web,email,telefono)VALUES('Kiss My BD','TravesÃ­a de los SQLs','BDSQL.es','kissBD@gmail.com','897202588');
    INSERT INTO RADIO(nombre,direccion,web,email,telefono)VALUES('Radio 666','Calle de los caidos en clase, 87 3ÂºA','caimoscomomoscas.es','radio666@gmail.com','122322558');
    INSERT INTO RADIO(nombre,direccion,web,email,telefono)VALUES('C3 Radio','Camino de la quinta puÃ±eta (Aranjuez)','Aranjuez.es','C3radio@gmail.com','896002278');
    --
    --insertar datos-estudio--
    INSERT INTO ESTUDIO(nombreEstudio,direccion,telefono,pais)VALUES ('Estudio Pepe','Avenida de los Datos infinitos, S/N','893227456','Aranjuez');
    INSERT INTO ESTUDIO(nombreEstudio,direccion,telefono,pais)VALUES ('Estudio Santas practicas','Camino de las practicas, 23','789237687','Peru');
    INSERT INTO ESTUDIO(nombreEstudio,direccion,telefono,pais)VALUES ('Estudio Dejar la carrera','Calle necesito un generador de datos, 87','789027925','C3');
    INSERT INTO ESTUDIO(nombreEstudio,direccion,telefono,pais)VALUES ('Estudio Tengo Suenio records','Traveia de las ovejitas, 43','872025487','Espana');
    INSERT INTO ESTUDIO(nombreEstudio,direccion,telefono,pais)VALUES ('Estudio quiero acabar lyrics','Avenida de los Datos infinitos, S/N','803236400','Argentina');
    INSERT INTO ESTUDIO(nombreEstudio,direccion,telefono,pais)VALUES ('Estudio Comida a domicilio songs','Avenida Tengo hambre, 36','883272006','Venezuela');
    INSERT INTO ESTUDIO(nombreEstudio,direccion,telefono,pais)VALUES ('Estudio Pizzas records','Paseo Del queso, 47 1ÂºC escalera izquierda','783007866','China');
    --
    --insertar datos-discografica--
    INSERT INTO DISCOGRAFICA(nombre,telefono,direccion,pais)VALUES ('Grabaciones Pepe','985220272','Avenida de SQL , 29 3ÂºC','Aranjuez');
    INSERT INTO DISCOGRAFICA(nombre,telefono,direccion,pais)VALUES ('Discos Los jojos','785003875','Avenida Steel Ball Run Anime, 34','China');
     INSERT INTO DISCOGRAFICA(nombre,telefono,direccion,pais)VALUES ('Grabaciones Vacaciones','002228789','Paseo Yate de Ibiza 34','Rusia');
    INSERT INTO DISCOGRAFICA(nombre,telefono,direccion,pais)VALUES ('Discos los datos','786001789','Calle de los SQL infinitos','Aranjuez');
    INSERT INTO DISCOGRAFICA(nombre,telefono,direccion,pais)VALUES ('Grabaciones de discografica Comida Records','986031789','Via de los discos','Spain');
    INSERT INTO DISCOGRAFICA(nombre,telefono,direccion,pais)VALUES ('Pepita Records','987203786','Camino de las tortugas','Portugal');
    INSERT INTO DISCOGRAFICA(nombre,telefono,direccion,pais)VALUES ('AoHaru Records','302339458','Carretera a extremadura, 39, S/N','Marruecos');
    --
    --insertar datos-grupo--
    INSERT INTO GRUPO(nombre,anyoFundacion,pais)VALUES('Mentes Criminales','2022','Estados Unidos');
    INSERT INTO GRUPO(nombre,anyoFundacion,pais)VALUES('Anatomia de Grey','2021','Canada');
    INSERT INTO GRUPO(nombre,anyoFundacion,pais)VALUES('Arcane','2007','Spain');
    INSERT INTO GRUPO(nombre,anyoFundacion,pais)VALUES('La Casa de Papel','2008','Francia');
    INSERT INTO GRUPO(nombre,anyoFundacion,pais)VALUES('Fargo','2009','Spain');
    INSERT INTO GRUPO(nombre,anyoFundacion,pais)VALUES('El Juego del Calamar','2010','Suiza');
    INSERT INTO GRUPO(nombre,anyoFundacion,pais)VALUES('Frozen','2011','Noruega');
    --
    --insertar datos-empresagrafica--
    INSERT INTO EMPRESAGRAFICA(nombre,direccion,pais)VALUES('Empresa de las vacas asturianas que pintan cosas', 'Calle Almeria,37 3A','Andalucia');
    INSERT INTO EMPRESAGRAFICA(nombre,direccion,pais)VALUES('Queso rallado impresiones', 'Calle Cordobaa,85 7A','Espana');
    INSERT INTO EMPRESAGRAFICA(nombre,direccion,pais)VALUES('Flamenquines con patatas', 'Calle Sevilla,48','Alemania');
    INSERT INTO EMPRESAGRAFICA(nombre,direccion,pais)VALUES('Vinitos graficos', 'Calle Huelva,397','Bielorrusia');
    INSERT INTO EMPRESAGRAFICA(nombre,direccion,pais)VALUES('Fresas graficas', 'Calle Jaen,95','Andalucia');
    INSERT INTO EMPRESAGRAFICA(nombre,direccion,pais)VALUES('Xerez impresiones', 'Calle Cadiz,37 8A derecha','Ucrania');
    INSERT INTO EMPRESAGRAFICA(nombre,direccion,pais)VALUES('La granaina impresiones', 'Calle Granada,87','Rumania');
    --
    --insertar dato-vinilo--
    INSERT INTO VINILO(ISVN,discografica,fechaLanz,copiasVendidas,grupo,empresaGrafica)VALUES('111131','Grabaciones Pepe',to_date('16/04/2022', 'dd/mm/yyyy'),'3','Mentes Criminales','Empresa de las vacas asturianas que pintan cosas');
    INSERT INTO VINILO(ISVN,discografica,fechaLanz,copiasVendidas,grupo,empresaGrafica)VALUES('111132','Discos Los jojos',to_date('05/09/2022', 'dd/mm/yyyy'),'4','Anatomia de Grey','Queso rallado impresiones');
    INSERT INTO VINILO(ISVN,discografica,fechaLanz,copiasVendidas,grupo,empresaGrafica)VALUES('111133','Discos los datos',to_date('04/07/2009', 'dd/mm/yyyy'),'6','Arcane','Flamenquines con patatas');
    INSERT INTO VINILO(ISVN,discografica,fechaLanz,copiasVendidas,grupo,empresaGrafica)VALUES('111134','Discos los datos',to_date('09/09/2008', 'dd/mm/yyyy'),'12','Arcane','Vinitos graficos');
    INSERT INTO VINILO(ISVN,discografica,fechaLanz,copiasVendidas,grupo,empresaGrafica)VALUES('111135','Grabaciones de discografica Comida Records',to_date('12/12/2021', 'dd/mm/yyyy'),'1','Fargo','Fresas graficas');
    INSERT INTO VINILO(ISVN,discografica,fechaLanz,copiasVendidas,grupo,empresaGrafica)VALUES('111136','Pepita Records',to_date('19/03/2021', 'dd/mm/yyyy'),'7','Fargo','Xerez impresiones');
    INSERT INTO VINILO(ISVN,discografica,fechaLanz,copiasVendidas,grupo,empresaGrafica)VALUES('111137','AoHaru Records',to_date('07/07/2021', 'dd/mm/yyyy'),'8','Arcane','La granaina impresiones');
    
    --select * from grupo;
    --select * from empresagrafica;
    --select * from discografica;
    --select * from vinilo;
    --desc vinilo
    
    --
    --insertar  dato-lp--
    INSERT INTO LP (ISVN,titulo,copiasLanzamiento)VALUES('111131','Chanclas voladoras','2');
    INSERT INTO LP (ISVN,titulo,copiasLanzamiento)VALUES('111132','Desierto sin arena','1');
    INSERT INTO LP (ISVN,titulo,copiasLanzamiento)VALUES('111134','Usen los pasos habilitados','7');
    INSERT INTO LP (ISVN,titulo,copiasLanzamiento)VALUES('111133','Discos los datos','27');
    
    --
    --insertar dato-single--
    INSERT INTO SINGLE (ISVN,ISVNLP)VALUES ('111135','111131');
    INSERT INTO SINGLE (ISVN,ISVNLP)VALUES ('111136','111132');
    INSERT INTO SINGLE (ISVN,ISVNLP)VALUES ('111137','111134');
   
    
    --desc SINGLE
    --
    --insert dato-ranking--
    INSERT INTO RANKING (anyo,semana,primero,segundo,tercero)VALUES('2005','3','111135','111136','111137');
    INSERT INTO RANKING (anyo,semana,primero,segundo,tercero)VALUES('2006','4','111136','111136','111137');
    INSERT INTO RANKING (anyo,semana,primero,segundo,tercero)VALUES('2008','5','111137','111136','111136');
    
    --
    --insertar dato-tema--
    
    INSERT INTO TEMA(codigo,titulo,duracion,autor,estudio,LP,cara_LP,pista_LP,singles,cara_single,pista_single)VALUES('000001','Enero','3,15','Lopez','Estudio Pepe','111134','A','2','111137','B','2');
    INSERT INTO TEMA(codigo,titulo,duracion,autor,estudio,LP,cara_LP,pista_LP,singles,cara_single,pista_single)VALUES('000002','Junio','3,15','Perez','Estudio Dejar la carrera','111132','A','4','111136','B','2');
    INSERT INTO TEMA(codigo,titulo,duracion,autor,estudio,LP,cara_LP,pista_LP,singles,cara_single,pista_single)VALUES('000003','Julio','3,38','Camino','Estudio Dejar la carrera','111131','B','8','111137','B','1');
    INSERT INTO TEMA(codigo,titulo,duracion,autor,estudio,LP,cara_LP,pista_LP,singles,cara_single,pista_single)VALUES('000004','Mayo','3,45','Camino','Estudio Pizzas records','111134','B','8','111137','B','1');

    --
    --insertar dato-emision--
    INSERT INTO EMISION (radio,fechahora,tema)VALUES('Cadena Ser',to_date('16/11/2021', 'dd/mm/yyyy'),'000001');
    INSERT INTO EMISION (radio,fechahora,tema)VALUES('Los 40',to_date('27/05/2006', 'dd/mm/yyyy'),'000002');
    INSERT INTO EMISION (radio,fechahora,tema)VALUES('Radio Ole',to_date('16/08/2022', 'dd/mm/yyyy'),'000003');
    INSERT INTO EMISION (radio,fechahora,tema)VALUES('Radio Ole',to_date('16/08/2021', 'dd/mm/yyyy'),'000002');
    INSERT INTO EMISION (radio,fechahora,tema)VALUES('Andalucia Onda',to_date('27/05/2021', 'dd/mm/yyyy'),'000001');
   
    --
    
    /*EJER 3*/

--3.1 Añada una restricción sin nombre que compruebe que los únicos países válidos 
/*para los Estudios de grabación son “España”, “Francia” e “Italia”. Intente actualizar
los datos de modo que se viole dicha restricción. Elimine la restricción y vuelva a añadirla, 
esta vez con un nombre. Vuelva a intentar actualizar los datos de modo que se viole 
la restricción y compruebe las diferencias.IT WORKS!!!*/
ALTER TABLE ESTUDIO 
ADD constraint cosas CHECK (pais IN ('Espana','Francia','Aranjuez')); --Si quieres quitarle el nombre, quita el constraint cosas y lo tienes
--Es recomendable siempre nombrar a las cosas, sobretodo para poder hacer un disable constraint

SELECT * FROM ESTUDIO;

--3.2 Recoja que dos emisoras de radio no pueden tener la misma URL (web). 
/*Intente insertar una nueva emisora con una dirección web (URL) 
que sea la misma que alguna ya insertada. Compruebe que no es posible realizarlo
debido a la restricción introducida. Deshabilítela (SIN borrarla) e inserte de 
nuevo la emisora.*/

ALTER TABLE RADIO
ADD CONSTRAINT UK_WEB UNIQUE (web);
SELECT * FROM RADIO;

INSERT INTO RADIO(nombre,direccion,web,email,telefono)VALUES('C5 Radio','Camino de la quinta puÃ±eta (Aranjuez)','Aranjuez.es','C3radio@gmail.com','896002278');

ALTER TABLE RADIO
DISABLE CONSTRAINT UK_WEB;

--ESTE ES UN BUIEN EJEMPLO DE PORQUÉ DEBEMOS NOMBRAR LAS CONSTRAINTS.
--En el caso de no tener nom,brada una constraint por lo que sea, debermos obtener el código que les asigna SQL.

--3.3 It works
/*Modifique el esquema para permitir guardar un nuevo campo obligatorio que almacene
la fecha de fundación de las radios. Compruebe si es posible. En caso negativo,
resuélvalo (sin borrar ni los datos ni la tabla) y compruebe que la modificación
ha sido realizada, mostrando la estructura de la tabla tras la modificación.*/

ALTER TABLE RADIO
ADD Fecha_fundacion DATE DEFAULT to_date('16/04/2003', 'dd/mm/yyyy') NOT NULL;

SELECT * FROM RADIO;
--3.4 El estudio ya puede ser nulo, por lo que lo hacemos con el autor. IT WORKS!
/*Añada una restricción que permita que el estudio de grabación de los temas 
pueda ser desconocido.*/

ALTER TABLE TEMA
MODIFY Autor NULL;

INSERT INTO TEMA(codigo,titulo,duracion,autor,estudio,LP,cara_LP,pista_LP,singles,cara_single,pista_single)VALUES('000027','Baril','3,45',NULL,'Estudio Pizzas records','111134','B','8','111137','B','1');

SELECT * FROM TEMA;

/*EJER 4*/

--4.1 IT WORKS 
/*Modifique el atributo “fechahora” de las emisiones de radio del 27/10/1987 
incrementándolo en 2 minutos, al haber tenido un problema con el reloj.*/
UPDATE EMISION
SET fechaHora = fechaHora + 2/1440;



SELECT * FROM EMISION;

/*NOTA EXPLICATIVA:
El dos del numerador es lo que queremos añadir y ese 1440 viene de hacer 24 horas de
un día por 60 minutos de una hora, si quisieramos sumar le 27 días hubiera sido un:
UPDATE EMISION
SET fechaHora = fechaHora + 27;
*/

SELECT to_char(FECHAHORA, 'dd/mm/yyyy hh24:mi:ss ') FROM EMISION; --para ver los minutos y segundos

/*
select sysdate+1 from dual;
select to_char(sysdate+ (2/1440), 'dd/mm/yyyy hh24:mi:ss') from dual;
*/

--4.2 IT WORKS
/*Duplique el número de copias de lanzamiento para los LPs del grupo "Queen”.*/


UPDATE LP
SET copiasLanzamiento = (copiasLanzamiento * 2)
WHERE ISVN IN (SELECT ISVN FROM VINILO WHERE grupo = 'Arcane');

--4.3 it works
/*Incremente en 100 unidades el total de copias vendidas de los vinilos producidos 
por la discográfica " RCA".*/

UPDATE VINILO
SET copiasVendidas = copiasVendidas + 100
WHERE discografica = 'Grabaciones Pepe';

--4.4 it works
/*Elimine de la tabla de singles aquellos que no hayan conseguido entrar,
al menos, dos veces en el ranking, en cualquiera de las 3 posiciones.*/

SELECT *  FROM RANKING;

/*INTENTO EXPLICATIVO:
Aquí unimos todos aquellos que hayan estado alguna vez en el ranking más de una 
vez (usando el having > 1 controlamos esto) y borramos aquellos que no coincidan con
ese criterio. Es decir:
1º Sacamos en la consulta interna aquellos que aparezcan más de una vez en la unión de
las posiciones primero, segundo y tercero del ranking.
2º con el WHERE ISVN NOT IN sacamos aquéllos que NO esten en  la selección interna.
3º Con el delete los eliminamos de la tabla.*/

DELETE 
FROM SINGLE 
WHERE ISVN NOT IN (
SELECT  posicion 
FROM(
    SELECT primero POSICION FROM RANKING
    UNION ALL
    SELECT SEGUNDO FROM RANKING
    UNION ALL
    SELECT TERCERO FROM RANKING
    )
GROUP BY (POSICION)
HAVING count(posicion) > 1);

--4.5 -it works
/*Elimine las estaciones de radio que no han emitido ningún tema en el año actual.*/

/*
NOTA EXPLICATIVA:
Tenemos una clavbe ajena que une las dos tablas, de manera que para eliminar una radio, 
antes debes eliminar sus emisiones.
Con una vista no era posible sacar y almacenar la información uqe necesitámos, así que
nos creamos una tabla intermedia de emisiones en el último año para realizar esta consulta.
Como indiqué al principio, por la restriucción de clave ajena, primero nos cargamos
a las referencias y lugo eliminamos lo que teníamos uqe eliminar (las radios).

*/
CREATE TABLE Emisiones_ultimo_anyo2
AS (SELECT radio
        FROM EMISION
        WHERE (to_char (fechahora,'yyyy') = to_char (sysdate,'yyyy')));

DELETE
FROM EMISION
WHERE radio in(SELECT * FROM Emisiones_ultimo_anyo2);

DELETE 
FROM RADIO 
WHERE nombre in (SELECT * FROM Emisiones_ultimo_anyo2); --Tendría que borrar todas menos cadena ser que emitió en 2021
        

        
/*EJER 5*/

--5.1 It works
/*Cree una vista que contenga el título de cada LP, el título, cara y pista de 
los temas que lo forman, ordenado por título del LP, cara y pista. 
Intente insertar una nueva fila en la vista.*/

CREATE VIEW LP_TITULO_CARA_PISTA2
AS (SELECT LP,titulo,pista_LP,cara_LP
FROM TEMA );

--5.2 NO LO ENTIENDO BIEN (preguntar a Irene)
/*Cree una vista que contenga el título de cada LP y el número total de temas
que tiene, ordenado por título.*/
SELECT * FROM LP;
SELECT * FROM TEMA;

CREATE VIEW TituloLP_TotalTemas2
AS(SELECT titulo as titulo_id, COUNT(*) as count_id FROM LP GROUP BY titulo); --Im,portante nombrar las cosas

--5.3 

/*Cree una vista que contenga el nombre y el año de fundación de los grupos.
Intente insertar un nuevo grupo en la vista. A continuación, consulte la 
tabla de grupos.*/

CREATE VIEW nombre_anyofund
AS (SELECT nombre, anyoFundacion FROM GRUPO);

SELECT * FROM nombre_anyofund; --Así se muestra una vista, es como una tabla temporal que nos saca cosas.

/*EJER 6*/

--6.1 Singles de grupos españoles IT WORKS
/*Este es un ejemplo de encadenar consultas que nos dan lo que necesitamos.*/
SELECT *
FROM SINGLE
WHERE ISVN IN (
                SELECT ISVN 
                FROM VINILO
                WHERE grupo IN (
                                SELECT nombre
                                FROM GRUPO
                                WHERE pais IN ('Spain')));
                                
--6.2 Títulos de temas que no se han pinchado nunca en la radio. IT WORKS!!

SELECT * FROM TEMA;
SELECT * FROM EMISION;

SELECT titulo
FROM TEMA
WHERE codigo NOT IN (
                    SELECT tema
                    FROM EMISION);
--6.3 LPs de los que no se han sacado ningún single.
SELECT *
FROM LP
WHERE ISVN NOT IN (SELECT ISVNLP FROM SINGLE);

--6.4 Duración media de todos los singles.
SELECT AVG (duracion)
FROM TEMA
WHERE singles IN (SELECT ISVN FROM SINGLE);

--6.5 ISVN del single, Título del LP al quer pertenece, nº de semanas en primer lugar del ranking en 1990.
--Se cambia el año de 1990 a 2008 para que coincida con nuestros datos sin tener que modificar la tabla por
--enésima vez 

/*
*/
SELECT single.ISVN as single_ISVN, LP.titulo as LP_titulo, A. N_SEMANA
FROM LP JOIN SINGLE 
ON (LP.ISVN = single.ISVNLP) 
JOIN
(SELECT count(semana) N_SEMANA, PRIMERO ISVN_S FROM RANKING WHERE ANYO='2008' GROUP BY PRIMERO) A
ON (A.ISVN_S = SINGLE.ISVN);

--GROUP BY SINGLE.ISVN;

-- 6.6 Numero de temas pinchados por cada emisora en el año actual

SELECT COUNT(TEMA), radio
FROM EMISION
WHERE (to_char (fechahora,'yyyy') = to_char (sysdate,'yyyy')) --Forma de sacar las fechas y la fecha actual.
GROUP BY radio;

--6.7 Nacionalidades de los tres grupos que han publicado más vinilos en total --No sé porqué no funciona
SELECT * FROM VINILO;
SELECT * FROM GRUPO;

/* DOESN'T WORK
SELECT G.PAIS,G.NOMBRE
FROM GRUPO G
JOIN (SELECT COUNT(V.GRUPO) CONTAR ,V.GRUPO
FROM VINILO V
GROUP BY V.GRUPO) A 
ON (G.NOMBRE = A.GRUPO)
ORDER BY A.CONTAR DESC; */

--it works

SELECT *
FROM (  SELECT G.PAIS,G.NOMBRE
        FROM GRUPO G
        JOIN (SELECT COUNT(V.GRUPO) CONTAR ,V.GRUPO
                FROM VINILO V
                GROUP BY V.GRUPO) A 
                ON (G.NOMBRE = A.GRUPO)
                ORDER BY A.CONTAR DESC)
        WHERE (ROWNUM < 4); --rWONUM = IDENTIFICADOR DE CADA COLUMNA (FIJARSE EN SALIDA DE COMANDOS)


SELECT PAIS, NOMBRE
FROM GRUPO;

SELECT COUNT(GRUPO),GRUPO
FROM VINILO
GROUP BY GRUPO;

--6.8 Grupo más escuchado en el último año. NI IDEA

/*gRUPO CON MÁS TEMAS EMITIDOS EN RADIO.
SACAR GRUPOS QUE HAN EMITIDO
CONTAR TEMAS QUE SE HAN EMITIDO.
sACAR EL MAX
*/

SELECT * FROM EMISION;
SELECT * FROM TEMA;

SELECT AUTOR
FROM TEMA 
WHERE CODIGO IN(
                SELECT TEMA FROM( SELECT TEMA, max (c) M
                    FROM( 
                        SELECT TEMA, COUNT (TEMA) c
                        FROM EMISION
                        GROUP BY TEMA)
                    GROUP BY TEMA
                ORDER BY M desc)
                WHERE ROWNUM = 1);
                
--6.9 Nombre del grupo menos escuchado de las emisoras españolas.

/*same que el anterior con minimos.
sacar tema de emision
sacar grupo de vinilo
count y max/min*/
SELECT AUTOR
FROM TEMA 
WHERE CODIGO IN(
                SELECT TEMA FROM( SELECT TEMA, MIN (c) M
                    FROM( 
                        SELECT TEMA, COUNT (TEMA) c
                        FROM EMISION
                        GROUP BY TEMA)
                    GROUP BY TEMA
                ORDER BY M ASC)
                WHERE ROWNUM = 1);
                

/*6.10 Grupos cuyos vinilos están producidos por dsicográfica de su misma nacionalidad IT WORKS!!*/ 

SELECT DISTINCT GRUPO
FROM VINILO
WHERE GRUPO IN ((SELECT NOMBRE FROM GRUPO WHERE PAIS IN (SELECT PAIS FROM DISCOGRAFICA)));

/*fUNCIONAMIENTO Y DIFERTENCIAS ENTRE JOIN Y OUTER (EXPLICAR MAS TARDE)*/
SELECT * 
FROM TEMA JOIN EMISION
ON TEMA.CODIGO = EMISION.TEMA;

SELECT *
FROM TEMA LEFT JOIN EMISION
ON TEMA.CODIGO = EMISION.TEMA;

SELECT *
FROM EMISION RIGHT JOIN RADIO
ON RADIO.NOMBRE = EMISION.RADIO;

/*EJER 7*/
--7.1 Queremos añadir info de los miembros de un grupo anyada la tabla miembros.

CREATE TABLE MIEMBRO (
/**/
    Codigo_m NUMBER PRIMARY KEY,
    Nombre_m VARCHAR2(50),
    Fecha_nac DATE NOT NULL,
    Pais_nac VARCHAR2(50) NOT NULL,
    Grupo VARCHAR2(50),
    
    CONSTRAINT FK_Grupo FOREIGN KEY (GRUPO) REFERENCES GRUPO(NOMBRE)
);

ALTER TABLE GRUPO ADD Miembro NUMBER;
ALTER TABLE GRUPO ADD CONSTRAINT FK_Miembro FOREIGN KEY (MIEMBRO) REFERENCES MIEMBRO(Codigo_m);

SELECT * FROM GRUPO;

--7.2 Modificar Ranking para meter más puestos

ALTER TABLE RANKING ADD Cuarto NUMBER(10) DEFAULT 0000000000 NOT NULL;
--Si va a ser no nula siempre añadir un valor por defecto.
--Si no se especifica nada el enunciado: Comentario explicando nuetsra suposición y por qué
-- Number or INT? number dos parametrso (digitos y precision(decimales)) Como int pero puedes poner decimales, limitar cosas etc (buscar)
-- Having VS Order BY --> AGRUPAR ES DECIR QUE TABLA CON FILAS INDIVIDUALES, AL AGRUPAR POR ATRIBUTO SE CONVIERTE EN TABLA NUEVA CON TANTAS FILAS COMO VALORES DISTINTOS TIENE EL GRUPO Y COLUMNAS SEGUN FUNCIONES DE AGREGACIÓN.
-- AGRUPAR != oRDENAR EJ: GRUPOS DEL PRIMERO DE RANKING POR ORDEN ALFABETICO = ORDER BY
-- GROUP BY ASOCIADO CON HAVING. HAVING = CLAUSULA PARA FILTRAR LOS GRUPOS --> EJEMPLO: CONTAR TEMAS DE CADA VINILO Y SOLO SACAR AQUELLOS QUE SEAN MAYORES DE 10 (+ 10 TEMAS).
/*
JOIN: AKA INNER JOIN. SI TENGO 2 TABLAS Y LAS QUIERO UNIR COMO UN JOIN SEGUN UNA COND. DE COMB. (PUEDE SR POR IGUALDAD O MAYOR O MÁS COSAS DENTRO DE COMBINACIÓN LOGICA).
NATURAL JOIN:cOMBINACIÓN POR IGUALDAD. DONDE (A.COD = V.COD). NOT MUCH USE.
FROM: Puedes pon er el join (donde combinas) o combinar primero con el porducto cartesiano (FROM, VINILO, TEMA WHERE (CONDICION QUE IBA A IR EN EL JOIN)
WHERE:
LEFT-OUTER: pRIMERO COMO UN INNER JOIN, (AQUELLAS QUE CUMPLEN LA CONDICION EN AMBAS TABLAS) DIFERENCIA: AÑADE AQUELLAS TUPLAS DE LA TABLA DE LA IZQUIERDA QUE NO COMBINAN CON LA DERECHA.



sI HAGO UN INNER JOIN ENTRE GRUPOS Y ALUMNOS, SACO SOLO AQUELLOS CON ALUMNOS MATRICULADOS, CON UN OUTER SACO TAMBIEN AQUELLOS SIN ALUMNOS MATRICULADOS.

RIGHT-OUTER:
*/
ALTER TABLE RANKING
ADD CONSTRAINT FK_Cuarto 
FOREIGN KEY(Cuarto) 
REFERENCES SINGLE(ISVN);

SELECT *  FROM RANKING;

--7.3 Modificar esquema para que haya vinilos en los que participan varios grupos y quitar restricción de aparecer solo un LP y un Single.

--7.4 ¿Podemos hacer con la consulta de antes que el mismo tema  tenga distintas apariciones y duraciones? Si, no  ¿Como haríamos para permitirlo?

--7.5 ¿Puede ser que los temas de un single no estén en el LP que hay en tema? Piensa soluciones

--7.6  ¿Cómo podem,os evitar que haya tantos nulls en Tema, teniendfo en cuenta que en la m,ayoría de temas no aparecen Singles?



