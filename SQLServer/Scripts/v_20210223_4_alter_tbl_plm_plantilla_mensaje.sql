
alter table [dbo].[tbl_plm_plantilla_mensaje]
drop column [plm_titulo]

alter table [dbo].[tbl_plm_plantilla_mensaje]
add  [plm_asunto] nvarchar(255)

alter table [dbo].[tbl_plm_plantilla_mensaje]
drop column [plm_esHTML]

alter table [dbo].[tbl_plm_plantilla_mensaje]
drop column [plm_cuerpo]

alter table [dbo].[tbl_plm_plantilla_mensaje]
add  [plm_contenido_html] nvarchar(MAX)

alter table [dbo].[tbl_plm_plantilla_mensaje]
add  [plm_contenido_plano] nvarchar(MAX)