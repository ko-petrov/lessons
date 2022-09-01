CREATE DATABASE Парк
go

USE Парк

CREATE TABLE [Персонал]
( 
	[ИД_Персонал]        varchar(8)  NOT NULL PRIMARY KEY,
	[Стаж]               integer  NULL ,
	[Дата_приёма]        datetime  NULL ,
	[Телефон]            varchar(20)  NULL ,
	[Email]              varchar(20)  NULL ,
	[Адрес]              varchar(40)  NULL ,
	[ФИО]                varchar(40)  NULL 
)
go

CREATE TABLE [Автобус]
( 
	[ИД_автобус]         varchar(8)  NOT NULL PRIMARY KEY ,
	[Модель]             varchar(20)  NULL ,
	[Дата_покупки]       datetime  NULL ,
	[Год_производства]   integer  NULL ,
	[Расход_топлива]     integer  NULL ,
	[Срок_службы]        integer  NULL 
)
go

CREATE TABLE [Водитель]
( 
	[ИД_водитель]        varchar(8)  NOT NULL PRIMARY KEY ,
	[ИД_Персонал]        varchar(8)  NOT NULL REFERENCES [Персонал]([ИД_Персонал]),
	[Вод_удост]          varchar(20)  NULL 
)
go

CREATE TABLE [Диспетчер]
( 
	[ИД_диспетчер]       varchar(8)  NOT NULL PRIMARY KEY,
	[ИД_Персонал]        varchar(8)  NOT NULL REFERENCES [Персонал]([ИД_Персонал])
)
go

CREATE TABLE [Маршрут]
( 
	[ИД_маршрут]         varchar(8)  NOT NULL PRIMARY KEY,
	[Номер_маршрута]     varchar(8)  NULL ,
	[Интервал]           integer  NULL ,
	[Нужно_автобусов]    integer  NULL ,
	[Начинает_ходить]    datetime  NULL ,
	[Заканчивает_ходить] datetime  NULL ,
	[Кол_во_остановок]   integer  NULL ,
	[Протяженность]      float  NULL 
)
go

CREATE TABLE [Механик]
( 
	[ИД_механик]         varchar(8)  NOT NULL PRIMARY KEY,
	[ИД_Персонал]        varchar(8)  NOT NULL REFERENCES [Персонал]([ИД_Персонал])
)
go

CREATE TABLE [Мойка]
( 
	[ИД_механик]         varchar(8)  NOT NULL REFERENCES [Механик]([ИД_механик]),
	[Дата]               datetime  NOT NULL ,
	[ИД_автобус]         varchar(8)  NOT NULL REFERENCES [Автобус]([ИД_автобус]),
	CONSTRAINT [XPKМойка] PRIMARY KEY ([Дата],[ИД_механик],[ИД_автобус])
)
go

CREATE TABLE [Остановка]
( 
	[ИД_остановка]       varchar(8)  NOT NULL PRIMARY KEY,
	[Название]           varchar(20)  NULL ,
	[Адрес]              varchar(40)  NULL ,
	[Координаты]         varchar(40)  NULL 
)
go

CREATE TABLE [Остановка_Маршрут]
( 
	[ИД_маршрут]         varchar(8)  NOT NULL REFERENCES [Маршрут]([ИД_маршрут]),
	[ИД_остановка]       varchar(8)  NOT NULL REFERENCES [Остановка]([ИД_остановка]),
	CONSTRAINT [XPKОстановка_Маршрут] PRIMARY KEY ([ИД_маршрут],[ИД_остановка])
)
go

CREATE TABLE [Рейс]
( 
	[ИД_автобус]         varchar(8)  NOT NULL REFERENCES [Автобус]([ИД_автобус]),
	[ИД_рейс]            varchar(8)  NOT NULL PRIMARY KEY,
	[ИД_водитель]        varchar(8)  NOT NULL REFERENCES [Водитель]([ИД_водитель]),
	[ИД_маршрут]         varchar(8)  NOT NULL REFERENCES [Маршрут]([ИД_маршрут]),
	[ИД_диспетчер]       varchar(8)  NOT NULL REFERENCES [Диспетчер]([ИД_диспетчер]),
	[Статус]             varchar(8)  NULL ,
	[Начало]             datetime  NULL ,
	[Заверешение]        datetime  NULL ,
	[Пройдено_ост]       integer  NULL ,
	[GPS_трек]           varchar(40)  NULL 
)
go

CREATE TABLE [Способ_оплаты]
( 
	[Способ_оплаты]      varchar(20)  NOT NULL PRIMARY KEY,
	[Цена]               varchar(20)  NULL 
)
go

CREATE TABLE [Проездной_билет]
( 
	[ИД_проездной]       varchar(8)  NOT NULL PRIMARY KEY,
	[Дата_начала]        datetime  NULL ,
	[Дата_окончания]     datetime  NULL 
)
go

CREATE TABLE [Поездка]
( 
	[ИД_рейс]            varchar(8)  NOT NULL REFERENCES [Рейс]([ИД_рейс]),
	[ИД_поездка]         varchar(8)  NOT NULL PRIMARY KEY ,
	[ИД_проездной]       varchar(8)  NULL REFERENCES [Проездной_билет]([ИД_проездной]),
	[Способ_оплаты]      varchar(20)  NULL REFERENCES [Способ_оплаты]([Способ_оплаты]),
	[Дата_время]         datetime  NULL 
)
go

CREATE TABLE [Тех_обслуживание]
( 
	[ИД_механик]         varchar(8)  NOT NULL REFERENCES [Механик]([ИД_механик]),
	[Дата]               datetime  NOT NULL ,
	[ИД_автобус]         varchar(8)  NOT NULL REFERENCES [Автобус]([ИД_автобус]),
	[Описание]           varchar(60)  NULL 
)
go