SELECT cine.idCine AS "Cine-cine", sala.idCine AS "cine-sala",
cine.nombreCine, cine.poblacionCine, sala.idSala, sala.butacasSala
FROM cine, sala WHERE cine.idCine = sala.idCine;

-- Join equivalente al select de arriba

SELECT cine.idCine AS "cine-Cine", sala.idCine AS "cine-Sala",
cine.nombreCine, cine.poblacionCine, sala.idSala, sala.butacasSala
FROM cine INNER JOIN sala ON cine.idCine = sala.idCine;


-- Subconsultas escalonadas

SELECT * FROM empleado WHERE empleado.sueldoEmp =
(SELECT MAX(empleado.sueldoEmp) FROM empleado);

-- Si queremos conocer los hoteles donde ninguna habitación vale más de 100 €, ¿cómo lo haríamos?



select hotel.nombreHotel from hotel where not exists(select * from habitacion where habitacion.idHotel = hotel.idHotel AND precio <= 100);

SELECT nombreHotel, idHotel FROM hotel WHERE hotel.idHotel NOT IN (SELECT habitacion.idHotel FROM habitacion WHERE precio <= 100);


SELECT DISTINCT nombreEmp, apellidoEmp FROM empleado WHERE idHotel IN (SELECT idHotel FROM hotel WHERE poblacionHotel='Carlet' OR poblacionHotel='Sueca');
