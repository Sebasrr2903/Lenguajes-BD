/*Base de datos para proyecto del curso Lenguajes de Bases de Datos
Fernando Pérez Alpízar
Sebastian Rodriguez Rodriguez 
Bryan Daniel Cantillo Aguilar  
Tannya Granados Guerrero 
*/

--Creación de usuario para administración y conexión de la base de datos
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER ClinicaDBA IDENTIFIED BY clinica123
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE temp;

ALTER USER ClinicaDBA QUOTA UNLIMITED ON USERS;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO ClinicaDBA;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE TO ClinicaDBA;

--Crear una nueva conexión con este usuario
--El tipo de conexión debe ser: Básico
--El host debe ser: 127.0.0.1
--El puerto debe ser: 1521

--------------------------------BASE DE DATOS-----------------------------------
--Crear con el usuario ClinicaDBA

------------------------------CREACIÓN DE TABLAS--------------------------------
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
    VALUES(100, 'Cirugia', 'Procedimiento quirúrgico, pueden presentar riesgos o complicaciones, se utiliza anestesia general.');
INSERT INTO SERVICIOS(IdServicio, NomServicio, DescServicio)
    VALUES(101, 'Cirugia Menor', 'Procedimiento quirúrgico simple, sin riesgo o complicaciones, se utiliza anestesia local.');
INSERT INTO SERVICIOS(IdServicio, NomServicio, DescServicio)
    VALUES(201, 'Curación', 'Se realiza una limpieza a profundidad de la zona dañada por accidente o cirugía.');
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
    VALUES(1, 'El paciente contaba una herida en el antebrazo, se limpió la infección y se vendó la zona.');

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
    VALUES('Paracetamol 500mg', 'Analgésico empleado para tratar el dolor leve.', 300);

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



-------------------------------CREACIÓN DE SP-----------------------------------
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
BEGIN
    INSERT INTO PACIENTES(NomPaciente, ApellidoPaciente, CedulaPaciente, TelefonoPaciente, CorreoPaciente)
        VALUES(Nombre, Apellido, Cedula, Telefono, Correo);
    DBMS_OUTPUT.PUT_LINE('Paciente agregado con éxito');
END;

EXEC AgregarPaciente('Fernando', 'Perez', 55555555, 51515151, 'fernando@paciente.com');


--Empleados
CREATE OR REPLACE PROCEDURE AgregarEmpleado(Nombre IN VARCHAR2,
                                            Apellido IN VARCHAR2,
                                            Cedula IN NUMBER,
                                            Rol IN VARCHAR2,
                                            Telefono IN NUMBER,
                                            Correo IN VARCHAR2)
AS
BEGIN
    INSERT INTO EMPLEADOS(NomEmpleado, ApellidoEmpleado, CedulaEmpleado, RolEmpleado, TelefonoEmpleado, CorreoEmpleado)
    VALUES(Nombre, Apellido, Cedula, Rol, Telefono, Correo);
    DBMS_OUTPUT.PUT_LINE('Empleado agregado con éxito');
END;

EXEC AgregarEmpleado('Jose', 'Alpizar', 99999999, 'Doctor', 91919191, 'jose@empleado.com');


--Servicios
CREATE OR REPLACE PROCEDURE AgregarServicio(IDServicio IN NUMBER,
                                            Nombre IN VARCHAR2,
                                            Descripcion IN VARCHAR2)
AS
BEGIN
    INSERT INTO SERVICIOS(IdServicio, NomServicio, DescServicio)
        VALUES(IDServicio, Nombre, Descripcion);
    DBMS_OUTPUT.PUT_LINE('Servicio agregado con éxito');
END;

EXEC AgregarServicio(300, 'Limpieza bucal', 'Limpieza profunda de los dientes y muelas.');


--Citas
CREATE OR REPLACE PROCEDURE AgregarCita(IDPaciente IN NUMBER,
                                        IDEmpleado IN NUMBER,
                                        IDServicio IN NUMBER,
                                        Fecha IN VARCHAR2, --Luego se convierte a tipo date
                                        Estado IN VARCHAR2)
AS
BEGIN
    INSERT INTO CITAS(IdPaciente, IdEmpleado, IdServicio, FechaCita, EstadoCita)
        VALUES(IDPaciente, IDEmpleado, IDServicio, TO_DATE(Fecha, 'DD/MM/YY'), Estado);
    DBMS_OUTPUT.PUT_LINE('Cita agregada con éxito');
END;

EXEC AgregarCita(3, 3, 300, '02/06/23', 'Atendida');


--Diagnosticos
CREATE OR REPLACE PROCEDURE AgregarDiagnostico(IDCita IN NUMBER,
                                               Descripcion IN VARCHAR2)
AS
BEGIN
    INSERT INTO DIAGNOSTICOS(IdCita, DescDiagnostico)
        VALUES(IDCita, Descripcion);
    DBMS_OUTPUT.PUT_LINE('Diagnostico agregado con éxito');
END;

EXEC AgregarDiagnostico(3, 'El paciente no tiene caries, se realizó limpieza.');


--Medicamentos
CREATE OR REPLACE PROCEDURE AgregarMedicamento(Nombre IN VARCHAR2,                             
                                               Descripcion IN VARCHAR2,
                                               Costo IN NUMBER)
AS
BEGIN
    INSERT INTO MEDICAMENTOS(NomMedicamento, DescMedicamento, CostoMedicamento)
        VALUES(Nombre, Descripcion, Costo);
    DBMS_OUTPUT.PUT_LINE('Medicamento agregado con éxito');
END;

EXEC AgregarMedicamento('Ibuprofeo 200mg', 'Desinflamatorio empleado para tratar la inflamaciones varias.', 425);


--Recetas
CREATE OR REPLACE PROCEDURE AgregarRecetas(IDDiagnostico IN NUMBER,                             
                                           IDMedicamento IN NUMBER,
                                           Cant IN NUMBER)
AS
BEGIN
    INSERT INTO RECETAS(IdDiagnostico, IdMedicamento, Cantidad)
        VALUES(IDDiagnostico, IDMedicamento, Cant);
    DBMS_OUTPUT.PUT_LINE('Receta agregada con éxito');
END;

EXEC AgregarRecetas(2, 3, 2);


--Facturas
CREATE OR REPLACE PROCEDURE AgregarFactura(IDCita IN NUMBER,                             
                                           IDReceta IN NUMBER,
                                           CostoAd IN NUMBER,
                                           Tot IN NUMBER)
AS
BEGIN
    INSERT INTO FACTURAS(IdCita, IdReceta, CostoAdicional, Total)
        VALUES(IDCita, IDReceta, CostoAd, Tot);
    DBMS_OUTPUT.PUT_LINE('Factura agregada con éxito');
END;

EXEC AgregarFactura(3, 2, 25000, 25850);


--SP para editar
--Pacientes
CREATE OR REPLACE PROCEDURE EditarPaciente(ID IN NUMBER,
                                           Nombre IN VARCHAR2,
                                           Apellido IN VARCHAR2,
                                           Cedula IN NUMBER,
                                           Telefono IN NUMBER,
                                           Correo IN VARCHAR2)
AS
BEGIN
    UPDATE PACIENTES SET NomPaciente = Nombre, ApellidoPaciente = Apellido, CedulaPaciente = Cedula, TelefonoPaciente = Telefono, CorreoPaciente = Correo
    WHERE IdPaciente = ID;
    DBMS_OUTPUT.PUT_LINE('Paciente editado con éxito');
END;

EXEC EditarPaciente(3, 'Fernanda', 'Castro', 55555555, 99999999, 'fernanda@paciente.com');


--Empleados
CREATE OR REPLACE PROCEDURE EditarEmpleado(ID IN NUMBER,
                                           Nombre IN VARCHAR2,
                                           Apellido IN VARCHAR2,
                                           Cedula IN NUMBER,
                                           Rol IN VARCHAR2,
                                           Telefono IN NUMBER,
                                           Correo IN VARCHAR2)
AS
BEGIN
    UPDATE EMPLEADOS SET NomEmpleado = Nombre, ApellidoEmpleado = Apellido, CedulaEmpleado = Cedula,RolEmpleado = Rol, TelefonoEmpleado = Telefono, CorreoEmpleado = Correo
    WHERE IdEmpleado = ID;
    DBMS_OUTPUT.PUT_LINE('Empleado editado con éxito');
END;

EXEC EditarEmpleado(3,'Juan', 'Alpizar', 99999911, 'Doctor', 91919192, 'juan@empleado.com');


--Servicios
CREATE OR REPLACE PROCEDURE EditarServicio(ID IN NUMBER,
                                           Nombre IN VARCHAR2,
                                           Descripcion IN VARCHAR2)
AS
BEGIN
    UPDATE SERVICIOS SET NomServicio = Nombre, DescServicio = Descripcion
    WHERE IdServicio = ID;
    DBMS_OUTPUT.PUT_LINE('Servicio editado con éxito');
END;

EXEC EditarServicio(300, 'Limpieza bucal', 'Limpieza profunda con agua a presión en los dientes.');


--Citas
CREATE OR REPLACE PROCEDURE EditarCita(ID IN NUMBER,
                                       IDPa IN NUMBER,
                                       IDEm IN NUMBER,
                                       IDSer IN NUMBER,
                                       Fecha IN VARCHAR2, --Luego se convierte a tipo date
                                       Estado IN VARCHAR2)
AS
BEGIN
    UPDATE CITAS SET IdPaciente = IDPa, IdEmpleado = IDEm, IdServicio = IDSer, FechaCita = TO_DATE(Fecha, 'DD/MM/YY'), EstadoCita = Estado
    WHERE IdCita = ID;
    DBMS_OUTPUT.PUT_LINE('Cita editada con éxito');
END;

EXEC EditarCita(3, 2, 3, 300, '02/06/23', 'Atendida');


--Diagnosticos
CREATE OR REPLACE PROCEDURE EditarDiagnostico(ID IN NUMBER,
                                              IDCit IN NUMBER,
                                              Descripcion IN VARCHAR2)
AS
BEGIN
    UPDATE DIAGNOSTICOS SET IdCita = IDCit, DescDiagnostico = Descripcion
    WHERE IdDiagnostico = ID;
    DBMS_OUTPUT.PUT_LINE('Diagnostico editado con éxito');
END;

EXEC EditarDiagnostico(2, 3, 'Paciente sin caries, se realizó limpieza con éxito.');


--Medicamentos
CREATE OR REPLACE PROCEDURE EditarMedicamento(ID IN NUMBER,
                                              Nombre IN VARCHAR2,                             
                                              Descripcion IN VARCHAR2,
                                              Costo IN NUMBER)
AS
BEGIN
    UPDATE MEDICAMENTOS SET NomMedicamento = Nombre, DescMedicamento = Descripcion, CostoMedicamento = Costo
    WHERE IdMedicamento = ID;
    DBMS_OUTPUT.PUT_LINE('Medicamento editado con éxito');
END;

EXEC EditarMedicamento(3, 'Ibuprofeno 400mg', 'Desinflamatorio empleado para tratar la inflamaciones varias.', 420);


--Recetas
CREATE OR REPLACE PROCEDURE EditarReceta(ID IN NUMBER,
                                         IDDiag IN NUMBER,                             
                                         IDMed IN NUMBER,
                                         Cant IN NUMBER)
AS
BEGIN
    UPDATE RECETAS SET IdDiagnostico = IDDiag, IdMedicamento = IDMed, Cantidad = Cant
    WHERE IdReceta = ID;
    DBMS_OUTPUT.PUT_LINE('Receta editada con éxito');
END;

EXEC EditarReceta(2, 2, 3, 4);


--Facturas
CREATE OR REPLACE PROCEDURE EditarFactura(ID IN NUMBER,
                                          IDCit IN NUMBER,                             
                                          IDRec IN NUMBER,
                                          CostoAd IN NUMBER,
                                          Tot IN NUMBER)
AS
BEGIN
    UPDATE FACTURAS SET IdCita = IDCit, IdReceta = IDRec, CostoAdicional = CostoAd, Total = Tot
    WHERE IdFactura = ID;
    DBMS_OUTPUT.PUT_LINE('Factura editada con éxito');
END;

EXEC EditarFactura(2, 3, 2, 27000, 27850);


--SP para eliminar
--Pacientes
CREATE OR REPLACE PROCEDURE EliminarPaciente(ID IN NUMBER)
AS
BEGIN
    DELETE FROM PACIENTES
    WHERE IdPaciente = ID;
    DBMS_OUTPUT.PUT_LINE('Paciente eliminado con éxito');
END;

EXEC EliminarPaciente();


--Empleados
CREATE OR REPLACE PROCEDURE EliminarEmpleado(ID IN NUMBER)
AS
BEGIN
    DELETE FROM EMPLEADOS
    WHERE IdEmpleado = ID;
    DBMS_OUTPUT.PUT_LINE('Empleado eliminado con éxito');
END;

EXEC EliminarEmpleado();


--Servicios
CREATE OR REPLACE PROCEDURE EliminarServicio(ID IN NUMBER)
AS
BEGIN
    DELETE FROM SERVICIOS
    WHERE IdServicio = ID;
    DBMS_OUTPUT.PUT_LINE('Servicio eliminado con éxito');
END;

EXEC EliminarServicio();


--Citas
CREATE OR REPLACE PROCEDURE EliminarCita(ID IN NUMBER)
AS
BEGIN
    DELETE FROM CITAS
    WHERE IdCita = ID;
    DBMS_OUTPUT.PUT_LINE('Cita eliminida con éxito');
END;

EXEC EliminarCita();


--Diagnosticos
CREATE OR REPLACE PROCEDURE EliminarDiagnostico(ID IN NUMBER)
AS
BEGIN
    DELETE FROM DIAGNOSTICOS 
    WHERE IdDiagnostico = ID;
    DBMS_OUTPUT.PUT_LINE('Diagnostico eliminado con éxito');
END;

EXEC EliminarDiagnostico();


--Medicamentos
CREATE OR REPLACE PROCEDURE EliminarMedicamento(ID IN NUMBER)
AS
BEGIN
    DELETE FROM MEDICAMENTOS
    WHERE IdMedicamento = ID;
    DBMS_OUTPUT.PUT_LINE('Medicamento eliminado con éxito');
END;

EXEC EliminarMedicamento();


--Recetas
CREATE OR REPLACE PROCEDURE EliminarReceta(ID IN NUMBER)
AS
BEGIN
    DELETE FROM RECETAS 
    WHERE IdReceta = ID;
    DBMS_OUTPUT.PUT_LINE('Receta eliminada con éxito');
END;

EXEC EliminarReceta();


--Facturas
CREATE OR REPLACE PROCEDURE EliminarFactura(ID IN NUMBER)
AS
BEGIN
    DELETE FROM FACTURAS
    WHERE IdFactura = ID;
    DBMS_OUTPUT.PUT_LINE('Factura eliminada con éxito');
END;

EXEC EliminarFactura();


------------------------------CREACIÓN DE VISTAS--------------------------------




