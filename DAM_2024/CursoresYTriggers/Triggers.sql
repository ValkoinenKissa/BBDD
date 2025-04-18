/*
 Crea dos disparadores sobre la tabla MATRÍCULA, uno para el INSERT y otro para el UPDATE, que comprueben que
 la nota que se introduce en la tabla no sea menor que 0 (en ese caso se pondría 0)
 ni mayor que 10 (en cuyo caso se pondría un 10).
 */

create trigger trigger_actualizar_nota
    before insert
    on matricula
    for each row
begin
    if NEW.nota < 0 then
        set NEW.nota = 0;
    elseif NEW.nota > 10 then
        set NEW.nota = 10;
    end if;
end;


create trigger trigger_insertar_nota
    before update
    on matricula
    for each row
begin
    if NEW.nota < 0 then
        set NEW.nota = 0;
    elseif NEW.nota > 10 then
        set NEW.nota = 10;
    end if;
end;

-- Prueba de los triggers

update matricula set nota = -7 where NIA = 2809999 and idModulo = 0495;

update matricula set nota = 15 where NIA = 2809999 and idModulo = 0495;
