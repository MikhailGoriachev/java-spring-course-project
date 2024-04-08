create schema if not exists watch_shop_goriachev;

use watch_shop_goriachev;

-- удаление таблиц
drop table if exists purchases;
drop table if exists sales;
drop table if exists sellers;
drop table if exists watches;
drop table if exists watch_types;
drop table if exists manufactures;
drop table if exists countries;

-- страны
create table if not exists countries
(
    id   int         not null auto_increment primary key,
    name varchar(50) not null unique -- название страны
);

-- производители
create table if not exists manufactures
(
    id         int         not null auto_increment primary key,
    name       varchar(50) not null unique, -- наименование производителя
    country_id int         not null,        -- страна

    constraint fk_manufactures_countries foreign key (country_id) references countries (id)
);

-- типы часов
create table if not exists watch_types
(
    id   int         not null auto_increment primary key,
    name varchar(50) not null unique -- наименование типа
);

-- часы
create table if not exists watches
(
    id             int          not null auto_increment primary key,
    name           nvarchar(50) not null, -- марка (название часов)
    manufacture_id int          not null, -- производитель
    watch_type_id  int          not null, -- тип часов

    constraint fk_watches_manufactures foreign key (manufacture_id) references manufactures (id),
    constraint fk_watches_watch_types foreign key (watch_type_id) references watch_types (id)
);

-- закупки
create table if not exists purchases
(
    id       int  not null auto_increment primary key,
    date     date not null, -- дата закупки
    watch_id int  not null, -- часы
    price    int  not null, -- цена
    amount   int  not null, -- количество

    constraint fk_purchases_watches foreign key (watch_id) references watches (id)
);

-- продавцы
create table if not exists sellers
(
    id         int         not null auto_increment primary key,
    surname    varchar(60) not null, -- фамилия
    name       varchar(60) not null, -- имя
    patronymic varchar(60),          -- отчество (необязательно для заполнения)
    interest   float       not null  -- процент отчислений
);

-- продажи
create table if not exists sales
(
    id        int  not null auto_increment primary key,
    date      date not null, -- дата закупки
    watch_id  int  not null, -- часы
    seller_id int  not null, -- продавец
    price     int  not null, -- цена
    amount    int  not null, -- количество

    constraint fk_sales_watches foreign key (watch_id) references watches (id),
    constraint fk_sales_sellers foreign key (seller_id) references sellers (id)
);
