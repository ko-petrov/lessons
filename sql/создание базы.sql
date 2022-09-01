CREATE DATABASE ����
go

USE ����

CREATE TABLE [��������]
( 
	[��_��������]        varchar(8)  NOT NULL PRIMARY KEY,
	[����]               integer  NULL ,
	[����_�����]        datetime  NULL ,
	[�������]            varchar(20)  NULL ,
	[Email]              varchar(20)  NULL ,
	[�����]              varchar(40)  NULL ,
	[���]                varchar(40)  NULL 
)
go

CREATE TABLE [�������]
( 
	[��_�������]         varchar(8)  NOT NULL PRIMARY KEY ,
	[������]             varchar(20)  NULL ,
	[����_�������]       datetime  NULL ,
	[���_������������]   integer  NULL ,
	[������_�������]     integer  NULL ,
	[����_������]        integer  NULL 
)
go

CREATE TABLE [��������]
( 
	[��_��������]        varchar(8)  NOT NULL PRIMARY KEY ,
	[��_��������]        varchar(8)  NOT NULL REFERENCES [��������]([��_��������]),
	[���_�����]          varchar(20)  NULL 
)
go

CREATE TABLE [���������]
( 
	[��_���������]       varchar(8)  NOT NULL PRIMARY KEY,
	[��_��������]        varchar(8)  NOT NULL REFERENCES [��������]([��_��������])
)
go

CREATE TABLE [�������]
( 
	[��_�������]         varchar(8)  NOT NULL PRIMARY KEY,
	[�����_��������]     varchar(8)  NULL ,
	[��������]           integer  NULL ,
	[�����_���������]    integer  NULL ,
	[��������_������]    datetime  NULL ,
	[�����������_������] datetime  NULL ,
	[���_��_���������]   integer  NULL ,
	[�������������]      float  NULL 
)
go

CREATE TABLE [�������]
( 
	[��_�������]         varchar(8)  NOT NULL PRIMARY KEY,
	[��_��������]        varchar(8)  NOT NULL REFERENCES [��������]([��_��������])
)
go

CREATE TABLE [�����]
( 
	[��_�������]         varchar(8)  NOT NULL REFERENCES [�������]([��_�������]),
	[����]               datetime  NOT NULL ,
	[��_�������]         varchar(8)  NOT NULL REFERENCES [�������]([��_�������]),
	CONSTRAINT [XPK�����] PRIMARY KEY ([����],[��_�������],[��_�������])
)
go

CREATE TABLE [���������]
( 
	[��_���������]       varchar(8)  NOT NULL PRIMARY KEY,
	[��������]           varchar(20)  NULL ,
	[�����]              varchar(40)  NULL ,
	[����������]         varchar(40)  NULL 
)
go

CREATE TABLE [���������_�������]
( 
	[��_�������]         varchar(8)  NOT NULL REFERENCES [�������]([��_�������]),
	[��_���������]       varchar(8)  NOT NULL REFERENCES [���������]([��_���������]),
	CONSTRAINT [XPK���������_�������] PRIMARY KEY ([��_�������],[��_���������])
)
go

CREATE TABLE [����]
( 
	[��_�������]         varchar(8)  NOT NULL REFERENCES [�������]([��_�������]),
	[��_����]            varchar(8)  NOT NULL PRIMARY KEY,
	[��_��������]        varchar(8)  NOT NULL REFERENCES [��������]([��_��������]),
	[��_�������]         varchar(8)  NOT NULL REFERENCES [�������]([��_�������]),
	[��_���������]       varchar(8)  NOT NULL REFERENCES [���������]([��_���������]),
	[������]             varchar(8)  NULL ,
	[������]             datetime  NULL ,
	[�����������]        datetime  NULL ,
	[��������_���]       integer  NULL ,
	[GPS_����]           varchar(40)  NULL 
)
go

CREATE TABLE [������_������]
( 
	[������_������]      varchar(20)  NOT NULL PRIMARY KEY,
	[����]               varchar(20)  NULL 
)
go

CREATE TABLE [���������_�����]
( 
	[��_���������]       varchar(8)  NOT NULL PRIMARY KEY,
	[����_������]        datetime  NULL ,
	[����_���������]     datetime  NULL 
)
go

CREATE TABLE [�������]
( 
	[��_����]            varchar(8)  NOT NULL REFERENCES [����]([��_����]),
	[��_�������]         varchar(8)  NOT NULL PRIMARY KEY ,
	[��_���������]       varchar(8)  NULL REFERENCES [���������_�����]([��_���������]),
	[������_������]      varchar(20)  NULL REFERENCES [������_������]([������_������]),
	[����_�����]         datetime  NULL 
)
go

CREATE TABLE [���_������������]
( 
	[��_�������]         varchar(8)  NOT NULL REFERENCES [�������]([��_�������]),
	[����]               datetime  NOT NULL ,
	[��_�������]         varchar(8)  NOT NULL REFERENCES [�������]([��_�������]),
	[��������]           varchar(60)  NULL 
)
go