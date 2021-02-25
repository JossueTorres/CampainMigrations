USE [LEAD_CAMPAIN]
GO


--- create all FK



--[tbl_cem_categoria_cliente_envio_mensaje]
ALTER TABLE [dbo].[tbl_cem_categoria_cliente_envio_mensaje]
ADD CONSTRAINT FK_ENVIO_MENSAJE_CAT_CLI_ENV_MENSAJE 
FOREIGN KEY (cem_codevm) REFERENCES [dbo].[tbl_evm_envio_mensaje](evm_codigo);

ALTER TABLE [dbo].[tbl_cem_categoria_cliente_envio_mensaje]
ADD CONSTRAINT FK_CAT_USR_CAT_CLI_ENV_MENSAJE 
FOREIGN KEY (cem_codctu) REFERENCES [dbo].[tbl_ctu_categoria_usuario](ctu_codigo);


--[tbl_cap_campania_publicitaria]
ALTER TABLE [dbo].[tbl_cap_campania_publicitaria]
ADD CONSTRAINT FK_PROMOTOR_CAMPANIA 
FOREIGN KEY (cap_codpro) REFERENCES [dbo].[tbl_pro_promotor](pro_codigo);


--[tbl_ctc_cliente_tiene_categoria]
ALTER TABLE [dbo].[tbl_ctc_cliente_tiene_categoria]
ADD CONSTRAINT FK_CLIENTE_CLI_TIENE_CAT 
FOREIGN KEY (ctc_codcli) REFERENCES [dbo].[tbl_cli_cliente](cli_codigo);

ALTER TABLE [dbo].[tbl_ctc_cliente_tiene_categoria]
ADD CONSTRAINT FK_CAT_CLIENTE_CLI_TIENE_CAT 
FOREIGN KEY (ctc_codcac) REFERENCES [dbo].[tbl_cac_categoria_cliente](cac_codigo);


--[dbo].[tbl_cap_campania_publicitaria]
ALTER TABLE tbl_cap_campania_publicitaria
ADD CONSTRAINT FK_CAMPANIA_PROMOTOR 
FOREIGN KEY (cap_codpro) REFERENCES [dbo].[tbl_pro_promotor](pro_codigo);

--[dbo].[tbl_evm_envio_mensaje]
ALTER TABLE tbl_evm_envio_mensaje
ADD CONSTRAINT FK_ENVIO_MEN_CAMPANIA
FOREIGN KEY (evm_codcap) REFERENCES [dbo].[tbl_cap_campania_publicitaria](cap_codigo);

ALTER TABLE tbl_evm_envio_mensaje
ADD CONSTRAINT FK_ENVIO_MEN_PLANTILLA 
FOREIGN KEY (evm_codplm) REFERENCES [dbo].[tbl_plm_plantilla_mensaje](plm_codigo);


--[dbo].[tbl_hem_historial_envio_mensaje]

ALTER TABLE tbl_hem_historial_envio_mensaje
ADD CONSTRAINT FK_HIS_ENVIO_MEN_ESTADO_ENVIO
FOREIGN KEY (hem_codeem) REFERENCES [dbo].[tbl_eem_estado_envio_mensaje](eem_codigo);

ALTER TABLE tbl_hem_historial_envio_mensaje
ADD CONSTRAINT FK_HIS_ENVIO_MEN_ENVIO_MENSAJE
FOREIGN KEY (hem_codevm) REFERENCES [dbo].[tbl_evm_envio_mensaje](evm_codigo);


--[dbo].[tbl_plm_plantilla_mensaje]
ALTER TABLE tbl_plm_plantilla_mensaje
ADD CONSTRAINT FK_PLANTILLA_TIPO_PLANTILLA
FOREIGN KEY ([plm_codtpm]) REFERENCES [dbo].[tbl_tpm_tipo_plantilla_mensaje](tpm_codigo);