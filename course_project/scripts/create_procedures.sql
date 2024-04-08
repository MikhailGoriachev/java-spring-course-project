create schema if not exists watch_shop_goriachev;

use watch_shop_goriachev;

-- создание процедуры, для получения данных о состоянии склада на заданное число 
drop procedure if exists stock_watches_by_date;
create procedure stock_watches_by_date(in date_in date)
begin
    select id,
           name,
           manufacture_id,
           watch_type_id,
           amount
    from (select w.watch_id,
                 sum(w.sum) as amount
          from (select watches.id as watch_id, ifnull(sum(amount), 0) as sum
                from watches
                         left join (select * from purchases where date <= date_in) p on watches.id = p.watch_id
                group by watches.id
                union
                select watches.id as watch_id, -ifnull(sum(amount), 0) as sum
                from watches
                         left join (select * from sales where date <= date_in) p on watches.id = p.watch_id
                group by watches.id) as w
          group by w.watch_id) as res
             join watches on res.watch_id = watches.id;
end;

-- создание процедуры, для получения данных о состоянии склада на заданное число по идентификатору часов
drop procedure if exists stock_watches_by_date_and_watch_id;
create procedure stock_watches_by_date_and_watch_id(in date_in date, in watch_id_in int)
begin
    select id,
           name,
           manufacture_id,
           watch_type_id,
           amount
    from (select w.watch_id,
                 sum(w.sum) as amount
          from (select watches.id as watch_id, ifnull(sum(amount), 0) as sum
                from watches
                         left join (select *
                                    from purchases
                                    where purchases.watch_id = watch_id_in
                                      and date <= date_in) p
                                   on watches.id = p.watch_id
                where watches.id = watch_id_in
                group by watches.id
                union all
                select watches.id as watch_id, -ifnull(sum(amount), 0) as sum
                from watches
                         left join (select *
                                    from sales
                                    where sales.watch_id = watch_id_in
                                      and date <= date_in) p
                                   on watches.id = p.watch_id
                where watches.id = watch_id_in
                group by watches.id) as w
          group by w.watch_id) as res
             join watches on res.watch_id = watches.id;
end;

-- создание процедуры, для получения данных о состоянии склада на заданное число по идентификатору часов
-- исключая из продаж текущую запись (необходимо при редактировании)
drop procedure if exists stock_watches_by_date_and_watch_id_without_sale_id;
create procedure stock_watches_by_date_and_watch_id_without_sale_id(in date_in date, in watch_id_in int, in sale_id_in int)
begin
    select id,
           name,
           manufacture_id,
           watch_type_id,
           amount
    from (select w.watch_id,
                 sum(w.sum) as amount
          from (select watches.id as watch_id, ifnull(sum(amount), 0) as sum
                from watches
                         left join (select *
                                    from purchases
                                    where purchases.watch_id = watch_id_in
                                      and date <= date_in) p
                                   on watches.id = p.watch_id
                where watches.id = watch_id_in
                group by watches.id
                union all
                select watches.id as watch_id, -ifnull(sum(amount), 0) as sum
                from watches
                         left join (select *
                                    from sales
                                    where sales.id != sale_id_in and sales.watch_id = watch_id_in
                                      and date <= date_in) p
                                   on watches.id = p.watch_id
                where watches.id = watch_id_in
                group by watches.id) as w
          group by w.watch_id) as res
             join watches on res.watch_id = watches.id;
end;