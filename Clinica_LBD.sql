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
            IdPaciente NUMBER PRIMARY KEY, --PK
            NomPaciente VARCHAR2(30),
            ApellidoPaciente VARCHAR2(40),
            CedulaPaciente NUMBER);  

INSERT INTO PACIENTES(IdPaciente, NomPaciente, ApellidoPaciente, CedulaPaciente)
    VALUES(1,'Juan', 'Perez', 11111111);
INSERT INTO PACIENTES(IdPaciente, NomPaciente, ApellidoPaciente, CedulaPaciente)
    VALUES(2,'Maria', 'Lopez', 22222222);

--Telefono pacientes
CREATE TABLE TELEFONO_PACIENTES(
            IdTelefono NUMBER PRIMARY KEY, --PK
            IdPaciente NUMBER, --FK
            NumeroPaciente NUMBER);  

ALTER TABLE TELEFONO_PACIENTES ADD CONSTRAINT FK_TELEFONOPACIENTES_PACIENTES FOREIGN KEY (IdPaciente) REFERENCES PACIENTES (IdPaciente);

INSERT INTO TELEFONO_PACIENTES(IdTelefono, IdPaciente, NumeroPaciente)
    VALUES(1, 1, 60606060);
INSERT INTO TELEFONO_PACIENTES(IdTelefono, IdPaciente, NumeroPaciente)
    VALUES(2, 2, 70707070);

--Correo pacientes
CREATE TABLE CORREO_PACIENTES(
            IdCorreo NUMBER PRIMARY KEY, --PK
            IdPaciente NUMBER, --FK
            CorreoPaciente VARCHAR2(60));  

ALTER TABLE CORREO_PACIENTES ADD CONSTRAINT FK_CORREOPACIENTES_PACIENTES FOREIGN KEY (IdPaciente) REFERENCES PACIENTES (IdPaciente);

INSERT INTO CORREO_PACIENTES(IdCorreo, IdPaciente, CorreoPaciente)
    VALUES(1, 1, 'juan@paciente.com');
INSERT INTO CORREO_PACIENTES(IdCorreo, IdPaciente, CorreoPaciente)
    VALUES(2, 2, 'maria@paciente.com');

SELECT * FROM PACIENTES;
SELECT * FROM TELEFONO_PACIENTES;
SELECT * FROM CORREO_PACIENTES;


--Empleados
CREATE TABLE EMPLEADOS(
            IdEmpleado NUMBER PRIMARY KEY, --PK
            NomEmpleado VARCHAR2(30),
            ApellidoEmpleado VARCHAR2(40),
            CedulaEmpleado NUMBER,
            RolEmpleado VARCHAR2(25)); --Medico, Secretario, Reumatologo

INSERT INTO EMPLEADOS(IdEmpleado, NomEmpleado, ApellidoEmpleado, CedulaEmpleado, RolEmpleado)
    VALUES(1,'Carlos', 'Solano', 33333333, 'Secretario');
INSERT INTO EMPLEADOS(IdEmpleado, NomEmpleado, ApellidoEmpleado, CedulaEmpleado, RolEmpleado)
    VALUES(2,'Marta', 'Rodrigues', 44444444, 'Enfermera');

--Telefono empleados
CREATE TABLE TELEFONO_EMPLEADOS(
            IdTelefono NUMBER PRIMARY KEY, --PK
            IdEmpleado NUMBER, --FK
            NumeroEmpleado NUMBER);  

ALTER TABLE TELEFONO_EMPLEADOS ADD CONSTRAINT FK_TELEFONOEMPLEADOS_EMPLEADOS FOREIGN KEY (IdEmpleado) REFERENCES EMPLEADOS (IdEmpleado);

INSERT INTO TELEFONO_EMPLEADOS(IdTelefono, IdEmpleado, NumeroEmpleado)
    VALUES(2, 1, 80808080);
INSERT INTO TELEFONO_EMPLEADOS(IdTelefono, IdEmpleado, NumeroEmpleado)
    VALUES(2, 2, 90909090);

--Correo empleados
CREATE TABLE CORREO_EMPLEADOS(
            IdCorreo NUMBER PRIMARY KEY, --PK
            IdEmpleado NUMBER, --FK
            CorreoEmpleado VARCHAR2(60));  

ALTER TABLE CORREO_EMPLEADOS ADD CONSTRAINT FK_CORREOEMPLEADOS_EMPLEADOS FOREIGN KEY (IdEmpleado) REFERENCES EMPLEADOS (IdEmpleado);

INSERT INTO CORREO_EMPLEADOS(IdCorreo, IdEmpleado, CorreoEmpleado)
    VALUES(1, 1, 'carlos@empleado.com');
INSERT INTO CORREO_EMPLEADOS(IdCorreo, IdEmpleado, CorreoEmpleado)
    VALUES(2, 2, 'marta@empleado.com');

SELECT * FROM EMPLEADOS;
SELECT * FROM TELEFONO_EMPLEADOS;
SELECT * FROM CORREO_EMPLEADOS;


--Servicios
CREATE TABLE SERVICIOS(
            IdServicio NUMBER PRIMARY KEY, --PK
            NomServicio VARCHAR2(30),
            DescServicio VARCHAR2(90)); 
            
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
            IdCita NUMBER PRIMARY KEY, --PK
            IdPaciente NUMBER, --FK
            IdEmpleado NUMBER, --FK
            IdServicio NUMBER, --FK
            FechaCita DATE, --Formato DD/MM/AA
            EstadoCita VARCHAR2(10)); --Pendiente, Candelada o Atendida

ALTER TABLE CITAS ADD CONSTRAINT FK_IDPACIENTE_PACIENTES FOREIGN KEY (IdPaciente) REFERENCES PACIENTES (IdPaciente);
ALTER TABLE CITAS ADD CONSTRAINT FK_IDEMPLEADO_EMPLEADOS FOREIGN KEY (IdEmpleado) REFERENCES EMPLEADOS (IdEmpleado);
ALTER TABLE CITAS ADD CONSTRAINT FK_IDSERVICIO_SERVICIOS FOREIGN KEY (IdServicio) REFERENCES SERVICIOS (IdServicio);

INSERT INTO CITAS(IdCita, IdPaciente, IdEmpleado, IdServicio, FechaCita, EstadoCita)
    VALUES(1, 1, 2, 201, TO_DATE('15/08/23', 'DD/MM/YY'), 'Atendida');
INSERT INTO CITAS(IdCita, IdPaciente, IdEmpleado, IdServicio, FechaCita, EstadoCita)
    VALUES(2, 2, 2, 202, TO_DATE('03/05/23', 'DD/MM/YY'), 'Pendiente');

SELECT * FROM CITAS;


--Diagnosticos
CREATE TABLE DIAGNOSTICOS(
            IdDiagnostico NUMBER PRIMARY KEY,
            IdCita NUMBER, --FK
            DescDiagnostico VARCHAR2(90));

ALTER TABLE DIAGNOSTICOS ADD CONSTRAINT FK_IDCITA_CITAS FOREIGN KEY (IdCita) REFERENCES CITAS (IdCita);

INSERT INTO DIAGNOSTICOS(IdDiagnostico, IdCita, DescDiagnostico)
    VALUES(1, 1, 'El paciente contaba una herida en el antebrazo, se limpió la infección y se vendó la zona.');

SELECT * FROM DIAGNOSTICOS;


--Medicamentos
CREATE TABLE MEDICAMENTOS(
            IdMedicamento NUMBER PRIMARY KEY,
            NomMedicamento VARCHAR2(40),
            DescMedicamento VARCHAR2(90),
            CostoMedicamento NUMBER);

INSERT INTO MEDICAMENTOS(IdMedicamento, NomMedicamento, DescMedicamento, CostoMedicamento)
    VALUES(1, 'Amoxicilina 10mg', 'Antibiotico utilizado para tratar infecciones', 800);
INSERT INTO MEDICAMENTOS(IdMedicamento, NomMedicamento, DescMedicamento, CostoMedicamento)
    VALUES(2, 'Paracetamol 500mg', 'Analgésico empleado para tratar el dolor leve.', 300);

SELECT * FROM MEDICAMENTOS;


--Recetas
CREATE TABLE RECETAS(
            IdReceta NUMBER PRIMARY KEY,
            IdDiagnostico NUMBER, --FK
            IdMedicamento NUMBER, --FK
            Cantidad NUMBER);

ALTER TABLE RECETAS ADD CONSTRAINT FK_IDDIAGNOSTICO_DIAGNOSTICOS FOREIGN KEY (IdDiagnostico) REFERENCES DIAGNOSTICOS (IdDiagnostico);
ALTER TABLE RECETAS ADD CONSTRAINT FK_IDMEDICAMENTO_MEDICAMENTOS FOREIGN KEY (IdMedicamento) REFERENCES MEDICAMENTOS (IdMedicamento);

INSERT INTO RECETAS(IdReceta, IdDiagnostico, IdMedicamento, Cantidad)
    VALUES(1, 1, 1, 10);

SELECT * FROM RECETAS;


--Facturas
CREATE TABLE FACTURAS(
            IdFactura NUMBER PRIMARY KEY,
            IdCita NUMBER, --FK  Esto contiene al Medico, Paciente y servicio asociados
            IdReceta NUMBER, --FK
            CostoAdicional NUMBER,
            Total NUMBER);

ALTER TABLE FACTURAS ADD CONSTRAINT FK_IDCITA_FACTURAS FOREIGN KEY (IdCita) REFERENCES CITAS (IdCita);
ALTER TABLE FACTURAS ADD CONSTRAINT FK_IDRECETA_FACTURAS FOREIGN KEY (IdReceta) REFERENCES RECETAS (IdReceta);

INSERT INTO FACTURAS(IdFactura, IdCita, IdReceta, CostoAdicional, Total)
    VALUES(1, 1, 1, 50000, 58000);

SELECT * FROM FACTURAS;


----------------------------CREACIÓN DE TRIGGERS--------------------------------
--Triggers para autoasignar valores al id:
--Pacientes
CREATE OR REPLACE TRIGGER AutoIncrement_PacientesPK 
  BEFORE INSERT ON PACIENTES
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdPaciente),0) + 1
    INTO :NEW.IdPaciente
    FROM PACIENTES;
END;

CREATE OR REPLACE TRIGGER AutoIncrement_TelPacientesPK 
  BEFORE INSERT ON TELEFONO_PACIENTES
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdTelefono),0) + 1
    INTO :NEW.IdTelefono
    FROM TELEFONO_PACIENTES;
END;

CREATE OR REPLACE TRIGGER AutoIncrement_CorreoPacientesPK 
  BEFORE INSERT ON CORREO_PACIENTES
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdCorreo),0) + 1
    INTO :NEW.IdCorreo
    FROM CORREO_PACIENTES;
END;

--Empleados
CREATE OR REPLACE TRIGGER AutoIncrement_EmpleadosPK 
  BEFORE INSERT ON EMPLEADOS
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdEmpleado),0) + 1
    INTO :NEW.IdEmpleado
    FROM EMPLEADOS;
END;

CREATE OR REPLACE TRIGGER AutoIncrement_TelEmpleadosPK 
  BEFORE INSERT ON TELEFONO_EMPLEADOS
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdTelefono),0) + 1
    INTO :NEW.IdTelefono
    FROM TELEFONO_EMPLEADOS;
END;

CREATE OR REPLACE TRIGGER AutoIncrement_CorreoEmpleadosPK 
  BEFORE INSERT ON CORREO_EMPLEADOS
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdCorreo),0) + 1
    INTO :NEW.IdCorreo
    FROM CORREO_EMPLEADOS;
END;

--Citas
CREATE OR REPLACE TRIGGER AutoIncrement_CitaPK 
  BEFORE INSERT ON CITAS
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdCita),0) + 1
    INTO :NEW.IdCita
    FROM CITAS;
END;

--Diagnosticos
CREATE OR REPLACE TRIGGER AutoIncrement_DiagnosticoPK 
  BEFORE INSERT ON DIAGNOSTICOS
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdDiagnostico),0) + 1
    INTO :NEW.IdDiagnostico
    FROM DIAGNOSTICOS;
END;

--Medicamentos
CREATE OR REPLACE TRIGGER AutoIncrement_MedicamentoPK 
  BEFORE INSERT ON MEDICAMENTOS
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdMedicamento),0) + 1
    INTO :NEW.IdMedicamento
    FROM MEDICAMENTOS;
END;

--Recetas
CREATE OR REPLACE TRIGGER AutoIncrement_RecetaPK 
  BEFORE INSERT ON RECETAS
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdReceta),0) + 1
    INTO :NEW.IdReceta
    FROM RECETAS;
END;

--Facturas
CREATE OR REPLACE TRIGGER AutoIncrement_FacturaPK 
  BEFORE INSERT ON FACTURAS
  FOR EACH ROW
DECLARE
BEGIN
  SELECT NVL(MAX(IdFactura),0) + 1
    INTO :NEW.IdFactura
    FROM FACTURAS;
END;

/*De ahora en adelante al insertar no se deben agregar las id ya que se autoincrementan
a excepción de los servicios ya que estos tienen un código especial*/


-------------------------------CREACIÓN DE SP-----------------------------------
--Comando para el correcto funcinamiento de bloques PL/SQL y SP
SET SERVEROUTPUT ON;

--SP para insertar
--Pacientes
CREATE OR REPLACE PROCEDURE AgregarPaciente(Nombre IN VARCHAR2,
                                            Apellido IN VARCHAR2,
                                            Cedula IN NUMBER)
AS
BEGIN
    INSERT INTO PACIENTES(NomPaciente, ApellidoPaciente, CedulaPaciente)
        VALUES(Nombre, Apellido, Cedula);
    DBMS_OUTPUT.PUT_LINE('Paciente agregado con éxito');
END;

EXEC AgregarPaciente('Fernando', 'Perez', 55555555);

--Telefono pacientes
CREATE OR REPLACE PROCEDURE AgregarTelPaciente(IDPaciente IN NUMBER,
                                               Numero IN NUMBER)
AS
BEGIN
    INSERT INTO TELEFONO_PACIENTES(IdPaciente, NumeroPaciente)
        VALUES(IDPaciente, Numero);
    DBMS_OUTPUT.PUT_LINE('Teléfono de paciente agregado con éxito');
END;

EXEC AgregarTelPaciente(3, 00000000);

--Correo pacientes
CREATE OR REPLACE PROCEDURE AgregarCorreoPaciente(IDPaciente IN NUMBER,
                                                  Correo IN VARCHAR2)
AS
BEGIN
    INSERT INTO CORREO_PACIENTES(IdPaciente, CorreoPaciente)
        VALUES(IDPaciente, CorreoPaciente);
    DBMS_OUTPUT.PUT_LINE('Correo de paciente agregado con éxito');
END;

EXEC AgregarCorreoPaciente(3, 'fernando@paciente.com');


--Empleados
CREATE OR REPLACE PROCEDURE AgregarEmpleado(Nombre IN VARCHAR2,
                                            Apellido IN VARCHAR2,
                                            Cedula IN NUMBER,
                                            Rol IN VARCHAR2)
AS
BEGIN
    INSERT INTO EMPLEADOS(NomEmpleado, ApellidoEmpleado, CedulaEmpleado, RolEmpleado)
    VALUES(Nombre, Apellido, Cedula, Rol);
    DBMS_OUTPUT.PUT_LINE('Empleado agregado con éxito');
END;

EXEC AgregarEmpleado('Jose', 'Alpizar', 99999999, 'Doctor');

--Telefono empleados
CREATE OR REPLACE PROCEDURE AgregarTelEmpleado(IDEmpleado IN NUMBER,
                                               Numero IN NUMBER)
AS
BEGIN
    INSERT INTO TELEFONO_EMPLEADOS(IdEmpleado, NumeroEmpleado)
        VALUES(IDEmpleado, Numero);
    DBMS_OUTPUT.PUT_LINE('Teléfono de empleado agregado con éxito');
END;

EXEC AgregarTelEmpleado(3, 12344569);

--Correo empleados
CREATE OR REPLACE PROCEDURE AgregarCorreoEmpleado(IDEmpleado IN NUMBER,
                                                  Correo IN VARCHAR2)
AS
BEGIN
    INSERT INTO CORREO_EMPLEADOS(IdEmpleado, CorreoEmpleado)
        VALUES(IDEmpleado, Correo);
    DBMS_OUTPUT.PUT_LINE('Correo de empleado agregado con éxito');
END;

EXEC AgregarCorreoEmpleado(3, 'jose@empleado.com');


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
CREATE OR REPLACE PROCEDURE EditarPaciente(IDPaciente IN NUMBER,
                                           Nombre IN VARCHAR2,
                                           Apellido IN VARCHAR2,
                                           Cedula IN NUMBER)
AS
BEGIN
    UPDATE PACIENTES SET NomPaciente = Nombre, ApellidoPaciente = Apellido, CedulaPaciente = Cedula
    WHERE IdPaciente = IDPaciente;
    DBMS_OUTPUT.PUT_LINE('Paciente editado con éxito');
END;

EXEC EditarPaciente(3, 'Fernanda', 'Castro', 55555555);

--Telefono pacientes
CREATE OR REPLACE PROCEDURE EditarTelPaciente(IDTelefono IN NUMBER,
                                              IDPaciente IN NUMBER,
                                              Numero IN NUMBER)
AS
BEGIN
    UPDATE TELEFONO_PACIENTES SET IdPaciente = IDPaciente, NumeroPaciente = Numero
    WHERE IdTelefono = IDTelefono;
    DBMS_OUTPUT.PUT_LINE('Teléfono de paciente editado con éxito');
END;

EXEC EditarTelPaciente(3, 3, 00000001);

--Correo pacientes
CREATE OR REPLACE PROCEDURE EditarCorreoPaciente(IDCorreo IN NUMBER,
                                                 IDPaciente IN NUMBER,
                                                 Correo IN VARCHAR2)
AS
BEGIN
    UPDATE CORREO_PACIENTES SET IdPaciente = IDPaciente, CorreoPaciente = Correo
    WHERE IdCorreo = IDCorreo;
    DBMS_OUTPUT.PUT_LINE('Correo de paciente editado con éxito');
END;

EXEC EditarCorreoPaciente(3, 3, 'fernanda@paciente.com');


--Empleados



