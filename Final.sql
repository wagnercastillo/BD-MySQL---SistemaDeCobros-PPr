DROP database if exists pasantias;
CREATE DATABASE IF NOT EXISTS pasantias;
use pasantias;

create table if not exists  persona(
	id_persona integer PRIMARY KEY auto_increment,
    cedula varchar(10) default null unique,
    nombre varchar(55) default null,
    apellidos varchar(55) default null,
    celular integer(10) default null,
    telefono integer(15) default null,
    provincia varchar(55) default null,
    direccion varchar(55) default null,
    correo varchar(55) default null
);

create table if not exists cliente (
	id_cliente integer PRIMARY KEY auto_increment,
    id_persona integer default null,
    calificacion varchar(55) default null
);

create table if not exists empleado (
	id_empleado integer primary key auto_increment,
    id_persona integer default null,
    periodo_contrato_inicio timestamp default now(),
    periodo_contrato_fin timestamp default now(),
    cargo varchar(55),
    sueldo integer default 0,
    experiencia varchar(55) default null,
    observaciones varchar(55) default null
);

/*create table if not exists rol(
id_rol integer primary key auto_increment,
nombre varchar(55)
);*/

create table if not exists tipo_servicio(
id_tipo_servicio integer primary key auto_increment,
nombre varchar(55) not null
);

create table if not exists servicio(
id_servicio integer primary key auto_increment,
id_institucion integer default null,
id_tipo_servicio integer default null,
periodo_servicio datetime default now()
);

create table  if not exists recaudacion(
id_recaudacion integer primary key auto_increment,
id_servicio integer default null,
id_persona integer default null,
id_empleado integer default null,
fecha_limite_recaudacion datetime default now(),
id_recargo integer default null, 
descripcion_recaudacion varchar(255) default null, 
lugar_recaudacion varchar(55),
id_cuota integer default null,
id_pago integer default null
);

create table if not exists pago(
id_pago integer primary key auto_increment,
id_metodo_pago integer default null, 
valor_pagado decimal(10,2),
fecha_pago datetime default now()
);

create table if not exists metodo_pago(
id_metodo_pago integer primary key auto_increment,
nombre varchar(55)
);


create table if not exists gestion_recargo(
id_recargo integer primary key auto_increment,
catidad_cobro decimal(10,2),
fecha_gestion_recargo datetime default now()
);



create table if not exists reporte(
id_reporte integer primary key auto_increment,
id_institucion integer not null,
periodo_inicio datetime default now(),
periodo_fin datetime default now(),
catidad_recaudada decimal(10,2),
fecha_reporte datetime default now()
);
create table if not exists institucion(
id_institucion integer primary key auto_increment,
nombre_intitucion varchar(55) unique,
ciudad varchar(55) default null,
direccion varchar(55) default null,
telefono varchar(55) default null,
correo varchar(55) default null
);


create table if not exists convenio(
id_convenio integer primary key auto_increment,
nombre_convenio varchar(55),
inicio_convenio datetime default now(),
fin_convenio datetime default now()
);

create table if not exists cuota(
id_cuota integer primary key auto_increment,
cantidad_total decimal(10,2) default null,
valor_cuota decimal(10,2) default null,
valor_restante decimal(10,2) default null,
fecha_cuota Datetime default null
);


#alter table persona add constraint  persona_rol_fk foreign key (id_rol) references rol(id_rol) on delete no action on update cascade;
#alter table empleado add constraint  persona_empleado_fk foreign key (id_empleado) references persona(id_persona) on delete no action on update cascade;
#alter table cliente add constraint  persona_cliente_fk foreign key (id_cliente) references persona(id_persona) on delete no action on update cascade;
alter table recaudacion add constraint recaudacion_persona_fk foreign key (id_persona) references persona(id_persona) on delete no action on update cascade;
alter table recaudacion add constraint recaudacion_cuota_fk foreign key (id_cuota) references cuota(id_cuota) on delete no action on update cascade;
alter table recaudacion add constraint recaudacion_recargo_fk foreign key (id_recargo) references gestion_recargo(id_recargo) on delete no action on update cascade;
alter table recaudacion add constraint recaudacion_servicio_fk foreign key (id_servicio) references servicio(id_servicio) on delete no action on update cascade;
alter table servicio add constraint servicio_tipo_servicio_fk foreign key (id_tipo_servicio) references tipo_servicio(id_tipo_servicio) on delete no action on update cascade;
alter table servicio add constraint servicio_institucion_fk foreign key (id_institucion) references institucion(id_institucion) on delete no action on update cascade;
alter table convenio add constraint convenio_intitucion_fk foreign key (id_convenio) references institucion(id_institucion) on delete no action on update cascade;
alter table reporte add constraint reporte_institucion_fk foreign key (id_institucion) references institucion(id_institucion) on delete no action on update cascade;
alter table empleado add constraint persona_empleado_fk foreign key (id_persona) references persona(id_persona) on delete no action on update cascade;
alter table cliente add constraint persona_cliente_fk foreign key (id_persona) references persona(id_persona) on delete no action on update cascade;
alter table pago add constraint id_metodo_pago_fk foreign key (id_metodo_pago) references metodo_pago(id_metodo_pago) on delete no action on update cascade;



drop procedure if exists insertIntitucion;
DELIMITER //
#procedura to inter INtitucion
CREATE procedure insertIntitucion(
IN nombre varchar(55),
IN ciudad varchar(55),
IN direccion varchar(55),
IN telefono varchar(55),
IN correo varchar(55),
in fecha_fin_convenio timestamp,
in nombre_convenio varchar(55)
)
BEGIN
	declare id integer;
    insert into institucion(nombre_intitucion,  ciudad,  direccion,  telefono, correo) values (nombre, ciudad, direccion, telefono, correo);
    select id_institucion into id  from institucion where nombre_intitucion = nombre;
    insert into convenio(id_convenio,nombre_convenio,inicio_convenio,fin_convenio) values (id, nombre_convenio,now(), fecha_fin_convenio);
    select * from institucion inner join convenio where institucion.id_institucion = id and convenio.id_convenio = id;
END //
    
DELIMITER ;

#procedure to insert TypeSerice
DELIMITER //
create procedure inserTypeService(IN typerService varchar(55))
begin
insert into tipo_servicio(nombre) values(typerService);
end//
DELIMITER ;

#procedure to insert Vendedor
DELIMITER //
create procedure insertarVendedor(
	cedula varchar(55),
	nombre varchar(55),
    apellidos varchar(55),
    celular integer(10),
    telefono integer(15),
    provincia varchar(55),
    direccion varchar(55),
    correo varchar(55),
    periodo_contrato_fin timestamp,
    cargo varchar(55),
    sueldo integer,
    experiencia varchar(55),
    observaciones varchar(55)
    )
begin
declare id_value integer;
insert into persona
(cedula,nombre, apellidos, celular, telefono, provincia, direccion, correo) 
values (cedula, nombre,apellidos, celular, telefono, provincia, direccion, correo);
set id_value =  last_insert_id();
insert into 
empleado (id_persona, periodo_contrato_inicio, periodo_contrato_fin, cargo, sueldo, experiencia, observaciones) 
values (id_value, now(), periodo_contrato_fin , cargo, sueldo, experiencia, observaciones);
end//
DELIMITER ;

DELIMITER //
create procedure registerNewCuotes(
	pay_total decimal (10,2),
    number_cuotes integer, 
    date_inicio timestamp,
    date_final timestamp,
    id_servicio integer
    )
begin 
declare ID integer;
declare total_days decimal(10,2);
declare increment_days integer;
declare valor_cuota decimal(10,2);
declare date_next datetime;
declare pay_next decimal(10,2);
declare state varchar(55);
set total_days = TIMESTAMPDIFF(DAY, date_inicio, date_final);
set total_days = total_days/number_cuotes;
set increment_days =  round(total_days, 0);
set valor_cuota = pay_total/number_cuotes;
set date_next =  DATE_ADD( date_inicio ,INTERVAL increment_days DAY);
set pay_next  = valor_cuota;
set state = "no pagada";
if number_cuotes = 1 then 
	set date_inicio = date_final;
end if;
	while (number_cuotes != 0) DO 
    #################################CODE WRITE#####################################
    if number_cuotes = 1 then 
    set date_next = date_final;
    end  if;
    insert into cuota(cantidad_total, valor_cuota, fecha_cuota, valor_restante) values (pay_total,pay_next ,date_next, pay_total);
    set ID = last_insert_id();
    insert into recaudacion (id_servicio, fecha_limite_recaudacion,descripcion_recaudacion,id_cuota ) values (id_servicio, date_final, state, ID);
    ################################################################################
    set date_next =  DATE_ADD( date_next ,INTERVAL increment_days DAY);
	set number_cuotes = number_cuotes - 1; 
    #set pay_next  = valor_cuota + pay_next;
    end WHILE ; 
end //
DELIMITER ;
########################################################################################################
########################################################################################################
########################################################################################################
########################################################################################################
DELIMITER //
create procedure RegisterNewService(
	nombre_intitucion varchar(255),
    pay_total decimal (10,2),
    number_cuotes integer ,
    date_inicio timestamp,
    date_final timestamp,
    typo_servicio varchar(55)
)
begin 
	declare ID_insitucion  integer;
    declare ID_servicio  integer;
	select id_institucion into ID_insitucion from institucion where nombre_intitucion = nombre_intitucion;
    select id_tipo_servicio into ID_servicio from tipo_servicio where nombre = typo_servicio;
    insert into servicio(Id_institucion, Id_tipo_servicio) values (ID_insitucion, ID_servicio);
    set ID_servicio = last_insert_id();
    call registerNewCuotes(pay_total, number_cuotes, date_inicio, date_final, ID_servicio);
end //
DELIMITER ;

########################################################################################################
########################################################################################################
########################################################################################################
########################################################################################################
DELIMITER //
create procedure get_pay_cuote(id_service integer, date_time timestamp)
begin
	declare cont integer;
    declare is_most_pay integer;
    declare ID integer;
    declare date_cuote datetime;
    declare valor decimal(10,2);
    declare do_service integer;
	select count(*) into do_service from recaudacion where id_servicio = id_service;
    if do_service > 0 then 
		select count(*) into cont from recaudacion where  id_recargo is not null  and id_servicio = id_service and descripcion_recaudacion  = "pagada" ;
		select id_cuota into ID from recaudacion where id_servicio = id_service and descripcion_recaudacion = "no pagada" limit 1;
		select fecha_cuota  into date_cuote from cuota where id_cuota = ID;
		set is_most_pay = TIMESTAMPDIFF(DAY, date_time, date_cuote);
		if is_most_pay < 0 then 
			select valor_cuota  into valor from cuota where id_cuota = ID;
			if cont = 0 then
				set valor = valor* 0.01; 
			elseif cont = 1 then 
				set valor = valor* 0.05; 
			elseif cont >= 2 then 
				set valor = valor* 0.10; 
			end if;
			select valor_cuota + valor as 'valor_recargado', cuota.*  from cuota where id_cuota = ID;
		elseif is_most_pay >= 0 then
			select  *  from cuota where id_cuota = ID;
		end if;
    end if;
end //
DELIMITER ;

 #select id_cuota from recaudacion where id_servicio = 2 ;
########################################################################################################
########################################################################################################

#select count(*)from persona where cedula='1104414783';
########################################################################################################
DELIMITER //
create procedure insertarUsuario(
   cedula_cliente varchar(10),
    nombre varchar(55),
    apellidos varchar(55),
    celular integer(10),
    telefono integer(15),
    provincia varchar(55),
    direccion varchar(55),
    correo varchar(55))
begin
declare id_value integer;
insert into persona
(cedula,nombre, apellidos, celular, telefono, provincia, direccion, correo) 
values (cedula_cliente, nombre,apellidos, celular, telefono, provincia, direccion, correo);
set id_value = last_insert_id();
insert into 
cliente (id_persona,calificacion) 
values (id_value, "" );
end //
DELIMITER ;



########################################################################################################
########################################################################################################
########################################################################################################

DELIMITER //
create procedure do_pay(
	cedula_cliente varchar(10),
    cedula_vendedor varchar(10),
    nombre varchar(55),
    apellidos varchar(55),
    celular integer(10),
    telefono integer(15),
    provincia varchar(55),
    direccion varchar(55),
    correo varchar(55),
    mount_pay decimal(10,2),
    id_service integer, 
    date_time timestamp,
    id_metodo_pago integer
)
begin
	declare cont integer;
    declare is_most_pay integer;
    declare valor_normal decimal(10,2);
    declare ID integer;
    declare valor_restante_old decimal(10,2);
    declare valor_desgastado  decimal(10,2);
    declare id_recargo_nuevo integer;
    declare id_pago integer;
    declare id_user_new integer;
    declare id_empleado_new integer;
    declare date_cuote datetime;
    declare valor decimal(10,2);
    select count(*) into cont from recaudacion where  id_recargo is not null  and id_servicio = id_service and descripcion_recaudacion  = "pagada" ;
    select id_cuota into ID from recaudacion where id_servicio = id_service and descripcion_recaudacion = "no pagada" limit 1;
	select fecha_cuota  into date_cuote from cuota where id_cuota = ID;
    set is_most_pay = TIMESTAMPDIFF(DAY, date_time, date_cuote);
	select valor_cuota  into valor from cuota where id_cuota = ID;
    set valor_normal = valor;
    if is_most_pay < 0 then 
		if cont = 0 then
			set valor = valor * 0.01; 
		elseif cont = 1 then 
			set valor = valor * 0.05; 
		elseif cont >= 2 then 
			set valor = valor * 0.10; 
		end if;
        select valor;
         set valor = valor_normal + round(valor,2);
        insert into gestion_recargo(catidad_cobro, fecha_gestion_recargo) values (valor, now());
        set id_recargo_nuevo = last_insert_id();
    elseif is_most_pay >= 0 then
		set valor = valor_normal;
    end if;
		select mount_pay;
		if mount_pay > valor then 
			
			insert into pago(id_metodo_pago, valor_pagado, fecha_pago) values (id_metodo_pago, valor, now());
            set id_pago = last_insert_id();
            select valor_restante into valor_restante_old from cuota where id_cuota = ID;
            set valor_restante_old = valor_restante_old - valor_normal;
            update cuota set valor_restante  =  valor_restante_old where id_cuota = ID;
            call insertarUsuario(cedula_cliente,nombre,apellidos,celular,telefono,provincia,direccion,correo);
            select id_persona into id_user_new from persona where cedula =  cedula_cliente;
            select id_persona into id_empleado_new from persona where cedula =  cedula_vendedor;
            if valor = valor_normal then 
				update recaudacion set id_persona = id_user_new, id_empleado =  id_empleado_new, id_pago = id_pago, lugar_recaudacion = provincia, descripcion_recaudacion = "pagada" 
                where id_servicio = id_service and descripcion_recaudacion = "no pagada" limit 1;
            else
            update recaudacion set id_persona = id_user_new, id_recargo =  id_recargo_nuevo ,id_empleado =  id_empleado_new, id_pago = id_pago, lugar_recaudacion = provincia, descripcion_recaudacion = "pagada"
                where id_servicio = id_service and descripcion_recaudacion = "no pagada" limit 1;
            end if;
        end if;
end //
DELIMITER ;



use pasantias;
/*Temporaly Table to save logs*/
drop table if exists echo;
drop trigger if exists message_warning;
create table if not exists echo(
id integer primary key auto_increment,
descripcion varchar (55)
);

delimiter //
create trigger message_warning before update on recaudacion 
for each row 
begin 
		declare str1 varchar(55);
        declare str2 varchar(55);
        declare str3 varchar(55);
        declare str4 varchar (55);
        declare str5 varchar (55);
        declare str6 varchar (55);
        declare dec1 decimal (10,2);
		select  nombre into str5 from persona where id_persona = new.id_persona;
        select valor_pagado into  dec1 from pago  where id_pago = new.id_pago;
        set str1 = "Se ha pagado la cantidad de "; 
        set str2 = " por parte de ";  
        set str4 = concat(str1, dec1);
        set str6 = concat(str4, str2);
        set str3 = concat(str6, str5);
       insert into echo(descripcion) values (str3);
end //
delimiter ;

select count(*) from recaudacion where id_servicio = 1 and id_pago is not null;

drop trigger if exists report_final;
delimiter //
create  trigger report_final after update on recaudacion for each row 
begin 
	declare fecha_fin datetime;
	declare fecha_inicio datetime;
    declare cont_cuotas_pagar integer;
    declare cont_cuotas_pagada integer;
    declare institucion integer;
    declare total_pago decimal(10,2);
    select count(*) into cont_cuotas_pagar from recaudacion where id_servicio = new.id_servicio;
    select count(*)into  cont_cuotas_pagada from recaudacion where id_servicio = new.id_servicio and id_pago is not null;
    if cont_cuotas_pagar = cont_cuotas_pagada then 
		select sum(valor_pagado) into total_pago from recaudacion as r inner join pago as p on r.id_pago = p.id_pago where id_servicio = new.id_servicio;
		select fecha_limite_recaudacion into fecha_fin from recaudacion where id_servicio = new.id_servicio limit 1;
		select periodo_servicio into fecha_inicio from servicio where id_servicio = new.id_servicio limit 1;
        select id_institucion into institucion from servicio where id_servicio = new.id_servicio limit 1;
		insert into reporte(id_institucion, periodo_inicio, periodo_fin, catidad_recaudada, fecha_reporte) values (institucion,fecha_inicio, fecha_fin,total_pago ,now());
    end if;
end //
delimiter ;




/*
	
    CREACION DE AUDITORIAS
    
	Triggers Existentes para Auditar
    
    Persona: AuditoriaPersonaInsert, AuditoriaPersonaUpdate, AuditoriaPersonaDelete
    Empleado: AuditoriaEmpleadoInsert, AuditoriaEmpleadoUpdate, AuditoriaEmpleadoDelete
    Cliente: AuditoriaClienteInsert, AuditoriaClienteUpdate, AuditoriaClienteDelete   
    TipoDeServicio: AuditoriaTipoServicioInsert, AuditoriaTipoServicioUpdate, AuditoriaTipoServicioDelete
    Servicio: AuditoriaServicioInsert, AuditoriaServicioUpdate, AuditoriaServicioDelete
    Institucion: AuditoriaInstitucionInsert, AuditoriaInstitucionUpdate, AuditoriaInstitucionDelete
	Convenio: AuditoriaConvenioInsert, AuditoriaConvenioUpdate, AuditoriaConvenioDelete
	Cuota: AuditoriaCuotaInsert, AuditoriaCuotaUpdate, AuditoriaCuotaDelete
	MetodoPago:AuditoriaMetodoPagoInsert, AuditoriaMetodoPagoUpdate,AuditoriaMetodoPagoDelete
	Pago: AuditoriaPagoInsert, AuditoriaPagoUpdate, AuditoriaPagoDelete
	Recaudacion: AuditoriaRecaudacionInsert, AuditoriaRecaudacionUpdate, AuditoriaRecaudacionDelete
	GestionRecargo: AuditoriaGestionRecargoInsert, AuditoriaGestionRecargoUpdate, AuditoriaGestionRecargoDelete
	Reporte: AuditoriaReporteInsert, AuditoriaReporteUpdate, AuditoriaReporteDelete

    
*/



/*

	AUDITORIA TABLA PERSONA
    
*/

create table if not exists  AuditoriaPersona (
	id_AuditoriaPersona integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,
    
    id_persona_copia integer default null,
    cedula_copia varchar(10) default null,
    nombre_copia varchar(55) default null,
    apellidos_copia varchar(55) default null,
    celular_copia integer default null,
    telefono_copia integer default null,
    provincia_copia varchar(55) default null,
    direccion_copia varchar(55) default null,
    correo_copia varchar(55) default null
);

# Auditoria Persona Insert 

	Create trigger AuditoriaPersonaInsert 
		after Insert on persona 
	for each row
		insert  into 
			
			AuditoriaPersona( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_persona_copia, cedula_copia, nombre_copia, apellidos_copia, celular_copia, telefono_copia, provincia_copia, direccion_copia, correo_copia )
				
			values (  current_user(), 'INSERT', now(), 
					  concat(' '), 
					  concat( 'Id_Persona  ', new.id_persona, ' - Cedula: ', new.cedula, ' - Nombre: ', new.nombre, ' - Apellidos:  ', new.apellidos, ' - Celular:  ', new.celular, 
							' - Telefono: ', new.telefono, ' - Provincia: ', new.provincia, ' - Direccion: ', new.direccion, ' - Correo: ', new.correo
							),
					new.id_persona, new.cedula, new.nombre, new.apellidos, new.celular, new.telefono, new.provincia, new.direccion, new.correo
				   );


# Auditoria Persona Update 

	Create trigger AuditoriaPersonaUpdate
		after Update on persona 
	for each row
		insert  into 
			
			AuditoriaPersona( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_persona_copia, cedula_copia, nombre_copia, apellidos_copia, celular_copia, telefono_copia, provincia_copia, direccion_copia, correo_copia )
				
			values (  current_user(), 'UPDATE', now(), 
					  concat('Id_Persona  ', old.id_persona, ' - Cedula: ', old.cedula, ' - Nombre: ', old.nombre, ' - Apellidos:  ', old.apellidos, ' - Celular:  ', old.celular, 
							' - Telefono: ', old.telefono, ' - Provincia: ', old.provincia, ' - Direccion: ', old.direccion, ' - Correo: ', old.correo),
                            
					  concat( 'Id_Persona  ', new.id_persona, ' - Cedula: ', new.cedula, ' - Nombre: ', new.nombre, ' - Apellidos:  ', new.apellidos, ' - Celular:  ', new.celular, 
							' - Telefono: ', new.telefono, ' - Provincia: ', new.provincia, ' - Direccion: ', new.direccion, ' - Correo: ', new.correo
							),
					new.id_persona, new.cedula, new.nombre, new.apellidos, new.celular, new.telefono, new.provincia, new.direccion, new.correo
				   );


# Auditoria Persona Delete 

Create trigger AuditoriaPersonaDelete
		after Delete on persona 
	for each row
		insert  into 			
			AuditoriaPersona( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_persona_copia, cedula_copia, nombre_copia, apellidos_copia, celular_copia, telefono_copia, provincia_copia, direccion_copia, correo_copia )
				
			values (  current_user(), 'DELETE', now(), 
					 concat( 'Id_Persona  ', old.id_persona, ' - Cedula: ', old.cedula, ' - Nombre: ', old.nombre, ' - Apellidos:  ', old.apellidos, ' - Celular:  ', old.celular, 
							' - Telefono: ', old.telefono, ' - Provincia: ', old.provincia, ' - Direccion: ', old.direccion, ' - Correo: ', old.correo
							),	
					  concat(' '), 
					  
					old.id_persona, old.cedula, old.nombre, old.apellidos, old.celular, old.telefono, old.provincia, old.direccion, old.correo
				   );


/*


	AUDITORIA TABLA EMPLEADO
    
    
*/


create table if not exists  AuditoriaEmpleado (
	id_AuditoriaEmpleado integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text not null,
    id_persona_copia integer default null,
    periodo_contrato_inicio_copia timestamp default now(),
    periodo_contrato_fin_copia timestamp default now(),
    cargo_copia varchar(55),
    sueldo_copia integer default 0,
    experiencia_copia varchar(55) default null,
    observaciones_copia varchar(55) default null
);


# Auditoria Empleado Insert 

Create trigger AuditoriaEmpleadoInsert 
	after Insert on empleado 
for each row
	insert  into 
		
		AuditoriaEmpleado( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo , id_persona_copia, periodo_contrato_inicio_copia,
						   periodo_contrato_fin_copia, cargo_copia, sueldo_copia, experiencia_copia, observaciones_copia )                             
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat( 'Id_Persona: ', new.id_persona, ' - PeriodoContratoInicio: ', new.periodo_contrato_inicio,' - PeriodoContratoFin: ', 
					     	  new.periodo_contrato_fin, ' - Cargo: ', new.cargo, ' - Sueldo: ', new.sueldo, ' - Experiencia: ', new.experiencia,
                             ' - Observaciones:  ', new.observaciones ),
				 new.id_persona, new.periodo_contrato_inicio, new.periodo_contrato_fin, new.cargo, new.sueldo, new.experiencia, new.observaciones                                    
			   );


# Auditoria Empleado Update

Create trigger AuditoriaEmpleadoUpdate
	after Update on empleado 
for each row
	insert  into 		
		AuditoriaEmpleado( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo , id_persona_copia, periodo_contrato_inicio_copia,
						   periodo_contrato_fin_copia, cargo_copia, sueldo_copia, experiencia_copia, observaciones_copia )                             
		values (  current_user(), 'UPDATE', now(), 
				  concat( 'Id_Persona: ', old.id_persona, ' - PeriodoContratoInicio: ', old.periodo_contrato_inicio,' - PeriodoContratoFin: ', 
					     	  old.periodo_contrato_fin, ' - Cargo: ', old.cargo, ' - Sueldo: ', old.sueldo, ' - Experiencia: ', old.experiencia,
                             ' - Observaciones:  ', old.observaciones ),
                             
				  concat( 'Id_Persona: ', new.id_persona, ' - PeriodoContratoInicio: ', new.periodo_contrato_inicio,' - PeriodoContratoFin: ', 
					     	  new.periodo_contrato_fin, ' - Cargo: ', new.cargo, ' - Sueldo: ', new.sueldo, ' - Experiencia: ', new.experiencia,
                             ' - Observaciones:  ', new.observaciones ),
                             
				 new.id_persona, new.periodo_contrato_inicio, new.periodo_contrato_fin, new.cargo, new.sueldo, new.experiencia, new.observaciones                                    
			);

					
# Auditoria Empleado Delete

Create trigger AuditoriaEmpleadoDelete
	after Delete on empleado 
for each row
	insert  into 		
		AuditoriaEmpleado( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo , id_persona_copia, periodo_contrato_inicio_copia,
						   periodo_contrato_fin_copia, cargo_copia, sueldo_copia, experiencia_copia, observaciones_copia )                             
		values (  current_user(), 'DELETE', now(), 
        
				  concat( 'Id_Persona: ', old.id_persona, ' - PeriodoContratoInicio: ', old.periodo_contrato_inicio,' - PeriodoContratoFin: ', 
					     	  old.periodo_contrato_fin, ' - Cargo: ', old.cargo, ' - Sueldo: ', old.sueldo, ' - Experiencia: ', old.experiencia,
                             ' - Observaciones:  ', old.observaciones ),
                             
				  concat( ' ' ),
                             
				 old.id_persona, old.periodo_contrato_inicio, old.periodo_contrato_fin, old.cargo, old.sueldo, old.experiencia, old.observaciones                                    
			);



/*


	AUDITORIA TABLA Cliente 
    
    
*/


create table if not exists  AuditoriaCliente (
	id_AuditoriaCliente integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,
    
    id_cliente_copia integer default null,
    id_persona_copia integer default null,
    calificacion_copia varchar(55) default null
    
);


# Auditoria Cliente Insert 

Create trigger AuditoriaClienteInsert 
	after Insert on cliente 
for each row
	insert  into 
		
		AuditoriaCliente( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
						id_cliente_copia, id_persona_copia, calificacion_copia)                             
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat( ' - IdCliente: ', new.id_cliente, ' - IdPersona: ', new.id_persona, ' - Calificación: ',new.calificacion ),
					new.id_cliente, new.id_persona, new.calificacion
			   );


# Auditoria Cliente Update 

Create trigger AuditoriaClienteUpdate 
	after Update on cliente 
for each row
	insert  into 
		
		AuditoriaCliente( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
						id_cliente_copia, id_persona_copia, calificacion_copia)                             
		values (  current_user(), 'UPDATE', now(), 
				  concat( 'IdCliente: ', old.id_cliente, ' - IdPersona: ', old.id_persona, ' - Calificación: ', old.calificacion ),
				  concat( 'IdCliente: ', new.id_cliente, ' - IdPersona: ', new.id_persona, ' - Calificación: ', new.calificacion ),
					new.id_cliente, new.id_persona, new.calificacion
			   );


# Auditoria Cliente Delete

Create trigger AuditoriaClienteDelete
	after Delete on cliente 
for each row
	insert  into 
		AuditoriaCliente( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
						id_cliente_copia, id_persona_copia, calificacion_copia)                             
		values (  current_user(), 'DELETE', now(), 
				  concat( 'IdCliente: ', old.id_cliente, ' - IdPersona: ', old.id_persona, ' - Calificación: ', old.calificacion ),
                  concat(' '), 				  
					old.id_cliente, old.id_persona, old.calificacion
			   );



/*


	AUDITORIA TABLA TIPO DE SERVICIO 
    
    
*/


create table if not exists AuditoriaTipoServicio (
	id_TipoServicio integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
	id_tipo_servicio_copia integer default null,
	nombre_copia  varchar(55) default null
);


# Auditoria Tipo de Servicio Insert 

Create trigger AuditoriaTipoServicioInsert 
	after Insert on tipo_servicio
for each row
	insert  into 
		
		AuditoriaTipoServicio( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
							id_tipo_servicio_copia, nombre_copia )                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat( ' IdTipoServicio: ', new.id_tipo_servicio, ' - Nombre: ', new.nombre),
					new.id_tipo_servicio, new.nombre
			   );


# Auditoria Tipo de Servicio Update

Create trigger AuditoriaTipoServicioUpdate 
	after Update on tipo_servicio 
for each row
	insert  into 
        	AuditoriaTipoServicio( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
					id_tipo_servicio_copia, nombre_copia )                             
		values (  current_user(), 'UPDATE', now(), 
				  concat( ' IdTipoServicio: ', old.id_tipo_servicio, ' - Nombre: ', old.nombre),
				  concat( ' IdTipoServicio: ', new.id_tipo_servicio, ' - Nombre: ', new.nombre),
                  new.id_tipo_servicio, new.nombre
			   );


# Auditoria Tipo de Servicio Delete


Create trigger AuditoriaTipoServicioDelete
	after delete on tipo_servicio
for each row
	insert  into 				

		AuditoriaTipoServicio( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
						id_tipo_servicio_copia, nombre_copia )                             
		values (  current_user(), 'DELETE', now(), 
				  concat( ' IdTipoServicio: ', old.id_tipo_servicio, ' - Nombre: ', old.nombre),
                  concat(' '), 
					old.id_tipo_servicio, old.nombre
			   );

/*


	AUDITORIA TABLA DE TABLA SERVICIO 
    
    
*/


create table if not exists AuditoriaServicio (
	id_AuditoriaServicio integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
	id_servicio_copia integer default null,
	id_institucion_copia integer default null,
	id_tipo_servicio_copia integer default null,
	periodo_servicio_copia datetime default now()

);

# Auditoria Servicio Insert 

Create trigger AuditoriaServicioInsert 
	after Insert on servicio
for each row
	insert  into 
		
		AuditoriaServicio( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_servicio_copia, id_institucion_copia, id_tipo_servicio_copia, periodo_servicio_copia )                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat( 'IdServicio: ', new.id_servicio, ' - IdInstitucion: ', new.id_institucion, ' - IdTipoServicio: ', new.id_tipo_servicio, ' - PeriodoSevicio: ', new.periodo_servicio),
					new.id_servicio, new.id_institucion, new.id_tipo_servicio, new.periodo_servicio
			   );

# Auditoria Servicio Update 

Create trigger AuditoriaServicioUpdate
	after update on servicio
for each row
	insert  into 
		
		AuditoriaServicio( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_servicio_copia, id_institucion_copia, id_tipo_servicio_copia, periodo_servicio_copia )                             
                            
		values (  current_user(), 'UPDATE', now(), 
				  concat( 'IdServicio: ', old.id_servicio, ' - IdInstitucion: ', old.id_institucion, ' - IdTipoServicio: ', old.id_tipo_servicio, ' - PeriodoSevicio: ', old.periodo_servicio),
				  concat( 'IdServicio: ', new.id_servicio, ' - IdInstitucion: ', new.id_institucion, ' - IdTipoServicio: ', new.id_tipo_servicio, ' - PeriodoSevicio: ', new.periodo_servicio),
					new.id_servicio, new.id_institucion, new.id_tipo_servicio, new.periodo_servicio
			   );


# Auditoria Servicio Delete

Create trigger AuditoriaServicioDelete
	after delete on servicio
for each row
	insert  into 
		
		AuditoriaServicio( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_servicio_copia, id_institucion_copia, id_tipo_servicio_copia, periodo_servicio_copia )                             
                            
		values (  current_user(), 'DELETE', now(), 
				  concat( 'IdServicio: ', old.id_servicio, ' - IdInstitucion: ', old.id_institucion, ' - IdTipoServicio: ', old.id_tipo_servicio, ' - PeriodoSevicio: ', old.periodo_servicio),
				  concat( ' '),
					old.id_servicio, old.id_institucion, old.id_tipo_servicio, old.periodo_servicio
			   );
			
            

/*


	AUDITORIA TABLA DE TABLA INSTITUCION 
    
    
*/


create table if not exists AuditoriaInstitucion (
	id_AuditoriaInstitucion integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
	id_institucion_copia integer default null,
	nombre_intitucion_copia varchar(55) default null,
	ciudad_copia varchar(55) default null,
	direccion_copia varchar(55) default null,
	telefono_copia varchar(55) default null,
	correo_copia varchar(55) default null

);


# Auditoria Institucion Insert

Create trigger AuditoriaInstitucionInsert 
	after Insert on institucion
for each row
	insert  into 
		
		AuditoriaInstitucion( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
			id_institucion_copia, nombre_intitucion_copia, ciudad_copia, direccion_copia, telefono_copia, correo_copia)                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat('IdInstitucion: ', new.id_institucion, ' - NombreInstitucion: ', new.nombre_intitucion, ' - Ciudad: ', new.ciudad, ' - Direccion: ', new.direccion, ' - Telefono: ', new.telefono, ' - Correo: ', new.correo ),
					new.id_institucion, new.nombre_intitucion, new.ciudad, new.direccion, new.telefono, new.correo
			   );

# Auditoria Institucion Update 

Create trigger AuditoriaInstitucionUpdate 
	after Update on institucion
for each row
	insert  into 
		
		AuditoriaInstitucion( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
			id_institucion_copia, nombre_intitucion_copia, ciudad_copia, direccion_copia, telefono_copia, correo_copia)                             
                            
		values (  current_user(), 'UPDATE', now(), 
				  concat('IdInstitucion: ', old.id_institucion, ' - NombreInstitucion: ', old.nombre_intitucion, ' - Ciudad: ', old.ciudad, ' - Direccion: ', old.direccion, ' - Telefono: ', old.telefono, ' - Correo: ', old.correo ),
				  concat('IdInstitucion: ', new.id_institucion, ' - NombreInstitucion: ', new.nombre_intitucion, ' - Ciudad: ', new.ciudad, ' - Direccion: ', new.direccion, ' - Telefono: ', new.telefono, ' - Correo: ', new.correo ),
					new.id_institucion, new.nombre_intitucion, new.ciudad, new.direccion, new.telefono, new.correo
			   );

# Auditoria Institucion Delete		

Create trigger AuditoriaInstitucionDelete
	after Delete on institucion
for each row
	insert  into 
		
		AuditoriaInstitucion( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
			id_institucion_copia, nombre_intitucion_copia, ciudad_copia, direccion_copia, telefono_copia, correo_copia)                             
                            
		values (  current_user(), 'DELETE', now(), 
				  concat('IdInstitucion: ', old.id_institucion, ' - NombreInstitucion: ', old.nombre_intitucion, ' - Ciudad: ', old.ciudad, ' - Direccion: ', old.direccion, ' - Telefono: ', old.telefono, ' - Correo: ', old.correo ),
				  concat(' '),
					old.id_institucion, old.nombre_intitucion, old.ciudad, old.direccion, old.telefono, old.correo
			   );
            

/*
	AUDITORIA TABLA CONVENIO
*/


create table if not exists AuditoriaConvenio (
	id_AuditoriaConvenio  integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
	id_convenio_copia integer default null,
	nombre_convenio_copia varchar(55),
	inicio_convenio_copia datetime default now(),
	fin_convenio_copia datetime default now()

);

# Auditoria Convenio Insert

 Create trigger AuditoriaConvenioInsert
	after Insert on convenio
for each row
	insert  into 
    
		AuditoriaConvenio( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
					id_convenio_copia , nombre_convenio_copia, inicio_convenio_copia, fin_convenio_copia )                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat('IdConvenio: ', new.id_convenio, ' - Nombre: ', new.nombre_convenio, ' - InicioConvenio: ', new.inicio_convenio, ' - FinConvenio: ', new.fin_convenio),
					new.id_convenio, new.nombre_convenio, new.inicio_convenio, new.fin_convenio
			   );


# Auditoria Convenio Update

              
 Create trigger AuditoriaConvenioUpdate
	after update on convenio
for each row
	insert  into 
    
		AuditoriaConvenio( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
					id_convenio_copia, nombre_convenio_copia, inicio_convenio_copia, fin_convenio_copia )                             
                            
		values (  current_user(), 'UPDATE', now(), 
				  concat('IdConvenio: ', old.id_convenio, ' - Nombre: ', old.nombre_convenio, ' - InicioConvenio: ', old.inicio_convenio, ' - FinConvenio: ', old.fin_convenio),
				  concat('IdConvenio: ', new.id_convenio, ' - Nombre: ', new.nombre_convenio, ' - InicioConvenio: ', new.inicio_convenio, ' - FinConvenio: ', new.fin_convenio),
					new.id_convenio, new.nombre_convenio, new.inicio_convenio, new.fin_convenio
			   );

              
# Auditoria Convenio Delete

 Create trigger AuditoriaConvenioDelete
	after delete on convenio
for each row
	insert  into 
    
		AuditoriaConvenio( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
					id_convenio_copia, nombre_convenio_copia, inicio_convenio_copia, fin_convenio_copia )                             
                            
		values (  current_user(), 'DELETE', now(), 
				  concat('IdConvenio: ', old.id_convenio, ' - Nombre: ', old.nombre_convenio, ' - InicioConvenio: ', old.inicio_convenio, ' - FinConvenio: ', old.fin_convenio),
				  concat(' '),
					old.id_convenio, old.nombre_convenio, old.inicio_convenio, old.fin_convenio
			   );


/*

	AUDITORIA TABLA COUTA
    
*/



create table if not exists AuditoriaCuota (
	id_AuditoriaCuota  integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
	id_cuota_copia integer default null,
	cantidad_total_copia decimal(10,2) default null,
	valor_cuota_copia decimal(10,2) default null,
	valor_restante_copia decimal(10,2),
	fecha_cuota_copia datetime default now()
);


# Auditoria Cuota Insert 

 Create trigger AuditoriaCuotaInsert
	after Insert on cuota
for each row
	insert  into 
    
		AuditoriaCuota( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_cuota_copia, cantidad_total_copia, valor_cuota_copia, valor_restante_copia, fecha_cuota_copia )                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat('IdCuota: ', new.id_cuota,' - CantidadTotal: ', new.cantidad_total, ' - ValorCuota: ' , new.valor_cuota, ' - ValorRestante: ', new.valor_restante, ' - FechaCuota: ', new.fecha_cuota),
					new.id_cuota, new.cantidad_total, new.valor_cuota, new.valor_restante, new.fecha_cuota
			   );

# Auditoria Cuota Update

 Create trigger AuditoriaCuotaUpdate
	after Update on cuota
for each row
	insert  into 
    
		AuditoriaCuota( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_cuota_copia, cantidad_total_copia, valor_cuota_copia, valor_restante_copia, fecha_cuota_copia )                             
                            
		values (  current_user(), 'UPDATE', now(), 
				  concat('IdCuota: ', old.id_cuota,' - CantidadTotal: ', old.cantidad_total, ' - ValorCuota: ' , old.valor_cuota, ' - ValorRestante: ', old.valor_restante, ' - FechaCuota: ', old.fecha_cuota),
				  concat('IdCuota: ', new.id_cuota,' - CantidadTotal: ', new.cantidad_total, ' - ValorCuota: ' , new.valor_cuota, ' - ValorRestante: ', new.valor_restante, ' - FechaCuota: ', new.fecha_cuota),
					new.id_cuota, new.cantidad_total, new.valor_cuota, new.valor_restante, new.fecha_cuota
			   );


# Auditoria Cuota Delete

 Create trigger AuditoriaCuotaDelete
	after Delete on cuota
for each row
	insert  into 
    
		AuditoriaCuota(  usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_cuota_copia, cantidad_total_copia, valor_cuota_copia, valor_restante_copia, fecha_cuota_copia )                             
                            
		values (  current_user(), 'DELETE', now(), 
				  concat('IdCuota: ', old.id_cuota,' - CantidadTotal: ', old.cantidad_total, ' - ValorCuota: ' , old.valor_cuota, ' - ValorRestante: ', old.valor_restante, ' - FechaCuota: ', old.fecha_cuota),
				  concat(' '),
					old.id_cuota, old.cantidad_total, old.valor_cuota, old.valor_restante, old.fecha_cuota
			   );


/*

	AUDITORIA TABLA METODO PAGO 
    
*/


create table if not exists AuditoriaMetodoPago (
	id_AuditoriaMetodoPago integer primary key auto_increment,
	usuario varchar(55)  default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
    id_metodo_pago_copia integer not null,
	nombre_copia varchar(55)
);


# Auditoria MetodoPago Insert 

 Create trigger AuditoriaMetodoPagoInsert
	after Insert on metodo_pago
for each row
	insert  into 
    
		AuditoriaMetodoPago( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
						id_metodo_pago_copia, nombre_copia )                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat('IdMetodoPago: ', new.id_metodo_pago, ' - Nombre: ',new.nombre),
					new.id_metodo_pago, new.nombre
			   );

# Auditoria MetodoPago Update

 Create trigger AuditoriaMetodoPagoUpdate
	after Update on metodo_pago
for each row
	insert  into 
    
		AuditoriaMetodoPago( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
						id_metodo_pago_copia, nombre_copia )                             
                            
		values (  current_user(), 'UPDATE', now(), 
				  concat('IdMetodoPago: ', old.id_metodo_pago, ' - Nombre: ', old.nombre),
				  concat('IdMetodoPago: ', new.id_metodo_pago, ' - Nombre: ', new.nombre),
					new.id_metodo_pago, new.nombre
			   );


# Auditoria MetodoPago Delete

 Create trigger AuditoriaMetodoPagoDelete
	after Delete on metodo_pago
for each row
	insert  into 
    
		AuditoriaMetodoPago( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
						id_metodo_pago_copia, nombre_copia )                             
                            
		values (  current_user(), 'DELETE', now(), 
				  concat('IdMetodoPago: ', old.id_metodo_pago, ' - Nombre: ', old.nombre),
				  concat(' '),
					old.id_metodo_pago, old.nombre
			   );
               

/*

	AUDITORIA TABLA PAGO 
    
*/


create table if not exists AuditoriaPago (
	id_AuditoriaMetodoPago integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
    id_pago_copia integer default null,
	id_metodo_pago_copia integer default null, 
	valor_pagado_copia decimal(10,2),
	fecha_pago_copia datetime default now()
);

#select * from auditoriapersona;

# Auditoria Pago Insert 


 Create trigger AuditoriaPagoInsert
	after Insert on pago
for each row
	insert  into 
    
		AuditoriaPago( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_pago_copia, id_metodo_pago_copia, valor_pagado_copia, fecha_pago_copia)                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat('IdPago: ', new.id_pago, ' - IdMetodoPago: ', new.id_metodo_pago, ' - ValorPagado: ', new.valor_pagado, ' - FechaPago: ', new.fecha_pago),
					new.id_pago, new.id_metodo_pago, new.valor_pagado, new.fecha_pago
			   );

# Auditoria Pago Update

Create trigger AuditoriaPagoUpdate
	after Update on pago
for each row
	insert  into 
    
		AuditoriaPago( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_pago_copia, id_metodo_pago_copia, valor_pagado_copia, fecha_pago_copia)                             
                            
		values (  current_user(), 'UPDATE', now(), 
				  concat('IdPago: ', old.id_pago, ' - IdMetodoPago: ', old.id_metodo_pago, ' - ValorPagado: ', old.valor_pagado, ' - FechaPago: ', old.fecha_pago),
				  concat('IdPago: ', new.id_pago, ' - IdMetodoPago: ', new.id_metodo_pago, ' - ValorPagado: ', new.valor_pagado, ' - FechaPago: ', new.fecha_pago),
					new.id_pago, new.id_metodo_pago, new.valor_pagado, new.fecha_pago
			   );

# Auditoria Pago Delete

Create trigger AuditoriaPagoDelete
	after Delete on pago
for each row
	insert  into 
    
		AuditoriaPago( usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
				id_pago_copia, id_metodo_pago_copia, valor_pagado_copia, fecha_pago_copia)                             
                            
		values (  current_user(), 'DELETE', now(), 
				  concat('IdPago: ', old.id_pago, ' - IdMetodoPago: ', old.id_metodo_pago, ' - ValorPagado: ', old.valor_pagado, ' - FechaPago: ', old.fecha_pago),
				  concat(' '),
					old.id_pago, old.id_metodo_pago, old.valor_pagado, old.fecha_pago
			   );


/*


	NEW CHANGES 

*/



/*

	AUDITORIA TABLA RECAUDACION
    
*/


create table if not exists AuditoriaRecaudacion (
	id_AuditoriaRecaudacion integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
    id_recaudacion_copia integer default null,    
	id_servicio_copia integer default null,
	id_persona_copia integer default null,
	id_empleado_copia integer default null,
	fecha_limite_recaudacion_copia datetime default now(),
	id_recargo_copia integer default null, 
	descripcion_recaudacion_copia varchar(255) default null, 
	lugar_recaudacion_copia varchar(55) default null,
	id_cuota_copia integer default null,
	id_pago_copia integer default null
   
);


# Auditoria Pago Insert 

 Create trigger AuditoriaRecaudacionInsert
	after Insert on recaudacion
for each row
	insert  into 
    
		AuditoriaRecaudacion(  usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
        id_recaudacion_copia, id_servicio_copia, id_persona_copia, id_empleado_copia, fecha_limite_recaudacion_copia, id_recargo_copia, 
			descripcion_recaudacion_copia, lugar_recaudacion_copia, id_cuota_copia, id_pago_copia )                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat('IdRecaudacion: ', new.id_recaudacion, ' - IdServicio: ', new.id_servicio, ' - IdPersona: ', new.id_persona, 
                  ' - IdEmpleado: ', new.id_empleado, ' - FechaRecaudacion: ', new.fecha_limite_recaudacion, ' - IdRecargo: ', new.id_recargo, 
                  ' - DescripcionRecaudacion: ', new.descripcion_recaudacion, ' - LugarRecaudacion: ', new.lugar_recaudacion,  ' - IdCuota: ', new.id_cuota, ' - IdPago: ', new.id_pago),
                            
						 new.id_recaudacion, new.id_servicio, new.id_persona, new.id_empleado, new.fecha_limite_recaudacion, 
							new.id_recargo, new.descripcion_recaudacion, new.lugar_recaudacion, new.id_cuota, new.id_pago 
			   );


# Auditoria Recaudacion Update

 Create trigger AuditoriaRecaudacionUpdate
	after Update on recaudacion
for each row
	insert  into 
    
		AuditoriaRecaudacion(  usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
        id_recaudacion_copia, id_servicio_copia, id_persona_copia, id_empleado_copia, fecha_limite_recaudacion_copia, id_recargo_copia, 
			descripcion_recaudacion_copia, lugar_recaudacion_copia, id_cuota_copia, id_pago_copia )                             
                            
		values (  current_user(), 'UPDATE', now(), 
				  concat('IdRecaudacion: ', old.id_recaudacion, ' - IdServicio: ', old.id_servicio, ' - IdPersona: ', old.id_persona, 
                  ' - IdEmpleado: ', old.id_empleado, ' - FechaRecaudacion: ', old.fecha_limite_recaudacion, ' - IdRecargo: ', old.id_recargo, 
                  ' - DescripcionRecaudacion: ', old.descripcion_recaudacion, ' - LugarRecaudacion: ', old.lugar_recaudacion,  ' - IdCuota: ', old.id_cuota, ' - IdPago: ', old.id_pago),
                  
				  concat('IdRecaudacion: ', new.id_recaudacion, ' - IdServicio: ', new.id_servicio, ' - IdPersona: ', new.id_persona, 
                  ' - IdEmpleado: ', new.id_empleado, ' - FechaRecaudacion: ', new.fecha_limite_recaudacion, ' - IdRecargo: ', new.id_recargo, 
                  ' - DescripcionRecaudacion: ', new.descripcion_recaudacion, ' - LugarRecaudacion: ', new.lugar_recaudacion,  ' - IdCuota: ', new.id_cuota, ' - IdPago: ', new.id_pago),
                            
						 new.id_recaudacion, new.id_servicio, new.id_persona, new.id_empleado, new.fecha_limite_recaudacion, 
							new.id_recargo, new.descripcion_recaudacion, new.lugar_recaudacion, new.id_cuota, new.id_pago 
			   );


# Auditoria Recaudacion Delete

 Create trigger AuditoriaRecaudacionDelete
	after Delete on recaudacion
for each row
	insert  into 
    
		AuditoriaRecaudacion(  usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
        id_recaudacion_copia, id_servicio_copia, id_persona_copia, id_empleado_copia, fecha_limite_recaudacion_copia, id_recargo_copia, 
			descripcion_recaudacion_copia, lugar_recaudacion_copia, id_cuota_copia, id_pago_copia )                             
                            
		values (  current_user(), 'DELETE', now(), 
				  concat('IdRecaudacion: ', old.id_recaudacion, ' - IdServicio: ', old.id_servicio, ' - IdPersona: ', old.id_persona, 
                  ' - IdEmpleado: ', old.id_empleado, ' - FechaRecaudacion: ', old.fecha_limite_recaudacion, ' - IdRecargo: ', old.id_recargo, 
                  ' - DescripcionRecaudacion: ', old.descripcion_recaudacion, ' - LugarRecaudacion: ', old.lugar_recaudacion,  ' - IdCuota: ', old.id_cuota, ' - IdPago: ', old.id_pago),
                  
				  concat(' '),                            
                  
						 old.id_recaudacion, old.id_servicio, old.id_persona, old.id_empleado, old.fecha_limite_recaudacion, 
							old.id_recargo, old.descripcion_recaudacion, old.lugar_recaudacion, old.id_cuota, old.id_pago 
			   );



/*

	AUDITORIA TABLA GESTION RECARGO
    
*/


create table if not exists AuditoriaGestionRecargo (
	id_GestionRecargo integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
    id_recargo_copia integer default null,
	catidad_cobro_copia decimal(10,2) default null,
	fecha_gestion_recargo_copia datetime default now()
   
);
              

# Auditoria Gestion Recargo Insert

 Create trigger AuditoriaGestionRecargoInsert
	after Insert on gestion_recargo
for each row
	insert  into 
    
		AuditoriaGestionRecargo( usuario, accion, fechaModificacion, valorAnterior, valorNuevo, 
							id_recargo_copia, catidad_cobro_copia, fecha_gestion_recargo_copia )                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
				  concat('IdRecargo: ', new.id_recargo, ' - CantidadCobro: ', new.catidad_cobro, ' - FechaGestionRecargo: ', new.fecha_gestion_recargo),                            
						  new.id_recargo, new.catidad_cobro, new.fecha_gestion_recargo
			   );

# Auditoria Gestion Recargo Update


 Create trigger AuditoriaGestionRecargoUpdate
	after Update on gestion_recargo
for each row
	insert  into 
    
		AuditoriaGestionRecargo( usuario, accion, fechaModificacion, valorAnterior, valorNuevo, 
							id_recargo_copia, catidad_cobro_copia, fecha_gestion_recargo_copia )                             
                            
		values (  current_user(), 'UPDATE', now(), 
        
				  concat('IdRecargo: ', old.id_recargo, ' - CantidadCobro: ', old.catidad_cobro, ' - FechaGestionRecargo: ', old.fecha_gestion_recargo),                            
                  
				  concat('IdRecargo: ', new.id_recargo, ' - CantidadCobro: ', new.catidad_cobro, ' - FechaGestionRecargo: ', new.fecha_gestion_recargo),                            
                  
						  new.id_recargo, new.catidad_cobro, new.fecha_gestion_recargo
			   );


# Auditoria Gestion Recargo Delete


 Create trigger AuditoriaGestionRecargoDelete
	after Delete on gestion_recargo
for each row
	insert  into 
    
		AuditoriaGestionRecargo( usuario, accion, fechaModificacion, valorAnterior, valorNuevo, 
							id_recargo_copia, catidad_cobro_copia, fecha_gestion_recargo_copia )                             
                            
		values (  current_user(), 'DELETE', now(), 
        
				  concat('IdRecargo: ', old.id_recargo, ' - CantidadCobro: ', old.catidad_cobro, ' - FechaGestionRecargo: ', old.fecha_gestion_recargo),                            
                  
				  concat(' '),                            
                  
						old.id_recargo, old.catidad_cobro, old.fecha_gestion_recargo
			   );




/*

	AUDITORIA TABLA REPORTE
    
*/


create table if not exists AuditoriaReporte (

	id_AuditoriaReporte integer primary key auto_increment,
	usuario varchar(55) default null,
    accion varchar(55) default null, 
    fechaModificacion datetime default null,    
    valorAnterior text default null, 
    ValorNuevo text default null,    
    
    id_reporte_copia integer default null,
	id_institucion_copia integer default null,
	periodo_inicio_copia datetime default now(),
	periodo_fin_copia datetime default now(),
	catidad_recaudada_copia decimal(10,2) default null,
	fecha_reporte_copia datetime default now()
   
);

         
# Auditoria Auditoria Reporte Insert

 Create trigger AuditoriaReporteInsert
	after Insert on reporte
for each row
	insert  into 
    
		AuditoriaReporte(  usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
			id_reporte_copia, id_institucion_copia, periodo_inicio_copia, periodo_fin_copia, catidad_recaudada_copia, fecha_reporte_copia )                             
                            
		values (  current_user(), 'INSERT', now(), 
				  concat(' '), 
                  
				  concat( 'IdReporte: ', new.id_reporte, ' - IdInstitucion: ', new.id_institucion, ' - PeriodoInicio: ', new.periodo_inicio, 
						' - PeriodoFin: ', new.periodo_fin, ' - CantidadRecaudad: ', new.catidad_recaudada, ' - FechaReporte: ', new.fecha_reporte ),                            
                        
						  new.id_reporte, new.id_institucion, new.periodo_inicio, new.periodo_fin, new.catidad_recaudada, new.fecha_reporte
			   );
               
               
# Auditoria Auditoria Reporte Update

 Create trigger AuditoriaReporteUpdate
	after Update on reporte
for each row
	insert  into 
    
		AuditoriaReporte(  usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
			id_reporte_copia, id_institucion_copia, periodo_inicio_copia, periodo_fin_copia, catidad_recaudada_copia, fecha_reporte_copia )                             
                            
		values (  current_user(), 'UPDATE', now(), 
				  concat( 'IdReporte: ', old.id_reporte, ' - IdInstitucion: ', old.id_institucion, ' - PeriodoInicio: ', old.periodo_inicio, 
						' - PeriodoFin: ', old.periodo_fin, ' - CantidadRecaudad: ', old.catidad_recaudada, ' - FechaReporte: ', old.fecha_reporte ),                            
                  
				  concat( 'IdReporte: ', new.id_reporte, ' - IdInstitucion: ', new.id_institucion, ' - PeriodoInicio: ', new.periodo_inicio, 
						' - PeriodoFin: ', new.periodo_fin, ' - CantidadRecaudad: ', new.catidad_recaudada, ' - FechaReporte: ', new.fecha_reporte ),                            
                        
						  new.id_reporte, new.id_institucion, new.periodo_inicio, new.periodo_fin, new.catidad_recaudada, new.fecha_reporte
			   );
                              

               
# Auditoria Auditoria Reporte Delete

 Create trigger AuditoriaReporteDelete
	after Delete on reporte
for each row
	insert  into 
    
		AuditoriaReporte(  usuario, accion, fechaModificacion, valorAnterior, ValorNuevo, 
			id_reporte_copia, id_institucion_copia, periodo_inicio_copia, periodo_fin_copia, catidad_recaudada_copia, fecha_reporte_copia )                             
                            
		values (  current_user(), 'DELETE', now(), 
				  concat( 'IdReporte: ', old.id_reporte, ' - IdInstitucion: ', old.id_institucion, ' - PeriodoInicio: ', old.periodo_inicio, 
						' - PeriodoFin: ', old.periodo_fin, ' - CantidadRecaudad: ', old.catidad_recaudada, ' - FechaReporte: ', old.fecha_reporte ),                            
                  
				  concat( ' '),                            
                        
						  old.id_reporte, old.id_institucion, old.periodo_inicio, old.periodo_fin, old.catidad_recaudada, old.fecha_reporte
			   );
  
  create table if not exists cuenta(
	id_cuenta integer primary key auto_increment,
	id_persona integer default null, 
	usuario varchar(55) default null, 
	clave varchar(55) default null,
    fechaAcceso datetime default now() default null
);

alter table cuenta add constraint id_persona_fk foreign key (id_persona) references persona(id_persona) on delete no action on update cascade;

/*

	CREACION DE AUDITORIA DE ACCESO

*/ 

create table if not exists AuditoriaRegistroDeAcceso (

	id_AuditoriaRegistroDeAcceso integer primary key auto_increment,
	usuario varchar(55) default null,
    fechaHoraAcceso datetime default now() default null,        
	id_cuentaCu integer default null,
	id_personaCu integer default null, 
	usuarioCu varchar(55) default null, 
	claveCu varchar(55) default null,
    fechaAccesoCu datetime default now() default null
   
);

Create trigger TriggerRegistoAcceso
	after Update on cuenta 
for each row  insert into     
		AuditoriaRegistroDeAcceso( usuario, fechaHoraAcceso, id_cuentaCu, id_personaCu, usuarioCu, claveCu, fechaAccesoCu )                                                         
		values (  current_user(), now(), new.id_cuenta, new.id_persona, new.usuario, new.clave, new.fechaAcceso			   );
                                                    

/*

	Insercion de datos
    
                    
insert into cuenta (id_persona, usuario, clave) values ('1', 'Administrador 1', 'Root1234');
insert into cuenta (id_persona, usuario, clave) values ('2', 'Administrador 2', 'sudoRoot');
insert into cuenta (id_persona, usuario, clave) values ('3', 'Administrador 3', 'MongoSuper123');
insert into cuenta (id_persona, usuario, clave) values ('4', 'Administrador 4', 'admin-admin');


# Actualizar 
UPDATE cuenta SET fechaAcceso = now() WHERE id_cuenta = 1;
UPDATE cuenta SET fechaAcceso = now() WHERE id_cuenta = 2;
UPDATE cuenta SET fechaAcceso = now() WHERE id_cuenta = 3;
UPDATE cuenta SET fechaAcceso = now() WHERE id_cuenta = 4;
*/
      
CREATE FUNCTION GetFechaInicial() RETURNS DATETIME DETERMINISTIC NO SQL RETURN @FechaInicial;
CREATE FUNCTION GetFechaFin() RETURNS DATETIME DETERMINISTIC NO SQL RETURN @FechaFin;

CREATE VIEW Cantidad_Recolecion_Servicio_Diario  AS
select 
	id_servicio, 
	count(id_servicio) cantidad, 
	sum(valor_pagado) ValorRecaudado
from recaudacion 
	inner join  pago on recaudacion.id_recaudacion = pago.id_pago
		where pago.fecha_pago 
			between 
				concat(CURDATE(), ' 00:00:00') 
					and
				concat(CURDATE(), ' 23:59:59') 
    group by id_servicio having cantidad>=1;

#select * from Cantidad_Recolecion_Servicio_Diario;

CREATE VIEW Cantidad_Recolecion_Servicio_Semanal  AS
select 
    id_servicio, 
    count(id_servicio) cantidad, 
    sum(valor_pagado) ValorRecaudado
from recaudacion 
	inner join  pago on recaudacion.id_recaudacion = pago.id_pago
		where pago.fecha_pago 
			between 
				DATE_SUB(concat(CURDATE(), ' 00:00:00'), INTERVAL 1 WEEK) 
					AND 
				concat(CURDATE(), ' 23:59:59')
    group by id_servicio having cantidad>=1;

#select * from Cantidad_Recolecion_Servicio_Semanal;


/*
	Una lista de los cobradores con más recuperación realizada en el periodo de
	tiempo que el usuario defina
    
    Empleado  NumeroRecaudaciones CantidadRecuperada	
    Juan 		2						200
*/


CREATE VIEW ListaEmpleadosMayorRecuperacion  AS
select 
    recaudacion.id_empleado, 
    persona.cedula,
    persona.nombre,
    persona.correo,
    count(id_empleado) NumeroRecaudaciones, 
    sum(valor_pagado) CantidadRecuperada
from recaudacion 
	inner join  pago on recaudacion.id_recaudacion = pago.id_pago
    inner join persona on recaudacion.id_empleado = persona.id_persona
		where pago.fecha_pago 
			between GetFechaInicial() and GetFechaFin()
    group by id_empleado having NumeroRecaudaciones>=1    
	order by CantidadRecuperada DESC; 

select * from 
	( select 
		@FechaInicial := '2022-09-04 00:00:00' Fecha_Inicio, 
		@FechaFin := 	 '2022-09-10 00:00:00' Fecha_Fin 
	) 
Lista, ListaEmpleadosMayorRecuperacion;

