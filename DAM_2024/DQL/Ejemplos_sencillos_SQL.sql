/*
Consultas a realizar sobre la base de datos MCGRAWCINES:

Cuántos pueblos o ciudades tienen cines.

Cuántas salas hay en total en todos los cines.

Cuántas salas hay en un cine concreto.

Cuántas salas hay en todos los diferentes códigos de cine.

Código de salas y número de asientos.
 */

-- Cuántos pueblos o ciudades tienen cines.

select cine.poblacionCine from cine group by poblacionCine;

-- Cuántas salas hay en total en todos los cines.

select count(*) as total_salas from sala;

-- Cuántas salas hay en un cine concreto.

select count(*) from sala where sala.idCine = 1;

-- Cuántas salas hay en todos los diferentes códigos de cine.

select sala.idCine, count(*) from sala group by idCine;

-- codigo de salas y numero de asientos

select sala.idCine, max(sala.butacasSala) from sala group by idCine order by max(butacasSala);