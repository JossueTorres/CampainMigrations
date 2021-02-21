-- v_20210221_1_Create_table_usuario_token
--============================================================================================
--Usuarios

IF OBJECT_ID('dbo.tbl_usr_usuario') IS NOT NULL 
BEGIN 	
	DROP TABLE dbo.tbl_usr_usuario 
	IF OBJECT_ID('dbo.tbl_usr_usuario') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_usr_usuario >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_usr_usuario >>>'
END
GO
CREATE TABLE tbl_usr_usuario
(
	usr_codigo INT NOT NULL IDENTITY(1,1),
	usr_nombre NVARCHAR(250) NOT NULL,
	usr_correo NVARCHAR(250) NOT NULL,
	usr_clave NVARCHAR(100) NOT NULL,
	usr_recupera NVARCHAR(100) NULL,
	usr_recupera_activo BIT NOT NULL,
	usr_activo BIT NOT NULL,
	usr_super BIT NOT NULL,
	usr_fecha_crea DATETIME NOT NULL,
	usr_usuario_crea NVARCHAR(250) NOT NULL,
	usr_fecha_modifica DATETIME NULL,
	usr_usuario_modifica DATETIME NULL,
	CONSTRAINT PK_USUARIO PRIMARY KEY (usr_codigo)
)
GO

IF OBJECT_ID('dbo.tbl_usr_usuario') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_usr_usuario >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_usr_usuario >>>'
END

--=========================================
-- Constraints

ALTER TABLE tbl_usr_usuario
ADD CONSTRAINT DF_RECUPERA_ACTIVO
DEFAULT 0 FOR usr_recupera_activo;

ALTER TABLE tbl_usr_usuario
ADD CONSTRAINT DF_ACTIVO
DEFAULT 1 FOR usr_activo;

ALTER TABLE tbl_usr_usuario
ADD CONSTRAINT DF_SUPER
DEFAULT 0 FOR usr_super;

ALTER TABLE tbl_usr_usuario
ADD CONSTRAINT DF_FECHA_CREA
DEFAULT GETDATE() FOR usr_fecha_crea;

ALTER TABLE tbl_usr_usuario
ADD CONSTRAINT DF_USUSARIO_CREA
DEFAULT CURRENT_USER FOR usr_usuario_crea;

--=========================================
-- AI TRIGGER

IF EXISTS (SELECT * FROM sys.objects WHERE [name] = N'AI_USUARIO' )
BEGIN
    DROP TRIGGER dbo.AI_USUARIO
    IF EXISTS (SELECT * FROM sys.objects WHERE [name] = N'AI_USUARIO')
        PRINT '<<< FALLO BORRADO DE TRIGGER dbo.AI_USUARIO >>>'
    ELSE
        PRINT '<<< BORRADO TRIGGER dbo.AI_USUARIO >>>'
END
GO

CREATE TRIGGER [dbo].[AI_USUARIO] 
   ON  [dbo].[tbl_usr_usuario]
   INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO [dbo].[tbl_usr_usuario]
	           ([usr_nombre]
	           ,[usr_correo]
	           ,[usr_clave]
	           ,[usr_recupera]
	           ,[usr_recupera_activo]
	           ,[usr_activo]
	           ,[usr_super]
	           ,[usr_fecha_crea]
	           ,[usr_usuario_crea])
	SELECT [usr_nombre]
	           ,[usr_correo]
	           ,[usr_clave]
	           ,[usr_recupera]
	           ,[usr_recupera_activo]
	           ,[usr_activo]
	           ,[usr_super]
	           ,GETDATE()
	           ,[usr_usuario_crea]
	FROM INSERTED;

END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE [name] = N'AI_USUARIO')
    PRINT '<<< CREADO TRIGGER AI_USUARIO >>>'
ELSE
    PRINT '<<< FALLO CREAR TRIGGER  AI_USUARIO >>>'
GO

--=========================================
-- AU TRIGGER

IF EXISTS (SELECT * FROM sys.objects WHERE [name] = N'AU_USUARIO' )
BEGIN
    DROP TRIGGER dbo.AU_USUARIO
    IF EXISTS (SELECT * FROM sys.objects WHERE [name] = N'AU_USUARIO')
        PRINT '<<< FALLO BORRADO DE TRIGGER dbo.AU_USUARIO >>>'
    ELSE
        PRINT '<<< BORRADO TRIGGER dbo.AU_USUARIO >>>'
END
GO

CREATE TRIGGER [dbo].[AU_USUARIO] 
   ON  [dbo].[tbl_usr_usuario]
   INSTEAD OF UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE [dbo].[tbl_usr_usuario]
	   SET [usr_nombre] = INSERTED.usr_nombre
	      ,[usr_correo] = INSERTED.usr_correo
	      ,[usr_clave] = INSERTED.usr_clave
	      ,[usr_recupera] = INSERTED.usr_recupera
	      ,[usr_recupera_activo] = INSERTED.usr_recupera_activo
	      ,[usr_activo] = INSERTED.usr_activo
	      ,[usr_super] = INSERTED.usr_super
	      ,[usr_fecha_modifica] = GETDATE()
	      ,[usr_usuario_modifica] = INSERTED.usr_usuario_modifica
	FROM INSERTED
	WHERE [tbl_usr_usuario].[usr_codigo] = INSERTED.usr_codigo

END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE [name] = N'AU_USUARIO')
    PRINT '<<< CREADO TRIGGER AU_USUARIO >>>'
ELSE
    PRINT '<<< FALLO CREAR TRIGGER  AU_USUARIO >>>'
GO

--============================================================================================
--Tokens

IF OBJECT_ID('dbo.tbl_rft_refresh_token') IS NOT NULL 
BEGIN 
	DROP TABLE dbo.tbl_rft_refresh_token 
	IF OBJECT_ID('dbo.tbl_rft_refresh_token') IS NOT NULL 
		PRINT '<<< FAILED DROPPING TABLE dbo.tbl_rft_refresh_token >>>'
ELSE 
	PRINT '<<< DROPPED TABLE dbo.tbl_rft_refresh_token >>>'
END
GO
CREATE TABLE tbl_rft_refresh_token
(
	Id INT NOT NULL IDENTITY(1,1),
	UserId INT NOT NULL,
	Token NVARCHAR(MAX) NOT NULL,
	Expires DATETIME NOT NULL,
	Created DATETIME NOT NULL,
	CreatedByIp NVARCHAR(20) NOT NULL,
	Revoked DATETIME NULL,
	RevokedByIp NVARCHAR(20) NULL,
	ReplacedByToken NVARCHAR(MAX) NULL
	CONSTRAINT PK_REFRESH_TOKEN PRIMARY KEY (Id)
)
GO

IF OBJECT_ID('dbo.tbl_rft_refresh_token') IS NOT NULL 
BEGIN
	PRINT '<<< TABLE CREATED dbo.tbl_rft_refresh_token >>>'
END
ELSE
BEGIN
	PRINT '<<< FAIL CREATE TABLE dbo.tbl_rft_refresh_token >>>'
END

ALTER TABLE tbl_rft_refresh_token
ADD CONSTRAINT FK_REFERSH_USER 
FOREIGN KEY (UserId) REFERENCES tbl_usr_usuario(usr_codigo);