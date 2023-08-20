/*Base de datos para proyecto del curso Lenguajes de Bases de Datos
Fernando Perez Alpizar
Sebastian Rodriguez Rodriguez 
Bryan Daniel Cantillo Aguilar  
Tannya Granados Guerrero 
*/

--Creacion de usuario para administracion y conexion de la base de datos
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER ClinicaDBA IDENTIFIED BY clinica123
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE temp;

ALTER USER ClinicaDBA QUOTA UNLIMITED ON USERS;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO ClinicaDBA;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE TO ClinicaDBA;

--Crear una nueva conexion con este usuario
--El tipo de conexion debe ser: Basico
--El host debe ser: 127.0.0.1
--El puerto debe ser: 1521

--------------------------------BASE DE DATOS-----------------------------------
--Crear con el usuario ClinicaDBA

------------------------------CREACION DE TABLAS--------------------------------
--Pacientes
CREATE TABLE PACIENTES(
            IdPaciente NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY, --PK
            NomPaciente VARCHAR2(30),
            ApellidoPaciente VARCHAR2(40),
            CedulaPaciente NUMBER,
            TelefonoPaciente NUMBER,
            CorreoPaciente VARCHAR2(60));  

INSERT INTO PACIENTES(NomPaciente, ApellidoPaciente, CedulaPaciente, TelefonoPaciente, CorreoPaciente)
    VALUES('Juan', 'Perez', 11111111, 60606060, 'juan@paciente.com');
INSERT INTO PACIENTES(NomPaciente, ApellidoPaciente, CedulaPaciente, TelefonoPaciente, CorreoPaciente)
    VALUES('Maria', 'Lopez', 22222222, 70707070, 'maria@paciente.com');

SELECT * FROM PACIENTES;

--Empleados
CREATE TABLE EMPLEADOS(
            IdEmpleado NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY, --PK
            NomEmpleado VARCHAR2(30),
            ApellidoEmpleado VARCHAR2(40),
            CedulaEmpleado NUMBER,
            RolEmpleado VARCHAR2(25),--Medico, Secretario, Reumatologo
            TelefonoEmpleado NUMBER,
            CorreoEmpleado VARCHAR2(60)); 

INSERT INTO EMPLEADOS(NomEmpleado, ApellidoEmpleado, CedulaEmpleado, RolEmpleado, TelefonoEmpleado, CorreoEmpleado)
    VALUES('Carlos', 'Solano', 33333333, 'Secretario', 80808080, 'carlos@empleado.com');
INSERT INTO EMPLEADOS(NomEmpleado, ApellidoEmpleado, CedulaEmpleado, RolEmpleado, TelefonoEmpleado, CorreoEmpleado)
    VALUES('Marta', 'Rodrigues', 44444444, 'Enfermera', 90909090, 'marta@empleado.com');

SELECT * FROM EMPLEADOS;


--Servicios
CREATE TABLE SERVICIOS(
            IdServicio NUMBER PRIMARY KEY, --PK
            NomServicio VARCHAR2(30),
            DescServicio VARCHAR2(100)); 
            
--Servicios asociados a cirugias(transplantes...) se usan los codigos 100...
--Servicios basicos como limpiezas, vendajes... se usan los codigos 200...
--Servicios de odontologia se usan los codigos 300...
INSERT INTO SERVICIOS(IdServicio, NomServicio, DescServicio)
    VALUES(100, 'Cirugia', 'Procedimiento quirÃºrgico, pueden presentar riesgos o complicaciones, se utiliza anestesia general.');
INSERT INTO SERVICIOS(IdServicio, NomServicio, DescServicio)
    VALUES(101, 'Cirugia Menor', 'Procedimiento quirÃºrgico simple, sin riesgo o complicaciones, se utiliza anestesia local.');
INSERT INTO SERVICIOS(IdServicio, NomServicio, DescServicio)
    VALUES(201, 'CuraciÃ³n', 'Se realiza una limpieza a profundidad de la zona daÃ±ada por accidente o cirugÃ­a.');
INSERT INTO SERVICIOS(IdServicio, NomServicio, DescServicio)
    VALUES(202, 'Costura', 'Se realiza costura y limpieza de una cortadura que presente el cliente, se aplica anestesia local.');
    
SELECT * FROM SERVICIOS;


--Citas
CREATE TABLE CITAS(
            IdCita NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY, --PK
            IdPaciente NUMBER, --FK
            IdEmpleado NUMBER, --FK
            IdServicio NUMBER, --FK
            FechaCita DATE, --Formato DD/MM/AA
            EstadoCita VARCHAR2(10)); --Pendiente, Candelada o Atendida

ALTER TABLE CITAS ADD CONSTRAINT FK_IDPACIENTE_PACIENTES FOREIGN KEY (IdPaciente) REFERENCES PACIENTES (IdPaciente);
ALTER TABLE CITAS ADD CONSTRAINT FK_IDEMPLEADO_EMPLEADOS FOREIGN KEY (IdEmpleado) REFERENCES EMPLEADOS (IdEmpleado);
ALTER TABLE CITAS ADD CONSTRAINT FK_IDSERVICIO_SERVICIOS FOREIGN KEY (IdServicio) REFERENCES SERVICIOS (IdServicio);

INSERT INTO CITAS(IdPaciente, IdEmpleado, IdServicio, FechaCita, EstadoCita)
    VALUES(1, 2, 201, TO_DATE('15/08/23', 'DD/MM/YY'), 'Atendida');
INSERT INTO CITAS(IdPaciente, IdEmpleado, IdServicio, FechaCita, EstadoCita)
    VALUES(2, 2, 202, TO_DATE('03/05/23', 'DD/MM/YY'), 'Pendiente');

SELECT * FROM CITAS;


--Diagnosticos
CREATE TABLE DIAGNOSTICOS(
            IdDiagnostico NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY, --PK
            IdCita NUMBER, --FK
            DescDiagnostico VARCHAR2(100));

ALTER TABLE DIAGNOSTICOS ADD CONSTRAINT FK_IDCITA_CITAS FOREIGN KEY (IdCita) REFERENCES CITAS (IdCita);

INSERT INTO DIAGNOSTICOS(IdCita, DescDiagnostico)
    VALUES(1, 'El paciente contaba una herida en el antebrazo, se limpia la infeccion y se venda la zona.');

SELECT * FROM DIAGNOSTICOS;


--Medicamentos
CREATE TABLE MEDICAMENTOS(
            IdMedicamento NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY, --PK
            NomMedicamento VARCHAR2(40),
            DescMedicamento VARCHAR2(100),
            CostoMedicamento NUMBER);

INSERT INTO MEDICAMENTOS(NomMedicamento, DescMedicamento, CostoMedicamento)
    VALUES('Amoxicilina 10mg', 'Antibiotico utilizado para tratar infecciones', 800);
INSERT INTO MEDICAMENTOS(NomMedicamento, DescMedicamento, CostoMedicamento)
    VALUES('Paracetamol 500mg', 'Analgesico empleado para tratar el dolor leve.', 300);

SELECT * FROM MEDICAMENTOS;


--Recetas
CREATE TABLE RECETAS(
            IdReceta NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY, --PK
            IdDiagnostico NUMBER, --FK
            IdMedicamento NUMBER, --FK
            Cantidad NUMBER);

ALTER TABLE RECETAS ADD CONSTRAINT FK_IDDIAGNOSTICO_DIAGNOSTICOS FOREIGN KEY (IdDiagnostico) REFERENCES DIAGNOSTICOS (IdDiagnostico);
ALTER TABLE RECETAS ADD CONSTRAINT FK_IDMEDICAMENTO_MEDICAMENTOS FOREIGN KEY (IdMedicamento) REFERENCES MEDICAMENTOS (IdMedicamento);

INSERT INTO RECETAS(IdDiagnostico, IdMedicamento, Cantidad)
    VALUES(1, 1, 10);

SELECT * FROM RECETAS;


--Facturas
CREATE TABLE FACTURAS(
            IdFactura NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY, --PK
            IdCita NUMBER, --FK  Esto contiene al Medico, Paciente y servicio asociados
            IdReceta NUMBER, --FK
            CostoAdicional NUMBER,
            Total NUMBER);

ALTER TABLE FACTURAS ADD CONSTRAINT FK_IDCITA_FACTURAS FOREIGN KEY (IdCita) REFERENCES CITAS (IdCita);
ALTER TABLE FACTURAS ADD CONSTRAINT FK_IDRECETA_FACTURAS FOREIGN KEY (IdReceta) REFERENCES RECETAS (IdReceta);

INSERT INTO FACTURAS(IdCita, IdReceta, CostoAdicional, Total)
    VALUES(1, 1, 50000, 58000);

SELECT * FROM FACTURAS;

--Contacto
CREATE TABLE CONTACTO(
            IdContacto NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY, --PK
            Nombre VARCHAR2(40),
            Apellido VARCHAR2(40),
            Telefono NUMBER,
            Mensaje VARCHAR2(250));
            
--Reportes de acciones
CREATE TABLE REPORTECITAS(
            Fecha DATE, 
            Usuario VARCHAR2(60),
            Accion VARCHAR2(20));
            
CREATE TABLE REPORTEDIAGNOSTICOS(
            Fecha DATE, 
            Usuario VARCHAR2(60),
            Accion VARCHAR2(20));
                      
CREATE TABLE REPORTEFACTURAS(
            Fecha DATE, 
            Usuario VARCHAR2(60),
            Accion VARCHAR2(20));
            
CREATE TABLE REPORTEPACIENTES(
            Fecha DATE, 
            Usuario VARCHAR2(60),
            Accion VARCHAR2(20));
 
CREATE TABLE REPORTERECETAS(
            Fecha DATE, 
            Usuario VARCHAR2(60),
            Accion VARCHAR2(20));           

CREATE TABLE REPORTEMEDICAMENTOS(
            Fecha DATE, 
            Usuario VARCHAR2(60),
            Accion VARCHAR2(20));

--Errores
CREATE TABLE REPORTEERRORES(
                Fecha DATE,
                Procedencia VARCHAR2(200),
                CodigoError NUMBER,
                MensajeError VARCHAR2(500));

            
-------------------------------CREACION DE SP-----------------------------------
--Comando para el correcto funcinamiento de bloques PL/SQL y SP
SET SERVEROUTPUT ON;

--SP para insertar
--Pacientes
CREATE OR REPLACE PROCEDURE AgregarPaciente(Nombre IN VARCHAR2,
                                            Apellido IN VARCHAR2,
                                            Cedula IN NUMBER,
                                            Telefono IN NUMBER,
                                            Correo IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    INSERT INTO PACIENTES(NomPaciente, ApellidoPaciente, CedulaPaciente, TelefonoPaciente, CorreoPaciente)
        VALUES(Nombre, Apellido, Cedula, Telefono, Correo);
    DBMS_OUTPUT.PUT_LINE('Paciente agregado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE AgregarPaciente('Fernando', 'Perez', 55555555, 51515151, 'fernando@paciente.com');


--Empleados
CREATE OR REPLACE PROCEDURE AgregarEmpleado(Nombre IN VARCHAR2,
                                            Apellido IN VARCHAR2,
                                            Cedula IN NUMBER,
                                            Rol IN VARCHAR2,
                                            Telefono IN NUMBER,
                                            Correo IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    INSERT INTO EMPLEADOS(NomEmpleado, ApellidoEmpleado, CedulaEmpleado, RolEmpleado, TelefonoEmpleado, CorreoEmpleado)
    VALUES(Nombre, Apellido, Cedula, Rol, Telefono, Correo);
    DBMS_OUTPUT.PUT_LINE('Empleado agregado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE AgregarEmpleado('Jose', 'Alpizar', 99999999, 'Doctor', 91919191, 'jose@empleado.com');


--Servicios
CREATE OR REPLACE PROCEDURE AgregarServicio(IDServicio IN NUMBER,
                                            Nombre IN VARCHAR2,
                                            Descripcion IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    INSERT INTO SERVICIOS(IdServicio, NomServicio, DescServicio)
        VALUES(IDServicio, Nombre, Descripcion);
    DBMS_OUTPUT.PUT_LINE('Servicio agregado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE AgregarServicio(300, 'Limpieza bucal', 'Limpieza profunda de los dientes y muelas.');


--Citas
CREATE OR REPLACE PROCEDURE AgregarCita(IDPaciente IN NUMBER,
                                        IDEmpleado IN NUMBER,
                                        IDServicio IN NUMBER,
                                        Fecha IN VARCHAR2, --Luego se convierte a tipo date
                                        Estado IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    INSERT INTO CITAS(IdPaciente, IdEmpleado, IdServicio, FechaCita, EstadoCita)
        VALUES(IDPaciente, IDEmpleado, IDServicio, TO_DATE(Fecha, 'DD/MM/YY'), Estado);
    DBMS_OUTPUT.PUT_LINE('Cita agregada con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE AgregarCita(3, 3, 300, '02/06/23', 'Atendida');


--Diagnosticos
CREATE OR REPLACE PROCEDURE AgregarDiagnostico(IDCita IN NUMBER,
                                               Descripcion IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    INSERT INTO DIAGNOSTICOS(IdCita, DescDiagnostico)
        VALUES(IDCita, Descripcion);
    DBMS_OUTPUT.PUT_LINE('Diagnostico agregado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE AgregarDiagnostico(3, 'El paciente no tiene caries, se realiza limpieza.');


--Medicamentos
CREATE OR REPLACE PROCEDURE AgregarMedicamento(Nombre IN VARCHAR2,                             
                                               Descripcion IN VARCHAR2,
                                               Costo IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    INSERT INTO MEDICAMENTOS(NomMedicamento, DescMedicamento, CostoMedicamento)
        VALUES(Nombre, Descripcion, Costo);
    DBMS_OUTPUT.PUT_LINE('Medicamento agregado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE AgregarMedicamento('Penicilína 200mg', 'Desinflamatorio empleado para tratar la inflamaciones varias.', 425);

--Recetas
CREATE OR REPLACE PROCEDURE AgregarRecetas(IDDiagnostico IN NUMBER,                             
                                           IDMedicamento IN NUMBER,
                                           Cant IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    INSERT INTO RECETAS(IdDiagnostico, IdMedicamento, Cantidad)
        VALUES(IDDiagnostico, IDMedicamento, Cant);
    DBMS_OUTPUT.PUT_LINE('Receta agregada con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarRecetas', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarRecetas', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarRecetas', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarRecetas', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE AgregarRecetas(2, 3, 2);


--Facturas
CREATE OR REPLACE PROCEDURE AgregarFactura(IDCita IN NUMBER,                             
                                           IDReceta IN NUMBER,
                                           CostoAd IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    INSERT INTO FACTURAS(IdCita, IdReceta, CostoAdicional)
        VALUES(IDCita, IDReceta, CostoAd);
    DBMS_OUTPUT.PUT_LINE('Factura agregada con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE AgregarFactura(3, 2, 25000);

--Contacto
CREATE OR REPLACE PROCEDURE AgregarContacto(Nombre IN VARCHAR2,                             
                                           Apellido IN VARCHAR2,
                                           Telefono IN NUMBER,
                                           Mensaje IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    INSERT INTO CONTACTO(Nombre, Apellido, Telefono, Mensaje)
        VALUES(Nombre, Apellido, Telefono, Mensaje);
    DBMS_OUTPUT.PUT_LINE('Contacto agregada con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE AgregarContacto('Tannya','Granados',25557777, 'hola');


--SP para editar
--Pacientes
CREATE OR REPLACE PROCEDURE EditarPaciente(ID IN NUMBER,
                                           Nombre IN VARCHAR2,
                                           Apellido IN VARCHAR2,
                                           Cedula IN NUMBER,
                                           Telefono IN NUMBER,
                                           Correo IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    UPDATE PACIENTES SET NomPaciente = Nombre, ApellidoPaciente = Apellido, CedulaPaciente = Cedula, TelefonoPaciente = Telefono, CorreoPaciente = Correo
    WHERE IdPaciente = ID;
    DBMS_OUTPUT.PUT_LINE('Paciente editado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EditarPaciente(3, 'Fernanda', 'Perez', 55555555, 99999999, 'fernanda@paciente.com');



--Empleados
CREATE OR REPLACE PROCEDURE EditarEmpleado(ID IN NUMBER,
                                           Nombre IN VARCHAR2,
                                           Apellido IN VARCHAR2,
                                           Cedula IN NUMBER,
                                           Rol IN VARCHAR2,
                                           Telefono IN NUMBER,
                                           Correo IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    UPDATE EMPLEADOS SET NomEmpleado = Nombre, ApellidoEmpleado = Apellido, CedulaEmpleado = Cedula,RolEmpleado = Rol, TelefonoEmpleado = Telefono, CorreoEmpleado = Correo
    WHERE IdEmpleado = ID;
    DBMS_OUTPUT.PUT_LINE('Empleado editado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EditarEmpleado(3,'Juan', 'Alpizar', 99999911, 'Doctor', 91919192, 'juan@empleado.com');

SELECT * FROM SERVICIOS;
--Servicios
CREATE OR REPLACE PROCEDURE EditarServicio(ID IN NUMBER,
                                           Nombre IN VARCHAR2,
                                           Descripcion IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    UPDATE SERVICIOS SET NomServicio = Nombre, DescServicio = Descripcion
    WHERE IdServicio = ID;
    DBMS_OUTPUT.PUT_LINE('Servicio editado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EditarServicio(300, 'Limpieza bucal', 'Limpieza profunda con agua a presion en los dientes.');


--Citas
CREATE OR REPLACE PROCEDURE EditarCita(ID IN NUMBER,
                                       IDPa IN NUMBER,
                                       IDEm IN NUMBER,
                                       IDSer IN NUMBER,
                                       Fecha IN VARCHAR2, --Luego se convierte a tipo date
                                       Estado IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    UPDATE CITAS SET IdPaciente = IDPa, IdEmpleado = IDEm, IdServicio = IDSer, FechaCita = TO_DATE(Fecha, 'DD/MM/YY'), EstadoCita = Estado
    WHERE IdCita = ID;
    DBMS_OUTPUT.PUT_LINE('Cita editada con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EditarCita(3, 2, 3, 300, '02/06/23', 'Atendida');


--Diagnosticos
CREATE OR REPLACE PROCEDURE EditarDiagnostico(ID IN NUMBER,
                                              IDCit IN NUMBER,
                                              Descripcion IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    UPDATE DIAGNOSTICOS SET IdCita = IDCit, DescDiagnostico = Descripcion
    WHERE IdDiagnostico = ID;
    DBMS_OUTPUT.PUT_LINE('Diagnostico editado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EditarDiagnostico(2, 3, 'Paciente sin caries, se realiza limpieza con exito.');


--Medicamentos
CREATE OR REPLACE PROCEDURE EditarMedicamento(ID IN NUMBER,
                                              Nombre IN VARCHAR2,                             
                                              Descripcion IN VARCHAR2,
                                              Costo IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    UPDATE MEDICAMENTOS SET NomMedicamento = Nombre, DescMedicamento = Descripcion, CostoMedicamento = Costo
    WHERE IdMedicamento = ID;
    DBMS_OUTPUT.PUT_LINE('Medicamento editado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EditarMedicamento(3, 'Ibuprofeno 400mg', 'Desinflamatorio empleado para tratar la inflamaciones varias.', 420);


--Recetas
CREATE OR REPLACE PROCEDURE EditarReceta(ID IN NUMBER,
                                         IDDiag IN NUMBER,                             
                                         IDMed IN NUMBER,
                                         Cant IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    UPDATE RECETAS SET IdDiagnostico = IDDiag, IdMedicamento = IDMed, Cantidad = Cant
    WHERE IdReceta = ID;
    DBMS_OUTPUT.PUT_LINE('Receta editada con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarReceta', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarReceta', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarReceta', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarReceta', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EditarReceta(2, 2, 3, 4);


--Facturas
CREATE OR REPLACE PROCEDURE EditarFactura(ID IN NUMBER,
                                          IDCit IN NUMBER,                             
                                          IDRec IN NUMBER,
                                          CostoAd IN NUMBER,
                                          Tot IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    UPDATE FACTURAS SET IdCita = IDCit, IdReceta = IDRec, CostoAdicional = CostoAd, Total = Tot
    WHERE IdFactura = ID;
    DBMS_OUTPUT.PUT_LINE('Factura editada con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EditarFactura(2, 3, 2, 27000, 27850);


--Contacto
CREATE OR REPLACE PROCEDURE EditarContacto(ID IN NUMBER,
                                          Nom IN VARCHAR2,                             
                                          Appe IN VARCHAR2,
                                          Tel IN NUMBER,
                                          Mensa IN VARCHAR2)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    UPDATE CONTACTO SET Nombre = Nom, Apellido = Appe, Telefono = Tel, Mensaje = Mensa
    WHERE IdContacto = ID;
    DBMS_OUTPUT.PUT_LINE('Contacto editado con exito');
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EditarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EditarContacto(1, 'Fernando', 'Perez', 1111111, 'Favor venir');


--SP para eliminar
--Pacientes
CREATE OR REPLACE PROCEDURE EliminarPaciente(ID IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    DELETE FROM PACIENTES
    WHERE IdPaciente = ID;
    DBMS_OUTPUT.PUT_LINE('Paciente eliminado con exito');
EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EliminarPaciente();


--Empleados
CREATE OR REPLACE PROCEDURE EliminarEmpleado(ID IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    DELETE FROM EMPLEADOS
    WHERE IdEmpleado = ID;
    DBMS_OUTPUT.PUT_LINE('Empleado eliminado con exito');
EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarEmpleado', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EliminarEmpleado();


--Servicios
CREATE OR REPLACE PROCEDURE EliminarServicio(ID IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    DELETE FROM SERVICIOS
    WHERE IdServicio = ID;
    DBMS_OUTPUT.PUT_LINE('Servicio eliminado con exito');
EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarServicio', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EliminarServicio();


--Citas
CREATE OR REPLACE PROCEDURE EliminarCita(ID IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    DELETE FROM CITAS
    WHERE IdCita = ID;
    DBMS_OUTPUT.PUT_LINE('Cita eliminida con exito');
EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarCita', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EliminarCita();


--Diagnosticos
CREATE OR REPLACE PROCEDURE EliminarDiagnostico(ID IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    DELETE FROM DIAGNOSTICOS 
    WHERE IdDiagnostico = ID;
    DBMS_OUTPUT.PUT_LINE('Diagnostico eliminado con exito');
EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarDiagnostico', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EliminarDiagnostico();


--Medicamentos
CREATE OR REPLACE PROCEDURE EliminarMedicamento(ID IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    DELETE FROM MEDICAMENTOS
    WHERE IdMedicamento = ID;
    DBMS_OUTPUT.PUT_LINE('Medicamento eliminado con exito');
EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarMedicamento', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EliminarMedicamento();


--Recetas
CREATE OR REPLACE PROCEDURE EliminarReceta(ID IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    DELETE FROM RECETAS 
    WHERE IdReceta = ID;
    DBMS_OUTPUT.PUT_LINE('Receta eliminada con exito');
EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarReceta', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarReceta', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarReceta', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EliminarReceta();

--Facturas
CREATE OR REPLACE PROCEDURE EliminarFactura(ID IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    DELETE FROM FACTURAS
    WHERE IdFactura = ID;
    DBMS_OUTPUT.PUT_LINE('Factura eliminada con exito');
EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarFactura', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EliminarFactura();

--Contacto
CREATE OR REPLACE PROCEDURE EliminarContacto(ID IN NUMBER)
AS
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN
    DELETE FROM CONTACTO
    WHERE IdContacto = ID;
    DBMS_OUTPUT.PUT_LINE('Contacto eliminado con exito');
EXCEPTION  
    WHEN NO_DATA_FOUND THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'EliminarContacto', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END;

EXECUTE EliminarContacto();


------------------------------CREACION DE VISTAS--------------------------------
--Vista de empleados
CREATE OR REPLACE VIEW VistaEmpleados AS
SELECT IDEMPLEADO,
CEDULAEMPLEADO,
NOMEMPLEADO,
APELLIDOEMPLEADO,
ROLEMPLEADO,
TELEFONOEMPLEADO, 
CORREOEMPLEADO
FROM EMPLEADOS
ORDER BY IDEMPLEADO ASC;

--Vista de pacientes
CREATE OR REPLACE VIEW VistaPacientes AS SELECT
IDPACIENTE,
CEDULAPACIENTE,
NOMPACIENTE,
APELLIDOPACIENTE,
TELEFONOPACIENTE,
CORREOPACIENTE
FROM PACIENTES
ORDER BY IDPACIENTE ASC;

--Vista de recetas
CREATE OR REPLACE VIEW VistaRecetas AS
SELECT R.IDRECETA, P.NOMPACIENTE, P.APELLIDOPACIENTE, D.DESCDIAGNOSTICO, M.NOMMEDICAMENTO, R.CANTIDAD
FROM RECETAS R
JOIN DIAGNOSTICOS D ON R.IDDIAGNOSTICO = D.IDDIAGNOSTICO
JOIN MEDICAMENTOS M ON M.IDMEDICAMENTO = R.IDMEDICAMENTO JOIN CITAS C ON C.IDCITA=D.IDCITA
JOIN PACIENTES P ON P.IDPACIENTE=C.IDPACIENTE
ORDER BY R.IDRECETA ASC;

--Vista de citas
CREATE OR REPLACE VIEW VistaCitas AS
SELECT C.IDCITA, P.NOMPACIENTE, P.APELLIDOPACIENTE, C.FECHACITA, C.ESTADOCITA
FROM CITAS C JOIN PACIENTES P ON C.IDPACIENTE=P.IDPACIENTE
ORDER BY C.IDCITA ASC ;

--Vista de diagnosticos
CREATE OR REPLACE VIEW VistaDiagnosticos AS
SELECT D.IDDIAGNOSTICO,
D.IDCITA,
P.NOMPACIENTE,
E.NOMEMPLEADO,
E.ROLEMPLEADO,
D.DESCDIAGNOSTICO
FROM DIAGNOSTICOS D JOIN CITAS C ON
D.IDCITA=C.IDCITA JOIN PACIENTES P ON
C.IDPACIENTE=P.IDPACIENTE JOIN EMPLEADOS E ON
C.IDEMPLEADO=E.IDEMPLEADO;

--Vista de servicios 
CREATE OR REPLACE VIEW VistaServicios AS
SELECT IDSERVICIO, NOMSERVICIO, DESCSERVICIO
FROM SERVICIOS 
ORDER BY IDSERVICIO ASC;

--Vista de medicamentos
CREATE OR REPLACE VIEW VistaMedicamentos AS
SELECT IDMEDICAMENTO, NOMMEDICAMENTO, DESCMEDICAMENTO, COSTOMEDICAMENTO
FROM MEDICAMENTOS 
ORDER BY IDMEDICAMENTO ASC;

--Vista Facturas
CREATE OR REPLACE VIEW VistaFacturas AS
SELECT
    f.idFactura,
    c.idCita,
    p.NomPaciente || ' ' || p.ApellidoPaciente AS "nompaciente",
    s.NomServicio AS "nomservicio",
    m.NomMedicamento AS "nommedicamento",
    f.CostoAdicional AS "costoadicional",
    f.total AS "total"
FROM
    FACTURAS f
    JOIN CITAS c ON f.IdCita = c.IdCita
    JOIN PACIENTES p ON c.IdPaciente = p.IdPaciente
    JOIN SERVICIOS s ON c.IdServicio = s.IdServicio
    JOIN RECETAS r ON f.IdReceta = r.IdReceta
    JOIN MEDICAMENTOS m ON r.IdMedicamento = m.IdMedicamento
ORDER BY IDFACTURA ASC;

--Vista de Contacto
CREATE OR REPLACE VIEW VistaContacto AS
SELECT IDCONTACTO, NOMBRE, APELLIDO, TELEFONO, MENSAJE
FROM CONTACTO
ORDER BY IDCONTACTO ASC;


----------------------------CREACION DE TRIGGERS--------------------------------
--Trigger para reportes sobre datos sensibles al cliente 
CREATE OR REPLACE TRIGGER REPORTECITAS
AFTER INSERT OR DELETE OR UPDATE ON CITAS
BEGIN
    IF INSERTING THEN
        INSERT INTO REPORTECITAS VALUES (SYSDATE, 'INSERT', USER);
    ELSIF UPDATING THEN
        INSERT INTO REPORTECITAS VALUES (SYSDATE, 'UPDATE', USER);
    ELSIF DELETING THEN
        INSERT INTO REPORTECITAS VALUES (SYSDATE, 'DELETE', USER);
    END IF;
END;


CREATE OR REPLACE TRIGGER REPORTEDIAGNOSTICOS
AFTER INSERT OR DELETE OR UPDATE ON DIAGNOSTICOS
BEGIN
    IF INSERTING THEN
        INSERT INTO REPORTEDIAGNOSTICOS VALUES (SYSDATE, 'INSERT', USER);
    ELSIF UPDATING THEN
        INSERT INTO REPORTEDIAGNOSTICOS VALUES (SYSDATE, 'UPDATE', USER);
    ELSIF DELETING THEN
        INSERT INTO REPORTEDIAGNOSTICOS VALUES (SYSDATE, 'DELETE', USER);
    END IF;
END;


CREATE OR REPLACE TRIGGER REPORTEFACTURAS
AFTER INSERT OR DELETE OR UPDATE ON FACTURAS
BEGIN
    IF INSERTING THEN
        INSERT INTO REPORTEFACTURAS VALUES (SYSDATE, 'INSERT', USER);
    ELSIF UPDATING THEN
        INSERT INTO REPORTEFACTURAS VALUES (SYSDATE, 'UPDATE', USER);
    ELSIF DELETING THEN
        INSERT INTO REPORTEFACTURAS VALUES (SYSDATE, 'DELETE', USER);
    END IF;
END;


CREATE OR REPLACE TRIGGER REPORTEPACIENTES
AFTER INSERT OR DELETE OR UPDATE ON PACIENTES
BEGIN
    IF INSERTING THEN
        INSERT INTO REPORTEPACIENTES VALUES (SYSDATE, 'INSERT', USER);
    ELSIF UPDATING THEN
        INSERT INTO REPORTEPACIENTES VALUES (SYSDATE, 'UPDATE', USER);
    ELSIF DELETING THEN
        INSERT INTO REPORTEPACIENTES VALUES (SYSDATE, 'DELETE', USER);
    END IF;
END;


CREATE  OR REPLACE TRIGGER REPORTERECETAS
AFTER INSERT OR DELETE OR UPDATE ON RECETAS
BEGIN
    IF INSERTING THEN
        INSERT INTO REPORTERECETAS VALUES (SYSDATE, 'INSERT', USER);
    ELSIF UPDATING THEN
        INSERT INTO REPORTERECETAS VALUES (SYSDATE, 'UPDATE', USER);
    ELSIF DELETING THEN
        INSERT INTO REPORTERECETAS VALUES (SYSDATE, 'DELETE', USER);
    END IF;
END;


CREATE OR REPLACE TRIGGER REPORTEMEDICAMENTOS
AFTER INSERT OR DELETE OR UPDATE ON MEDICAMENTOS
BEGIN
    IF INSERTING THEN
        INSERT INTO REPORTEMEDICAMENTOS VALUES (SYSDATE, 'INSERT', USER);
    ELSIF UPDATING THEN
        INSERT INTO REPORTEMEDICAMENTOS VALUES (SYSDATE, 'UPDATE', USER);
    ELSIF DELETING THEN
        INSERT INTO REPORTEMEDICAMENTOS VALUES (SYSDATE, 'DELETE', USER);
    END IF;
END;


--Trigger para calcular el total
CREATE OR REPLACE TRIGGER CALCULOTOTALFACTURA
BEFORE INSERT ON FACTURAS
FOR EACH ROW
DECLARE
    IMPUESTO NUMBER := 0.07;
    COSTOMEDICAMENTO NUMBER := 0;
    CANTIDAD NUMBER := 0;
    
    CodigoError NUMBER;
    MensajeError VARCHAR2(500);
BEGIN 
    SELECT M.COSTOMEDICAMENTO, R.CANTIDAD
    INTO COSTOMEDICAMENTO, CANTIDAD
    FROM MEDICAMENTOS M, RECETAS R 
    WHERE R.IDRECETA = :NEW.IDRECETA
    AND R.IDMEDICAMENTO = M.IDMEDICAMENTO;
    
    COSTOMEDICAMENTO := COSTOMEDICAMENTO * CANTIDAD;
    
    :NEW.TOTAL := :NEW.COSTOADICIONAL + COSTOMEDICAMENTO;
    
    :NEW.TOTAL := :NEW.TOTAL + (:NEW.TOTAL * IMPUESTO);
EXCEPTION  
    WHEN VALUE_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN INVALID_NUMBER THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN PROGRAM_ERROR THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
    WHEN OTHERS THEN
        CodigoError :=  SQLCODE;
        MensajeError := SQLERRM;
        INSERT INTO REPORTEERRORES VALUES(SYSDATE, 'AgregarPaciente', CodigoError, MensajeError);
        DBMS_OUTPUT.PUT_LINE('Se ha generado un error.');
END; 


----------------------------CREACION DE PAQUETES--------------------------------








    