USE [LEAD_CAMPAIN]
GO

IF OBJECT_ID('dbo.tbl_cap_campania_publicitaria') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_cap_campania_publicitaria 
	IF OBJECT_ID('dbo.tbl_cap_campania_publicitaria') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_cap_campania_publicitaria >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_cap_campania_publicitaria >>>'
END
GO
CREATE TABLE [dbo].[tbl_cap_campania_publicitaria](
	[cap_codigo] [int] IDENTITY(1,1) NOT NULL,
	[cap_nombre] [nvarchar](150) NOT NULL,
	[cap_descripcion] [nvarchar](500) NOT NULL,
	[cap_codpro] [int] NOT NULL,
	[cap_activo] [bit] NOT NULL,
	[cap_fecha_crea] [datetime] NOT NULL,
	[cap_usuario_crea] [nvarchar](250) NOT NULL,
	[cap_usr_fecha_modifica] [datetime] NULL,
	[cap_usr_usuario_modifica] [nvarchar](250) NULL,
 CONSTRAINT [PK_CAMPANIA] PRIMARY KEY  (cap_codigo)
)
GO

IF OBJECT_ID('dbo.tbl_cap_campania_publicitaria') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_cap_campania_publicitaria >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_cap_campania_publicitaria >>>'
END



ALTER TABLE [tbl_cap_campania_publicitaria]
ADD CONSTRAINT DF_CAP_ACTIVO
DEFAULT 1 FOR [cap_activo];

ALTER TABLE [tbl_cap_campania_publicitaria]
ADD CONSTRAINT DF_CAP_FECHA_CREA
DEFAULT GETDATE() FOR [cap_fecha_crea];

ALTER TABLE [tbl_cap_campania_publicitaria]
ADD CONSTRAINT DF_CAP_USUSARIO_CREA
DEFAULT CURRENT_USER FOR cap_usuario_crea;


GO


-----tbl_cap_campania_publicitaria
IF OBJECT_ID('dbo.tbl_cem_categoria_cliente_envio_mensaje') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_cem_categoria_cliente_envio_mensaje 
	IF OBJECT_ID('dbo.tbl_cem_categoria_cliente_envio_mensaje') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_cem_categoria_cliente_envio_mensaje >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_cem_categoria_cliente_envio_mensaje >>>'
END
GO


CREATE TABLE [dbo].[tbl_cem_categoria_cliente_envio_mensaje](
	[cem_codevm] [int] NOT NULL,
	[cem_codctu] [int] NOT NULL,
	[cem_fecha_crea] [datetime] NOT NULL,
	[cem_usuario_crea] [nvarchar](250) NOT NULL,
	[cem_usr_fecha_modifica] [datetime] NULL,
	[cem_usr_usuario_modifica] [nvarchar](250) NULL,
 CONSTRAINT [PK_CATEGORIA_CLIENTE_ENVIO] PRIMARY KEY (cem_codevm,cem_codctu) 
)

IF OBJECT_ID('dbo.tbl_cem_categoria_cliente_envio_mensaje') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_cem_categoria_cliente_envio_mensaje >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_cem_categoria_cliente_envio_mensaje >>>'
END

ALTER TABLE tbl_cem_categoria_cliente_envio_mensaje
ADD CONSTRAINT DF_CEM_FECHA_CREA
DEFAULT GETDATE() FOR [cem_fecha_crea];

ALTER TABLE tbl_cem_categoria_cliente_envio_mensaje
ADD CONSTRAINT DF_CEM_USUSARIO_CREA
DEFAULT CURRENT_USER FOR cem_usuario_crea;

----[tbl_cli_cliente]
IF OBJECT_ID('dbo.tbl_cli_cliente') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_cli_cliente 
	IF OBJECT_ID('dbo.tbl_cli_cliente') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_cli_cliente >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_cli_cliente >>>'
END
GO
CREATE TABLE [dbo].[tbl_cli_cliente](
	[cli_codigo] [int] IDENTITY(1,1) NOT NULL,
	[cli_nombre] [nvarchar](150) NOT NULL,
	[cli_apellido] [nvarchar](150) NOT NULL,
	[cli_correo] [nvarchar](250) NOT NULL,
	[cli_telefono] [nvarchar](20) NOT NULL,
	[cli_activo] [bit] NOT NULL,
	[cli_fecha_crea] [datetime] NOT NULL,
	[cli_usuario_crea] [nvarchar](250) NOT NULL,
	[cli_usr_fecha_modifica] [datetime] NULL,
	[cli_usr_usuario_modifica] [nvarchar](250) NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY ([cli_codigo] ))

 IF OBJECT_ID('dbo.tbl_cli_cliente') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_cli_cliente >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_cli_cliente >>>'
END



ALTER TABLE [tbl_cli_cliente]
ADD CONSTRAINT DF_CLI_ACTIVO
DEFAULT 1 FOR [cli_activo];

ALTER TABLE [tbl_cli_cliente]
ADD CONSTRAINT DF_CLI_FECHA_CREA
DEFAULT GETDATE() FOR [cli_fecha_crea];

ALTER TABLE [tbl_cli_cliente]
ADD CONSTRAINT DF_CLI_USUSARIO_CREA
DEFAULT CURRENT_USER FOR cli_usuario_crea;


GO
----[tbl_ctc_cliente_tiene_categoria]
IF OBJECT_ID('dbo.tbl_ctc_cliente_tiene_categoria') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_ctc_cliente_tiene_categoria 
	IF OBJECT_ID('dbo.tbl_ctc_cliente_tiene_categoria') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_ctc_cliente_tiene_categoria >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_ctc_cliente_tiene_categoria >>>'
END
GO

CREATE TABLE [dbo].[tbl_ctc_cliente_tiene_categoria](
	[ctc_codcli] [int] NOT NULL,
	[ctc_codcac] [int] NOT NULL,
	[ctc_fecha_crea] [datetime] NOT NULL,
	[ctc_usuario_crea] [nvarchar](250) NOT NULL,
	[ctc_usr_fecha_modifica] [datetime] NULL,
	[ctc_usr_usuario_modifica] [nvarchar](250) NULL,
 CONSTRAINT [PK_CATEGORIA_TIENE_CLIENTE] PRIMARY KEY (
	[ctc_codcli] ASC,
	[ctc_codcac] ASC))

	
IF OBJECT_ID('dbo.tbl_ctc_cliente_tiene_categoria') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_ctc_cliente_tiene_categoria >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_ctc_cliente_tiene_categoria >>>'
END

ALTER TABLE tbl_ctc_cliente_tiene_categoria
ADD CONSTRAINT DF_CTC_FECHA_CREA
DEFAULT GETDATE() FOR [ctc_fecha_crea];

ALTER TABLE tbl_ctc_cliente_tiene_categoria
ADD CONSTRAINT DF_CTC_USUSARIO_CREA
DEFAULT CURRENT_USER FOR ctc_usuario_crea;

----[[tbl_cac_categoria_cliente]]
IF OBJECT_ID('dbo.tbl_cac_categoria_cliente') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_cac_categoria_cliente 
	IF OBJECT_ID('dbo.tbl_cac_categoria_cliente') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_cac_categoria_cliente >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_cac_categoria_cliente >>>'
END
GO

CREATE TABLE [dbo].[tbl_cac_categoria_cliente](
	[cac_codigo] [int] IDENTITY(1,1) NOT NULL,
	[cac_nombre] [nvarchar](100) NOT NULL,
	[cac_descripcion] [nvarchar](250) NOT NULL,
	[cac_fecha_crea] [datetime] NOT NULL,
	[cac_usuario_crea] [nvarchar](250) NOT NULL,
	[cac_usr_fecha_modifica] [datetime] NULL,
	[cac_usr_usuario_modifica] [nvarchar](250) NULL,
 CONSTRAINT [PK_CATEGORIA_CLIENTE] PRIMARY KEY  
(
	[cac_codigo] ))

	
IF OBJECT_ID('dbo.tbl_cac_categoria_cliente') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_cac_categoria_cliente >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_cac_categoria_cliente >>>'
END

ALTER TABLE tbl_cac_categoria_cliente
ADD CONSTRAINT DF_CAC_FECHA_CREA
DEFAULT GETDATE() FOR [cac_fecha_crea];

ALTER TABLE tbl_cac_categoria_cliente
ADD CONSTRAINT DF_CAC_USUSARIO_CREA
DEFAULT CURRENT_USER FOR cac_usuario_crea;

----[tbl_evm_envio_mensaje]
IF OBJECT_ID('dbo.tbl_evm_envio_mensaje') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_evm_envio_mensaje 
	IF OBJECT_ID('dbo.tbl_evm_envio_mensaje') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_evm_envio_mensaje >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_evm_envio_mensaje >>>'
END
GO

CREATE TABLE [dbo].[tbl_evm_envio_mensaje](
	[evm_codigo] [int] IDENTITY(1,1) NOT NULL,
	[evm_codplm] [int] NOT NULL,
	[evm_codcap] [int] NOT NULL,
	[evm_fecha_crea] [datetime] NOT NULL,
	[evm_usuario_crea] [nvarchar](250) NOT NULL,
	[evm_usr_fecha_modifica] [datetime] NULL,
	[evm_usr_usuario_modifica] [nvarchar](250) NULL,
 CONSTRAINT [PK_ENVIO_MENSAJE] PRIMARY KEY  
(
	[evm_codigo] ))

	
IF OBJECT_ID('dbo.tbl_evm_envio_mensaje') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_evm_envio_mensaje >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_evm_envio_mensaje >>>'
END

ALTER TABLE tbl_evm_envio_mensaje
ADD CONSTRAINT DF_EVM_FECHA_CREA
DEFAULT GETDATE() FOR [evm_fecha_crea];

ALTER TABLE tbl_evm_envio_mensaje
ADD CONSTRAINT DF_EVM_USUSARIO_CREA
DEFAULT CURRENT_USER FOR evm_usuario_crea;

----[tbl_plm_plantilla_mensaje]
IF OBJECT_ID('dbo.tbl_plm_plantilla_mensaje') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_plm_plantilla_mensaje 
	IF OBJECT_ID('dbo.tbl_plm_plantilla_mensaje') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_plm_plantilla_mensaje >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_plm_plantilla_mensaje >>>'
END
GO

CREATE TABLE [dbo].[tbl_plm_plantilla_mensaje](
	[plm_codigo] [int] IDENTITY(1,1) NOT NULL,
	[plm_nombre] [nvarchar](150) NOT NULL,
	[plm_codtpm] [int] NOT NULL,
	[plm_titulo] [nvarchar](150) NOT NULL,
	[plm_cuerpo] [nvarchar](max) NOT NULL,
	[plm_esHTML] [bit] NOT NULL,
	[plm_activo] [bit] NOT NULL,
	[plm_fecha_crea] [datetime] NOT NULL,
	[plm_usuario_crea] [nvarchar](250) NOT NULL,
	[plm_usr_fecha_modifica] [datetime] NULL,
	[plm_usr_usuario_modifica] [nvarchar](250) NULL,
 CONSTRAINT [PK_PLANTILLA_MENSAJE] PRIMARY KEY  
(
	[plm_codigo]))

	
 IF OBJECT_ID('dbo.tbl_plm_plantilla_mensaje') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_plm_plantilla_mensaje >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_plm_plantilla_mensaje >>>'
END



ALTER TABLE tbl_plm_plantilla_mensaje
ADD CONSTRAINT DF_PLM_ACTIVO
DEFAULT 1 FOR [plm_activo];

ALTER TABLE tbl_plm_plantilla_mensaje
ADD CONSTRAINT DF_PLM_FECHA_CREA
DEFAULT GETDATE() FOR [plm_fecha_crea];

ALTER TABLE tbl_plm_plantilla_mensaje
ADD CONSTRAINT DF_PLM_USUSARIO_CREA
DEFAULT CURRENT_USER FOR plm_usuario_crea;

----[tbl_pro_promotor]
IF OBJECT_ID('dbo.tbl_pro_promotor') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_pro_promotor 
	IF OBJECT_ID('dbo.tbl_pro_promotor') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_pro_promotor >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_pro_promotor >>>'
END
GO


CREATE TABLE [dbo].[tbl_pro_promotor](
	[pro_codigo] [int] IDENTITY(1,1) NOT NULL,
	[pro_nombre] [nvarchar](150) NOT NULL,
	[pro_apellido] [nvarchar](150) NOT NULL,
	[pro_correo] [nvarchar](250) NOT NULL,
	[pro_telefono] [nvarchar](20) NOT NULL,
	[pro_activo] [bit] NOT NULL,
	[pro_fecha_crea] [datetime] NOT NULL,
	[pro_usuario_crea] [nvarchar](250) NOT NULL,
	[pro_usr_fecha_modifica] [datetime] NULL,
	[pro_usr_usuario_modifica] [nvarchar](250) NULL,
 CONSTRAINT [PK_PROMOTOR] PRIMARY KEY CLUSTERED 
(
	[pro_codigo] ))

	
 IF OBJECT_ID('dbo.tbl_pro_promotor') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_pro_promotor >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_pro_promotor >>>'
END



ALTER TABLE tbl_pro_promotor
ADD CONSTRAINT DF_PRO_ACTIVO
DEFAULT 1 FOR [pro_activo];

ALTER TABLE tbl_pro_promotor
ADD CONSTRAINT DF_PRO_FECHA_CREA
DEFAULT GETDATE() FOR [pro_fecha_crea];

ALTER TABLE tbl_pro_promotor
ADD CONSTRAINT DF_PRO_USUSARIO_CREA
DEFAULT CURRENT_USER FOR pro_usuario_crea;



----[tbl_tpm_tipo_plantilla_mensaje]
IF OBJECT_ID('dbo.tbl_tpm_tipo_plantilla_mensaje') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_tpm_tipo_plantilla_mensaje 
	IF OBJECT_ID('dbo.tbl_tpm_tipo_plantilla_mensaje') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_tpm_tipo_plantilla_mensaje >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_tpm_tipo_plantilla_mensaje >>>'
END
GO

create table tbl_tpm_tipo_plantilla_mensaje(
tpm_codigo int identity(1,1) not null,
tpm_nombre nvarchar(100) not null,
[tpm_fecha_crea] [datetime] NOT NULL,
[tpm_usuario_crea] [nvarchar](250) NOT NULL,
[tpm_usr_fecha_modifica] [datetime] NULL,
[tpm_usr_usuario_modifica] [nvarchar](250) NULL,
CONSTRAINT [PK_TIPO_PLANTILLA] PRIMARY KEY CLUSTERED (tpm_codigo)
)
	
 IF OBJECT_ID('dbo.tbl_tpm_tipo_plantilla_mensaje') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_tpm_tipo_plantilla_mensaje >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_tpm_tipo_plantilla_mensaje >>>'
END

ALTER TABLE tbl_tpm_tipo_plantilla_mensaje
ADD CONSTRAINT DF_TPM_FECHA_CREA
DEFAULT GETDATE() FOR [tpm_fecha_crea];

ALTER TABLE tbl_tpm_tipo_plantilla_mensaje
ADD CONSTRAINT DF_TPM_USUSARIO_CREA
DEFAULT CURRENT_USER FOR tpm_usuario_crea;

---[tbl_eem_estado_envio_mensaje]
IF OBJECT_ID('dbo.tbl_eem_estado_envio_mensaje') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_eem_estado_envio_mensaje 
	IF OBJECT_ID('dbo.tbl_eem_estado_envio_mensaje') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_eem_estado_envio_mensaje >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_eem_estado_envio_mensaje >>>'
END
GO

create table tbl_eem_estado_envio_mensaje(
eem_codigo int identity(1,1) not null,
eem_nombre nvarchar(100) not null,
[eem_fecha_crea] [datetime] NOT NULL,
[eem_usuario_crea] [nvarchar](250) NOT NULL,
[eem_usr_fecha_modifica] [datetime] NULL,
[eem_usr_usuario_modifica] [nvarchar](250) NULL,
CONSTRAINT [PK_ESTADO_ENVIO] PRIMARY KEY CLUSTERED (eem_codigo)
)

	
 IF OBJECT_ID('dbo.tbl_eem_estado_envio_mensaje') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_eem_estado_envio_mensaje >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_eem_estado_envio_mensaje >>>'
END

ALTER TABLE tbl_eem_estado_envio_mensaje
ADD CONSTRAINT DF_EEM_FECHA_CREA
DEFAULT GETDATE() FOR [eem_fecha_crea];

ALTER TABLE tbl_eem_estado_envio_mensaje
ADD CONSTRAINT DF_EEM_USUSARIO_CREA
DEFAULT CURRENT_USER FOR eem_usuario_crea;

---[tbl_hem_historial_envio_mensaje]
IF OBJECT_ID('dbo.tbl_hem_historial_envio_mensaje') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_hem_historial_envio_mensaje 
	IF OBJECT_ID('dbo.tbl_hem_historial_envio_mensaje') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_hem_historial_envio_mensaje >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_hem_historial_envio_mensaje >>>'
END
GO


create table tbl_hem_historial_envio_mensaje(
hem_codigo int identity(1,1) not null,
hem_codeem int not null,
hem_codevm int not null,
hem_fecha_envio [datetime] NULL,
hem_fecha_crea [datetime] NOT NULL,
hem_usuario_crea [nvarchar](250) NOT NULL,
hem_usr_fecha_modifica [datetime] NULL,
hem_usr_usuario_modifica [nvarchar](250) NULL,
CONSTRAINT [PK_HISTORIAL_ENVIO] PRIMARY KEY CLUSTERED (hem_codigo)
)


	
 IF OBJECT_ID('dbo.tbl_hem_historial_envio_mensaje') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_hem_historial_envio_mensaje >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_hem_historial_envio_mensaje >>>'
END

ALTER TABLE tbl_hem_historial_envio_mensaje
ADD CONSTRAINT DF_HEM_FECHA_CREA
DEFAULT GETDATE() FOR [hem_fecha_crea];

ALTER TABLE tbl_hem_historial_envio_mensaje
ADD CONSTRAINT DF_HEM_USUSARIO_CREA
DEFAULT CURRENT_USER FOR hem_usuario_crea;


