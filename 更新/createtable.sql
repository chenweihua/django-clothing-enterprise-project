use SKLCC


CREATE TABLE sklcc_measure_size
	(
	id bigint NOT NULL IDENTITY (1, 1),
	employeeno nvarchar(20) NULL,
	createtime nvarchar(50) NULL,
	size nvarchar(100) NULL,
	size_name nvarchar(50) NULL
	)  ON [PRIMARY]
ALTER TABLE sklcc_measure_size ADD CONSTRAINT
	PK_Table_1 PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]




-----添加工艺员的员工号信息

ALTER TABLE [SKLCC].dbo.sklcc_style_measure ADD
	employeeno nvarchar(30) NULL,
	serial int NULL

UPDATE sklcc_authority set url = 'recheck/&measure_force_recheck/' where authorityid = 1;

UPDATE sklcc_authority set url = url + '&measure_check/' where authorityid = 4 or authorityid = 5;

insert into sklcc_authority( authorityid, authorityname, url )
values( 25, '工艺测量汇总', 'form13/' );

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
EXECUTE sp_rename N'dbo.sklcc_measure_info.barcode', N'Tmp_contentid', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.sklcc_measure_info.Tmp_contentid', N'contentid', 'COLUMN' 
GO
COMMIT
